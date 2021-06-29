import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WriteBlogPage extends StatefulWidget {

  @override
  _WriteBlogPageState createState() => _WriteBlogPageState();
}

class _WriteBlogPageState extends State<WriteBlogPage> {
  String phoneNo='';
  bool _isLoading=false;
  int _counter=0;
  //File?  _articleImageFile;
  String? name;
  String? error;
  Uint8List? data;
  //final picker = ImagePicker();
  var file;

  _initializedData(BlogProvider provider){
    setState(()=>_counter++);
    provider.articleModel.category=null;
    provider.articleModel.title='';
    provider.articleModel.abstract='';
    provider.articleModel.introduction='';
    provider.articleModel.methods='';
    provider.articleModel.results='';
    provider.articleModel.conclusion='';
    provider.articleModel.acknowledgement='';
    provider.articleModel.reference='';
    _checkPreferences();
  }
  void _checkPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNo = preferences.getString('phone')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final BlogProvider provider = Provider.of<BlogProvider>(context);
    if(_counter==0) _initializedData(provider);
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
                      file==null? Icon(Icons.add_photo_alternate,
                          size: 30, color: Color(0xffBCEDF2))
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
                      file==null? Text(
                        "Select an image for this article",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ):Container()
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
                        value: provider.articleModel.category,
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
                        onChanged: (newValue)=> setState(() => provider.articleModel.category = newValue as String),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ///Title...
                  _textFormBuilder('Title','Results',provider),
                  SizedBox(height: 20),

                  SizedBox(height: 20),


                  _textFormBuilder('Abstract','Conclusion',provider),
                  SizedBox(height: 20),

                  _textFormBuilder('Introduction','Acknowledgements',provider),
                  SizedBox(height: 20),

                  _textFormBuilder('Methods','References',provider),
                  SizedBox(height: 20),


                  ///Submit Button...
                  _isLoading
                      ? spinWave()
                      : GradientButton(
                      child: Text('Submit Article'),
                      onPressed: () async {
                        _checkValidity(provider);
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

  Widget _textFormBuilder(String hint,String hint1,BlogProvider provider) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width*.3,
          child: TextFormField(
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
                if (hint == 'Title') provider.articleModel.title=val;
                if (hint == 'Abstract') provider.articleModel.abstract=val;
                if (hint == 'Introduction') provider.articleModel.introduction=val;
                if (hint == 'Methods') provider.articleModel.methods=val;
              });
            },
          ),
        ),
        SizedBox(width: 30),
        Container(
          width: size.width*.3,
          child: TextFormField(
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
                if (hint1 == 'Results') provider.articleModel.results=val;
                if (hint1 == 'Conclusion') provider.articleModel.conclusion=val;
                if (hint1 == 'Acknowledgements') provider.articleModel.acknowledgement=val;
                if (hint1 == 'References') provider.articleModel.reference=val;
              });
            },
          ),
        ),
      ],
    );
  }

  _checkValidity(BlogProvider provider){
    final phone= '+880'+phoneNo;
    if(file!=null){
      if(provider.articleModel.title!.isNotEmpty
          && provider.articleModel.category!=null
          && provider.articleModel.abstract!.isNotEmpty
          && provider.articleModel.introduction!.isNotEmpty
          && provider.articleModel.methods!.isNotEmpty
          && provider.articleModel.results!.isNotEmpty
          && provider.articleModel.conclusion!.isNotEmpty
          && provider.articleModel.acknowledgement!.isNotEmpty
          && provider.articleModel.reference!.isNotEmpty){
        setState(() {
          _isLoading=true;
        });
        Future.delayed(Duration(seconds: 2), ()async {
          provider.submitArticle(provider,file,phone.toString()).then((value){
            setState(() {
              _isLoading=false;
            });
          });
        });

      }else{
        setState(() {
          _isLoading=false;
        });
        showToast('Fill the required fields');
      }
    }else {
      setState(() {
        _isLoading=false;
      });
      showToast('Select article image');
    }
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

