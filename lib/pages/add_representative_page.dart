import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/providers/representative_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddRepresentativePage extends StatefulWidget {

  @override
  _AddRepresentativePageState createState() => _AddRepresentativePageState();
}

class _AddRepresentativePageState extends State<AddRepresentativePage> {
  bool _isLoading=false;
  int address = 1;

  TextEditingController representativeNameText = TextEditingController(text: '');
  TextEditingController companyNameText = TextEditingController(text: '');
  TextEditingController phoneNumberText = TextEditingController(text: '');
  TextEditingController passwordText = TextEditingController(text: '');
  TextEditingController emailText = TextEditingController(text: '');
  TextEditingController nidText = TextEditingController(text: '');
  TextEditingController dobText = TextEditingController(text: '');
  TextEditingController addressText = TextEditingController(text: '');
  TextEditingController executiveNameText = TextEditingController(text: '');
  TextEditingController executivePhoneText = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final RepresentativeProvider provider = Provider.of<RepresentativeProvider>(context);
    final id = phoneNumberText.text;
    String date = DateFormat("dd-MMM-yyyy/hh:mm:aa").format(DateTime.
    fromMicrosecondsSinceEpoch(DateTime
        .now()
        .microsecondsSinceEpoch));
    Map<String,String> map ={
    'id':id,
    'representativeName':representativeNameText.text,
    'companyName':companyNameText.text,
    'phoneNumber':phoneNumberText.text,
    'password':passwordText.text,
    'email':emailText.text,
    'nid':nidText.text,
    'dob': dobText.text,
    'address':addressText.text,
    'executiveName':executiveNameText.text,
    'executivePhone':executivePhoneText.text,
    'date': date,
    };
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20),
            _textFormBuilder('Representative Name','Email',provider),
            SizedBox(height: 20),
            _textFormBuilder('Company Name','Nid',provider),
            SizedBox(height: 20),
            _textFormBuilder('Phone Number','Executive Name',provider),
            SizedBox(height: 20),
            _textFormBuilder('Password','Executive Phone',provider),
            SizedBox(height: 20),
            Row(
              children: [
                ///Date Of Birth...
                Expanded(
                  child: Container(
                    height: size.height * .075,
                    width: size.width * .2,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width *
                                  0.03),
                          //width: MediaQuery.of(context).size.width * 0.10,
                          child: Text("Date of Birth",
                              style: TextStyle(
                                  color: Colors.grey[10], fontSize: 15)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.01,
                          child: Text(":", style: colonTextStyle()),
                        ),
                        Container(
                          height: 40,
                          width: size.width*.2,
                          child: TextFormField(
                            decoration: FormDecorationWithoutPrefix.copyWith(
                                alignLabelWithHint: true,
                                labelText: "dd-mm-yyyy", fillColor: Color(0xffF4F7F5),
                                hintText: ''
                            ),
                            onChanged: (val) {
                              setState(() {
                                dobText.text=val;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ///Address...
                Expanded(
                  child: Container(
                    height: size.height * .07,
                    width: size.width * .3,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: address,
                      decoration: FormDecorationWithoutPrefix.copyWith(
                          fillColor: Color(0xffF4F7F5),
                          hintText: "Address"),
                      onChanged: (String val) {
                        if (val.length >= 40) setState(() => address = 2);
                        if (val.length >= 80) setState(() => address = 4);
                        if (val.length >= 160) setState(() => address = 7);
                        setState(() {
                          addressText.text =
                              val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            ///Submit Button...

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                _isLoading? spinWave():GradientButton(
                    child: Text('Submit Button'),
                    onPressed: ()async{
                      setState(() {
                        _isLoading=true;
                      });
                      await provider.addRepresentative(map,id,context).then((value){
                        setState(() {
                          _isLoading=false;
                        });
                      });
                    }, borderRadius: 3.0,
                    height: size.height*.05,
                    width: size.width*.2,
                    gradientColors: [
                      Theme.of(context).primaryColor,
                      Colors.teal.shade300
                    ]),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }

  Widget _textFormBuilder(String hint,String hint1,RepresentativeProvider provider) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: size.width*.3,
          child: TextFormField(
            keyboardType: hint == 'Phone Number' ? TextInputType.number :TextInputType.text,
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint, fillColor: Color(0xffF4F7F5),
                hintText: ''
            ),
            onChanged: (val) {
              setState(() {
                if(hint=="Representative Name") representativeNameText.text=val;
                if(hint=='Company Name') companyNameText.text=val;
                if(hint=='Phone Number') phoneNumberText.text=val;
                if(hint=='Password') passwordText.text=val;
              });
            },
          ),
        ),
        SizedBox(width: 30),
        Container(
          height: 50,
          width: size.width*.3,
          child: TextFormField(
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint1, fillColor: Color(0xffF4F7F5),
                hintText: ''
            ),
            onChanged: (val) {
              setState(() {
                if(hint1=='Email') emailText.text=val;
                if(hint1=='Nid') nidText.text=val;
                if(hint1=='Executive Name') executiveNameText.text=val;
                if(hint1=='Executive Phone') executivePhoneText.text=val;
              });
            },
          ),
        ),
      ],
    );
  }
}
