import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBlogPage extends StatefulWidget {
  @override
  _UpdateBlogPageState createState() => _UpdateBlogPageState();
}

class _UpdateBlogPageState extends State<UpdateBlogPage> {
  bool _isLoading=false;
  int _counter = 0;
  String? category;
  String? name;
  String? error;
  Uint8List? data;
  String? authorPhoto;
  var file;
  TextEditingController idText = TextEditingController(text: '');
  //TextEditingController photoUrlText = TextEditingController(text: '');
  TextEditingController dateText = TextEditingController(text: '');
  TextEditingController titleText = TextEditingController(text: '');
  TextEditingController authorText = TextEditingController(text: '');
  TextEditingController likeText = TextEditingController(text: '');
  TextEditingController shareText = TextEditingController(text: '');
  TextEditingController abstractText = TextEditingController(text: '');
  TextEditingController stateText = TextEditingController(text: '');
  TextEditingController introductionText = TextEditingController(text: '');
  TextEditingController methodsText = TextEditingController(text: '');
  TextEditingController resultsText = TextEditingController(text: '');
  TextEditingController conclusionText = TextEditingController(text: '');
  TextEditingController acknowledgementText = TextEditingController(text: '');
  TextEditingController referenceText = TextEditingController(text: '');
  TextEditingController doctorIdText = TextEditingController(text: '');

