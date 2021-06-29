import 'package:admin_panel_web/providers/discount_shop_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html' as html;
import 'package:provider/provider.dart';

class FeaturedProduct extends StatefulWidget {

  String? id;

  FeaturedProduct({this.id});

  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  bool _isLoading = false;
  String? name;
  String? error;
  Uint8List? data;
  var file;

  void _initializeFeaturedData(DiscountShopProvider auth) {
    auth.featuredProductModel.imageUrl = '';
    auth.featuredProductModel.productName = '';
    auth.featuredProductModel.productPrice = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);

    pickedImage() async {
      html.FileUploadInputElement input = html.FileUploadInputElement()
        ..accept = 'image/*';
      input.click();
      input.onChange.listen((event) {
        file = input.files!.first;
        final reader1 = html.FileReader();
        reader1.readAsDataUrl(input.files![0]);
        reader1.onError.listen((err) =>
            setState(() {
              error = err.toString();
            }));
        reader1.onLoad.first.then((res) {
          final encoded = reader1.result as String;
          final stripped = encoded.replaceFirst(
              RegExp(r'data:image/[^;]+;base64,'), '');
          setState(() {
            name = input.files![0].name;
            data = base64.decode(stripped);
            error = null;
          });
        });
      });
    }

    return Consumer <DiscountShopProvider>(builder: (context, auth, child) {
      if (auth.featuredProductModel.imageUrl == null ||
          auth.featuredProductModel.productName == null ||
          auth.featuredProductModel.productPrice == null) {
        _initializeFeaturedData(auth);
      }

      return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,

        child: SingleChildScrollView(
            child: Column(
              children: [
                ///Featured Product Form...
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Column(
                      children: [

                        ///Featured Product Picture

                        Padding(
                          padding: const EdgeInsets.only(top:15.0),
                          child: Container(
                            width: size.width*.3,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F7F5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pickedImage(),
                                  child: Container(
                                      height: size.height * .15,
                                      width: size.width * .5,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F7F5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          file == null ? Icon(
                                              Icons.add_photo_alternate,
                                              size: 30, color: Color(0xffBCEDF2))
                                              : Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: MemoryImage(
                                                    data!,
                                                  ),

                                                )
                                            ),
                                            height: size.height * .15,
                                            width: size.width * .3,
                                          ),
                                          file == null ? Text(
                                            "Select Shop Profile Picture",
                                            style: TextStyle(color: Theme
                                                .of(context)
                                                .primaryColor),
                                          ) : Container()
                                        ],
                                      )),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Container(
                          height: 50,
                          width: size.width*.5,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: FormDecorationWithoutPrefix.copyWith(
                                hintText: "Featured Product Name",
                                fillColor: Color(0xffF4F7F5)),
                            onChanged: (val) {
                              setState(() {
                                auth.featuredProductModel.productName = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: size.width*.5,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: FormDecorationWithoutPrefix.copyWith(
                                  hintText: "Featured Product Price",
                                  fillColor: Color(0xffF4F7F5)),
                              onChanged: (val){
                                setState(() {
                                  auth.featuredProductModel.productPrice = val;
                                });
                              },
                          ),
                        ),
                        SizedBox(height: 20),

                        ///Submit Button...
                        _isLoading? spinWave():GradientButton(
                            child: Text('Add Featured Product'),
                            onPressed: ()async{
                              _checkValidity(auth,publicProvider.featuredProductModel.id!,context);
                            }, borderRadius: 3.0,
                            height: size.height*.05,
                            width: size.width*.2,
                            gradientColors: [
                              Theme.of(context).primaryColor,
                              Colors.teal.shade300
                            ]),
                      ]),
                )
              ],
            ),
          ),
        );
    });
  }

  Future<void> _checkValidity(DiscountShopProvider auth,String id,BuildContext context) async {
    try {
      if (auth.featuredProductModel.imageUrl!=null &&
          auth.featuredProductModel.productName!.isNotEmpty &&
          auth.featuredProductModel.productPrice!.isNotEmpty)
      {
        setState(() {
          _isLoading=true;
        });
        bool result = await auth.addFeaturedProduct(auth,auth.featuredProductModel,id,file);
        if (result) {
          setState(() {
            _isLoading=false;
          });
        } else {
          showToast('Error adding product. Try again');
        }
      } else
        showToast('Complete all the required fields');
    } catch (error) {
      showToast(error.toString());
    }
  }
}
