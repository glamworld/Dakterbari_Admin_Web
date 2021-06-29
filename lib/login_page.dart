import 'package:admin_panel_web/main_page.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/routing_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => _LogInPageState();
}
class _LogInPageState extends State<LogInPage> {
  TextEditingController _phone= TextEditingController();
  TextEditingController _password= TextEditingController();
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      body:Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_bg2.jpg'),
                fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Container(
            height: size.height*.7,
            width: size.height*.6,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/admin_logo.png',height: size.height*.08,width: size.height*.08,),
                    Text('Dakterbari ',
                      style: TextStyle(fontFamily: 'pattaya',fontSize: size.height*.035,color: Colors.grey[900]),),
                    Text('Admin',
                        style: TextStyle(fontFamily: 'pattaya',fontSize: size.height*.035,color: Color(0xffF87700)))
                  ],
                ),
                SizedBox(height: size.height*.03),

                Container(
                  width: size.height*.35,
                  child: TextFormField(
                    controller: _phone,
                    style: TextStyle(
                        fontSize: size.height*.02
                    ),
                    decoration: formDecoration(size).copyWith(
                      labelText: 'Enter Phone Number',
                    ),
                  ),
                ),
                SizedBox(height: size.height*.02),
                Container(
                  width: size.height*.35,
                  child: TextFormField(
                    controller: _password,
                    style: TextStyle(
                        fontSize: size.height*.02
                    ),
                    decoration: formDecoration(size).copyWith(
                      labelText: 'Enter Password',
                    ),
                  ),
                ),
                SizedBox(height: size.height*.04),

                _isLoading? spinWave(): GradientButton(
                    child: Text('Log In',
                        style: TextStyle(fontSize: size.height*.022,color: Colors.white)),
                    onPressed: ()async{
                      if(_phone.text.isNotEmpty && _password.text.isNotEmpty){
                        setState(()=> _isLoading=true);
                        publicProvider.validateAdmin(context, _phone.text,_password.text).then((value)async{
                          if(value){
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString('phone', _phone.text);
                            setState(()=> _isLoading=false);
                            Navigator.pushAndRemoveUntil(context, AnimationPageRoute(navigateTo: MainPage()), (route) => false);
                          }else{
                            setState(()=> _isLoading=false);
                            showToast('Invalid Phone or Password');
                          }
                        });
                      }else showToast('Enter Phone Number');
                    },
                    borderRadius: 3.0,
                    height: size.height*.05,
                    width: size.height*.35,
                    gradientColors: [
                      Theme.of(context).primaryColor,
                      Colors.teal.shade300
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