  void _initializeTextFormData(PublicProvider publicProvider){
    setState(() => _counter++);
    idText = TextEditingController(text: publicProvider.articleModel.id);
    dateText = TextEditingController(text:publicProvider.articleModel.date);
    titleText = TextEditingController(text: publicProvider.articleModel.title);
    authorText = TextEditingController(text: publicProvider.articleModel.author);
    //authorPhoto = publicProvider.articleModel.authorPhoto!;//TextEditingController(text: publicProvider.articleModel.authorPhoto);
    likeText = TextEditingController(text: publicProvider.articleModel.like);
    shareText = TextEditingController(text: publicProvider.articleModel.share);
    abstractText = TextEditingController(text: publicProvider.articleModel.abstract);
    stateText = TextEditingController(text: publicProvider.articleModel.state);
    introductionText = TextEditingController(text: publicProvider.articleModel.introduction);
    methodsText = TextEditingController(text: publicProvider.articleModel.methods);
    resultsText = TextEditingController(text: publicProvider.articleModel.results);
    conclusionText = TextEditingController(text: publicProvider.articleModel.conclusion);
    acknowledgementText = TextEditingController(text: publicProvider.articleModel.acknowledgement);
    referenceText = TextEditingController(text: publicProvider.articleModel.reference);
    doctorIdText = TextEditingController(text: publicProvider.articleModel.doctorId);
    category=publicProvider.articleModel.category!;
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final BlogProvider provider = Provider.of<BlogProvider>(context);
    if (_counter == 0) _initializeTextFormData(publicProvider);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height*.9,
      color: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            ///Article Image...
            GestureDetector(
              onTap: () =>pickedImage(),
              child: Container(
                  margin: EdgeInsets.only(left: 380, right: 380),
                  height: size.height*.15,
                  width: size.width*.2,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      file==null? CachedNetworkImage(
                  imageUrl: publicProvider.articleModel.photoUrl!,
                    placeholder: (context, url) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                    fit: BoxFit.fill,
                  )
                          :Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(
                                data!,
                              ),

                            )
                        ),
                        height: size.height*.15,
                        width: size.width*.3,
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 20,),
            ///Article Form...
            Container(
              height: size.height*1,
              width: size.width*.3,
              //margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  ///Category Dropdown...
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 50,
                    width: size.width*.3,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: category,
                        isExpanded: true,
                        hint: Text("Select Article Category",style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16)),
                        items: StaticVariables.articleCategoryItems.map((category){
                          return DropdownMenuItem(
                            child: Text(category,style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,)),
                            value: category,
                          );
                        }).toList(),
                        onChanged: (newValue){
                          setState(() {
                            category = newValue as String;
                            publicProvider.articleModel.category=newValue;
                          });
                          },
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ///Title...
                  _textFormBuilder('Title','Results',publicProvider),
                  SizedBox(height: 20),

                  SizedBox(height: 20),


                  _textFormBuilder('Abstract','Conclusion',publicProvider),
                  SizedBox(height: 20),

                  _textFormBuilder('Introduction','Acknowledgements',publicProvider),
                  SizedBox(height: 20),

                  _textFormBuilder('Methods','References',publicProvider),
                  SizedBox(height: 20),


                  ///Submit Button...
                  _isLoading
                      ? spinWave()
                      : GradientButton(
                      child: Text('Update Article'),
                      onPressed: () async {
                        setState(() {
                          _isLoading=true;
                        });
                        if (file != null) {
                          provider.updateBlog(
                              publicProvider, file).then((value){
                            setState(() {
                              _isLoading=false;
                            });
                          });
                        } else {
                          provider.updateBlogDetails(
                              publicProvider).then((value){
                            setState(() {
                              _isLoading=false;
                            });
                          });
                        }
                      },
                      borderRadius: 3.0,
                      height: size.height * .05,
                      width: size.width * .2,
                      gradientColors: [
                        Theme.of(context).primaryColor,
                        Colors.teal.shade300
                      ]),
                  SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _textFormBuilder(String hint,String hint1,PublicProvider provider) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width*.3,
          child: TextFormField(
            controller: hint=='Title'?titleText:
            hint=='Abstract'?abstractText:
            hint=='Introduction'?introductionText:
            hint=='Methods'?methodsText:null,
            keyboardType: TextInputType.multiline,
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint, fillColor: Color(0xffF4F7F5),
                hintText: 'Write $hint'
            ),
            validator: (val)=>val!.isEmpty? "Enter $hint":null,
            maxLines: hint == 'Title'
                ? 2 : 5,

            onChanged: (val) {
              setState(() {
                if (hint == 'Title') provider.articleModel.title=titleText.text;
                if (hint == 'Abstract') provider.articleModel.abstract=abstractText.text;
                if (hint == 'Introduction') provider.articleModel.introduction=introductionText.text;
                if (hint == 'Methods') provider.articleModel.methods=methodsText.text;
              });
            },
          ),
        ),
        SizedBox(width: 30),
        Container(
          width: size.width*.3,
          child: TextFormField(
            controller: hint1=='Results'?resultsText:
            hint1=='Conclusion'?conclusionText:
            hint1=='Acknowledgements'?acknowledgementText:
            hint1=='References'?referenceText:null,
            keyboardType: TextInputType.multiline,
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint1, fillColor: Color(0xffF4F7F5),
                hintText: 'Write $hint1'
            ),
            validator: (val)=>val!.isEmpty? "Enter $hint1":null,
            maxLines: hint == 'Title'
                ? 2 : 5,

            onChanged: (val) {
              setState(() {
                if (hint1 == 'Results') provider.articleModel.results=resultsText.text;
                if (hint1 == 'Conclusion') provider.articleModel.conclusion=conclusionText.text;
                if (hint1 == 'Acknowledgements') provider.articleModel.acknowledgement=acknowledgementText.text;
                if (hint1 == 'References') provider.articleModel.reference=referenceText.text;
              });
            },
          ),
        ),
      ],
    );
  }

  pickedImage() async {
    html.FileUploadInputElement input = html.FileUploadInputElement()
      ..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      file = input.files!.first;
      final reader1 =   html.FileReader();
      reader1.readAsDataUrl(input.files![0]);
      reader1.onError.listen((err) => setState((){
        error = err.toString();
      }) );
      reader1.onLoad.first.then((res){
        final encoded = reader1.result as String;
        final stripped = encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        setState(() {
          name = input.files![0].name;
          data  =base64.decode(stripped);
          error = null;
        });
      });
    });
  }
}
