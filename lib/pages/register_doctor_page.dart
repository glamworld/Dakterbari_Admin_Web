import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/form_decoration.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterDoctorPage extends StatefulWidget {

  @override
  _RegisterDoctorPageState createState() => _RegisterDoctorPageState();
}

class _RegisterDoctorPageState extends State<RegisterDoctorPage> {
  bool _isLoading=false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController minController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minController = TextEditingController(text: '15 min');
  }

  void _initializeDoctorData(DoctorProvider auth){
    auth.doctorDetails.provideTeleService=false;
    auth.doctorDetails.phone='';
    auth.doctorDetails.fullName='';
    auth.doctorDetails.password='';
    auth.doctorDetails.degree='';
    auth.doctorDetails.bmdcNumber='';
    auth.doctorDetails.appFee='';
    auth.doctorDetails.teleFee='';
    auth.doctorDetails.countryCode='';
    //Initialize teleService date
    auth.doctorDetails.sat=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.sun=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.mon=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.tue=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.wed=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.thu=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.doctorDetails.fri=[false,TimeOfDay.now(),TimeOfDay.now()];
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Consumer<DoctorProvider>(
      builder: (context, auth, child){
        if(auth.doctorDetails.sat==null || auth.doctorDetails.provideTeleService==null ||auth.doctorDetails.phone==null){
          _initializeDoctorData(auth);
        }
        return Container(
          width: publicProvider.pageWidth(size),
          height: size.height,
          color: Colors.white,
          alignment: Alignment.center,
          child:_bodyUI(context,auth),
        );
      },
    );
  }
  Widget _bodyUI(BuildContext context, DoctorProvider auth) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(left: 20, right: 20),
      height: size.height,
      width: size.width,
      child: ListView(
        children: [

          //Form
          Container(
            padding:EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                //Mobile number with country code
                Container(
                  width: size.width*.3,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F7F5),
                    borderRadius:  BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 50,
                          width: size.width*.1,
                          child: _countryCodePicker(auth)
                      ),
                      Container(
                          height: 50,
                          width: size.width*.2,
                          child: _textFieldBuilder('Phone Number',auth)),
                    ],
                  ),
                ),
                SizedBox(height: size.width / 30),
                //Full name
                _textFieldBuilder('Full Name',auth),
                SizedBox(height: size.width / 30),

                //Password
                _textFieldBuilder('Password',auth),
                SizedBox(height: size.width / 30),

                _dropDownBuilder('Select Gender',auth),
                SizedBox(height: size.width / 30),

                _dropDownBuilder('Select Speciality & Services',auth),
                SizedBox(height: size.width / 30),

                _textFieldBuilder('Degree',auth),
                SizedBox(height: size.width / 30),

                _textFieldBuilder('BMDC Registration Number',auth),
                SizedBox(height: size.width / 30),
                _dropDownBuilder('Select Currency', auth),
                SizedBox(height: size.width / 30),
                _textFieldBuilder('Appointment Fee',auth),
                SizedBox(height: size.width / 30),

                //Telemedicine Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("If provide telemedicine service",
                                style: TextStyle(color: Colors.grey[700],fontSize: 16),
                              )
                          ),
                        ],
                      ),
                    ),
                    Switch(value: auth.doctorDetails.provideTeleService!, onChanged: (newValue)=>
                        setState(()=>auth.doctorDetails.provideTeleService = newValue))
                  ],
                ),
                SizedBox(height: size.width / 40),
                auth.doctorDetails.provideTeleService==true? Text(
                  "Telemedicine schedule",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ):Container(),
                auth.doctorDetails.provideTeleService==true? Divider(color: Theme.of(context).primaryColor):Container(),

                auth.doctorDetails.provideTeleService==true? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _availability('Sat',auth),
                    _availability('Sun',auth),
                    _availability('Mon',auth),
                    _availability('Tue',auth),
                    _availability('Wed',auth),
                    _availability('Thu',auth),
                    _availability('Fri',auth),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dropDownBuilder('Select Currency', auth),
                        //Text("With tax if applicable",style: TextStyle(color: Colors.grey[700],fontSize: 13),),
                        SizedBox(width: 10),
                        _textFieldBuilder('Tele Service Fee',auth),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(color: Theme.of(context).primaryColor,)
                  ],
                ):Container(),

                SizedBox(height: size.width / 20),

                //Continue Button
                GestureDetector(
                  onTap: ()=>_checkValidity(auth),
                  child: _isLoading? spinWave():Button(context, "Continue"),
                ),
                SizedBox(height: size.width / 20),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _availability(String day,DoctorProvider auth){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      //padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Day Check Button
          Row(
            children: [
              Checkbox(
                value: day=='Sat'?auth.doctorDetails.sat![0]:day=='Sun'?auth.doctorDetails.sun![0]:day=='Mon'?auth.doctorDetails.mon![0]:
                day=='Tue'?auth.doctorDetails.tue![0]:day=='Wed'?auth.doctorDetails.wed![0]:day=='Thu'?auth.doctorDetails.thu![0]:
                auth.doctorDetails.fri![0],
                onChanged: (bool? checkedValue) {
                  setState(() =>
                  day=='Sat'?auth.doctorDetails.sat![0] = checkedValue:
                  day=='Sun'?auth.doctorDetails.sun![0]= checkedValue:
                  day=='Mon'?auth.doctorDetails.mon![0]= checkedValue:
                  day=='Tue'?auth.doctorDetails.tue![0]= checkedValue:
                  day=='Wed'?auth.doctorDetails.wed![0]= checkedValue:
                  day=='Thu'?auth.doctorDetails.thu![0]= checkedValue: auth.doctorDetails.fri![0]= checkedValue);
                },
              ),
              Text(
                day,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]),
              )
            ],
          ),
          //Time Button
          Row(
            children: [
              FlatButton(
                onPressed: (){
                  _selectTime(context, 'from', day,auth);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Row(
                    children: [
                      Text(day=="Sat"?'${auth.doctorDetails.sat![1].hour}:${auth.doctorDetails.sat![1].minute}':
                      day=="Sun"?'${auth.doctorDetails.sun![1].hour}:${auth.doctorDetails.sun![1].minute}':
                      day=="Mon"?'${auth.doctorDetails.mon![1].hour}:${auth.doctorDetails.mon![1].minute}':
                      day=="Tue"?'${auth.doctorDetails.tue![1].hour}:${auth.doctorDetails.tue![1].minute}':
                      day=="Wed"?'${auth.doctorDetails.wed![1].hour}:${auth.doctorDetails.wed![1].minute}':
                      day=="Thu"?'${auth.doctorDetails.thu![1].hour}:${auth.doctorDetails.thu![1].minute}':
                      '${auth.doctorDetails.fri![1].hour}:${auth.doctorDetails.fri![1].minute}',
                        style: TextStyle(fontSize: 12,),),

                      Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).primaryColor)
                    ],
                  ),
                ),
              ),
              Text("to",style: TextStyle(fontSize: 12),),
              FlatButton(
                onPressed: (){
                  _selectTime(context, 'to', day, auth);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Row(
                    children: [
                      Text(day=="Sat"?'${auth.doctorDetails.sat![2].hour}:${auth.doctorDetails.sat![2].minute}':
                      day=="Sun"?'${auth.doctorDetails.sun![2].hour}:${auth.doctorDetails.sun![2].minute}':
                      day=="Mon"?'${auth.doctorDetails.mon![2].hour}:${auth.doctorDetails.mon![2].minute}':
                      day=="Tue"?'${auth.doctorDetails.tue![2].hour}:${auth.doctorDetails.tue![2].minute}':
                      day=="Wed"?'${auth.doctorDetails.wed![2].hour}:${auth.doctorDetails.wed![2].minute}':
                      day=="Thu"?'${auth.doctorDetails.thu![2].hour}:${auth.doctorDetails.thu![2].minute}':
                      '${auth.doctorDetails.fri![2].hour}:${auth.doctorDetails.fri![2].minute}',
                        style: TextStyle(fontSize: 12,),),

                      Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).primaryColor)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text('15 min',style: TextStyle(fontSize: size.width*.01),)
        ],
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context, String identifier,String day,DoctorProvider auth) async{
    if(identifier=="from"){
      switch(day){
        case 'Sat':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.sat![1],
          ))!;
          if(picked!=auth.doctorDetails.sat![1]){
            setState(() =>auth.doctorDetails.sat![1] = picked);
          }
          break;
        case 'Sun':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.sun![1],
          ))!;
          if(picked!=auth.doctorDetails.sun![1]){
            setState(() =>auth.doctorDetails.sun![1] = picked);
          }
          break;
        case 'Mon':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.mon![1],
          ))!;
          if(picked!=auth.doctorDetails.mon![1]){
            setState(() =>auth.doctorDetails.mon![1] = picked);
          }
          break;
        case 'Tue':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.tue![1],
          ))!;
          if(picked!=auth.doctorDetails.tue![1]){
            setState(() =>auth.doctorDetails.tue![1] = picked);
          }
          break;
        case 'Wed':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.wed![1],
          ))!;
          if(picked!=auth.doctorDetails.wed![1]){
            setState(() =>auth.doctorDetails.wed![1] = picked);
          }
          break;
        case 'Thu':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.thu![1],
          ))!;
          if(picked!=auth.doctorDetails.thu![1]){
            setState(() =>auth.doctorDetails.thu![1] = picked);
          }
          break;
        default:
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.fri![1],
          ))!;
          if(picked!=auth.doctorDetails.fri![1]){
            setState(() =>auth.doctorDetails.fri![1] = picked);
          }
          break;

      }
    }else{
      switch(day){
        case 'Sat':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.sat![2],
          ))!;
          if(picked!=auth.doctorDetails.sat![2]){
            setState(() =>auth.doctorDetails.sat![2] = picked);
          }
          break;
        case 'Sun':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.sun![2],
          ))!;
          if(picked!=auth.doctorDetails.sun![2]){
            setState(() =>auth.doctorDetails.sun![2] = picked);
          }
          break;
        case 'Mon':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.mon![2],
          ))!;
          if(picked!=auth.doctorDetails.mon![2]){
            setState(() =>auth.doctorDetails.mon![2] = picked);
          }
          break;
        case 'Tue':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.tue![2],
          ))!;
          if(picked!=auth.doctorDetails.tue![2]){
            setState(() =>auth.doctorDetails.tue![2] = picked);
          }
          break;
        case 'Wed':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.wed![2],
          ))!;
          if(picked!=auth.doctorDetails.wed![2]){
            setState(() =>auth.doctorDetails.wed![2] = picked);
          }
          break;
        case 'Thu':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.thu![2],
          ))!;
          if(picked!=auth.doctorDetails.thu![2]){
            setState(() =>auth.doctorDetails.thu![2] = picked);
          }
          break;
        default:
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.doctorDetails.fri![2],
          ))!;
          if(picked!=auth.doctorDetails.fri![2]){
            setState(() =>auth.doctorDetails.fri![2] = picked);
          }
          break;

      }
    }
  }

  Widget _dropDownBuilder(String hint,DoctorProvider auth){
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width*.3,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF4F7F5),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: hint=="Select Gender"? auth.doctorDetails.gender
              : hint=="Select Currency"? auth.doctorDetails.currency
              :auth.doctorDetails.specification,
          hint: Text(hint,style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16)),
          items: hint=='Select Gender'?
          StaticVariables.genderItems.map((gender){
            return DropdownMenuItem(
              child: Text(gender,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,)),
              value: gender,
            );
          }).toList()
              :hint=='Select Currency'?
          StaticVariables.currency.map((currency){
            return DropdownMenuItem(
              child: Text(currency,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,)),
              value: currency,
            );
          }).toList()
          //for service category
              :StaticVariables.medicalCategoryList.map((category){
            return DropdownMenuItem(
              child: Text(category,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,)),
              value: category,
            );
          }).toList(),
          onChanged: (String? newValue){
            setState(() {
              hint=="Select Gender"? auth.doctorDetails.gender = newValue
                  :hint=="Select Currency"? auth.doctorDetails.currency = newValue
                  :auth.doctorDetails.specification=newValue;
            });
          },

          dropdownColor: Colors.white,
        ),
      ),
    );
  }

  Widget _textFieldBuilder(String hint,DoctorProvider auth){
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width*.3,
      child: TextFormField(
        obscureText:hint=='Password'? auth.obscure:false,
        keyboardType: hint=='Phone Number'? TextInputType.phone
            :hint=='Full Name'?TextInputType.text
            :hint=='BMDC Registration Number'?TextInputType.text
            :hint=='Degree'?TextInputType.text
            :hint=='Password'?TextInputType.text
            :TextInputType.number,
        onChanged: (val){
          setState(() {
            hint=='Phone Number'? auth.doctorDetails.phone=val
                :hint=='Full Name'? auth.doctorDetails.fullName=val
                :hint=='Appointment Fee'?auth.doctorDetails.appFee=val
                :hint=='Password'?auth.doctorDetails.password=val
                :hint=='Degree'? auth.doctorDetails.degree=val
                :hint=='BMDC Registration Number'? auth.doctorDetails.bmdcNumber=val
                :auth.doctorDetails.teleFee=val;
          });
        },
        decoration: FormDecoration.copyWith(
            labelText: hint,
            hintStyle: TextStyle(fontSize: 14),
            fillColor: Color(0xffF4F7F5),
            prefixIcon:hint=='Full Name'?Icon(Icons.person_outline,size: 28)
                :hint=='Phone Number'?null
                :hint=='Password'?Icon(Icons.security_outlined)
                :hint=='Degree'? Icon(CupertinoIcons.archivebox)
                :hint=='BMDC Registration Number'? Icon(CupertinoIcons.number)
                : null,

            suffixIcon: hint=='Password'? IconButton(
                icon: auth.obscure
                    ? Icon(Icons.visibility_off_rounded)
                    : Icon(Icons.remove_red_eye),
                onPressed: () =>
                    setState(() => auth.obscure = !auth.obscure)):null
        ),
      ),
    );
  }

  Widget _countryCodePicker(DoctorProvider auth){
    return CountryCodePicker(
      comparator: (a, b) =>
          b.name!.compareTo(a.name!),
      onChanged: (val) {
        auth.doctorDetails.countryCode = val.dialCode;
        //print(countryCode);
      },
      onInit: (code) {
        auth.doctorDetails.countryCode = code!.dialCode;
        //print(countryCode);
      },
      favorite: ['+880', 'BD'],
      initialSelection: 'BD',
      showCountryOnly: false,
      showFlag: true,
      showOnlyCountryWhenClosed: false,
      showDropDownButton: true,
      padding: EdgeInsets.only(left: 10),
    );
  }

  Future<void> _checkValidity(DoctorProvider auth) async{
    if(auth.doctorDetails.provideTeleService!){
      if(auth.doctorDetails.phone!.isNotEmpty && auth.doctorDetails.fullName!.isNotEmpty && auth.doctorDetails.password!.isNotEmpty &&
          auth.doctorDetails.gender!=null &&auth.doctorDetails.currency!=null &&auth.doctorDetails.appFee!.isNotEmpty&& auth.doctorDetails.specification!=null &&
          auth.doctorDetails.teleFee!.isNotEmpty && auth.doctorDetails.degree!.isNotEmpty && auth.doctorDetails.bmdcNumber!.isNotEmpty){
        setState(() {
          _isLoading=true;
        });
        await auth.addDoctor(auth.doctorDetails,context,_scaffoldKey).then((value){
          setState(() {
            _isLoading=false;
          });
          auth.getDoctor();
        });

      }else showToast('Complete all the required fields');
    }else{
      if(auth.doctorDetails.phone!.isNotEmpty && auth.doctorDetails.fullName!.isNotEmpty && auth.doctorDetails.password!.isNotEmpty &&
          auth.doctorDetails.gender!=null && auth.doctorDetails.currency!=null && auth.doctorDetails.appFee!.isNotEmpty&& auth.doctorDetails.specification!=null &&
          auth.doctorDetails.degree!.isNotEmpty && auth.doctorDetails.bmdcNumber!.isNotEmpty){
        setState(() {
          _isLoading=true;
        });
        await auth.addDoctor(auth.doctorDetails,context,_scaffoldKey).then((value){
          setState(() {
            _isLoading=false;
          });
          auth.getDoctor();
        });
      }else showToast('Complete all the required fields');
    }
  }

}

