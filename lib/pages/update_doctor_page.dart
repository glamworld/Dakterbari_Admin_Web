import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/form_decoration.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class UpdateDoctorPage extends StatefulWidget {
  @override
  _UpdateDoctorPageState createState() => _UpdateDoctorPageState();
}

class _UpdateDoctorPageState extends State<UpdateDoctorPage> {
  bool _isLoading=false;
  int _counter =0;
  List<dynamic> optSpecificationList=[];
  final _specificFormKey = GlobalKey<FormState>();

  TextEditingController spController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController teleFeeController = TextEditingController();
  TextEditingController appFeeController = TextEditingController();
  TextEditingController serviceAtController = TextEditingController();
  TextEditingController specificationController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController totalPrescribeController = TextEditingController();


  void _initializeTextFormData(DoctorProvider operation){
    setState(()=>_counter++);
    nameController.text = operation.doctorId[0].fullName ?? '';
    phoneController.text = operation.doctorId[0].id ?? '';
    emailController.text = operation.doctorId[0].email ?? '';
    passController.text= operation.doctorId[0].password ?? '';
    aboutController.text = operation.doctorId[0].about ?? '';
    expController.text = operation.doctorId[0].experience ?? '';
    teleFeeController.text = operation.doctorId[0].teleFee ?? '';
    appFeeController.text = operation.doctorId[0].appFee ?? '';
    specificationController.text=operation.doctorId[0].specification ?? '';
    degreeController.text=operation.doctorId[0].degree ?? '';
    totalPrescribeController.text=operation.doctorId[0].totalPrescribe ?? '00';
    operation.doctorDetails.fullName=operation.doctorId[0].fullName ?? '';
    operation.doctorDetails.email=operation.doctorId[0].email ?? '';
    operation.doctorDetails.about=operation.doctorId[0].about ??'';
    operation.doctorDetails.experience=operation.doctorId[0].experience ??'';
    operation.doctorDetails.teleFee=operation.doctorId[0].teleFee ??'';
    operation.doctorDetails.appFee=operation.doctorId[0].appFee ??'';
    operation.doctorDetails.country=operation.doctorId[0].country ??'';
    operation.doctorDetails.state=operation.doctorId[0].state ??'';
    operation.doctorDetails.city=operation.doctorId[0].city ??'';
    operation.doctorDetails.degree=operation.doctorId[0].degree ??'';
    optSpecificationList = operation.doctorId[0].optionalSpecification??[];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    DoctorProvider operation = Provider.of<DoctorProvider>(context);
    if(_counter==0)_initializeTextFormData(operation);
    return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///Doctor Details
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: size.width / 20),
                      _buildTextForm("Full name", Icons.person,operation),
                      SizedBox(height: size.width / 20),
                      _buildTextForm("Phone number", Icons.phone_android_outlined,operation),
                      SizedBox(height: size.width / 20),
                      _buildTextForm("Email address", Icons.mail,operation),
                      SizedBox(height: size.width / 20),
                      _buildTextForm("Password", Icons.security,operation),
                      SizedBox(height: size.width / 20),
                      _buildTextForm("About", Icons.error_outlined,operation),
                      SizedBox(height: size.width / 20),

                      ///Address builder
                      Container(
                          width: size.width*.5,
                          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                          decoration: BoxDecoration(
                              color: Color(0xffF2F8F4),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address',style: TextStyle(color: Colors.grey[700])),
                              SizedBox(height: 5),
                              operation.doctorId[0].country==null&&operation.doctorId[0].state==null?Text(
                                'Country, State, City',
                              ):Text('${operation.doctorId[0].country??''}, ${operation.doctorId[0].state??''},'
                                  ' ${operation.doctorId[0].city??''}')
                            ],
                          )
                      ),
                      SizedBox(height: size.width / 20),
                    ],
                  ),
                ),

                ///Country, State, City picker
                Container(
                  width: size.width*.5,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffF2F8F4),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Change Address',style: TextStyle(color: Colors.grey[700])),
                        SelectState(
                          dropdownColor:Colors.white,
                          style: TextStyle(color: Color(0xff008D74),fontWeight: FontWeight.w500,),
                          onCountryChanged: (value) {
                            setState(() {
                              operation.doctorDetails.country = value;
                            });
                          },
                          onStateChanged:(value) {
                            setState(() {
                              operation.doctorDetails.state = value;
                            });
                          },
                          onCityChanged:(value) {
                            setState(() {
                              operation.doctorDetails.city = value;
                            });
                          },
                        ),
                      ],
                    )
                ),
                SizedBox(height: size.width / 40),

                ///Experience & fees...
                Container(
                  width: size.width*.5,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: size.width / 20
                      ),
                      Text(
                        "Specification, Experience & Fee",
                        style: TextStyle(
                            fontSize: size.width*.015,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          height: size.width / 20
                      ),
                      _buildTextForm('Specification', Icons.cleaning_services, operation),

                      operation.doctorId[0].optionalSpecification!=null?
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xffF4F7F5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        child: ListView.builder(
                          itemCount: operation.doctorId[0].optionalSpecification.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                child: Text('\u25c6 ${operation.doctorId[0].optionalSpecification[index]}',
                                  style: TextStyle(color: Colors.grey[900],fontSize: 15),)
                            );
                          },
                        ),
                      )
                          :Container(),
                      SizedBox(height: size.width / 40),
                      operation.doctorId[0].optionalSpecification!=null?
                      Container(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: ()async{
                              showToast('Please wait..');
                              await operation.removeDoctorSpecifications(operation,operation.doctorId[0].id).then((value){
                                optSpecificationList=[];
                              });
                            },
                            child: Text('Remove all',style: TextStyle(color: Colors.redAccent,fontSize: 15,fontWeight: FontWeight.w500),)),
                      ):Container(),

                      ///Add specifications button
                      Container(
                          width: size.width * .30,
                          color: Colors.white,
                          child: InkWell(
                              onTap: ()=>_addSpecification(operation,size),
                              splashColor: Colors.cyan[200],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: outlineIconButton(context, Icons.add, 'Add more', Theme.of(context).primaryColor))),
                      SizedBox(height: size.width / 20),

                      _buildTextForm('Degree', Icons.work, operation),
                      SizedBox(
                          height: size.width / 20
                      ),
                      _buildTextForm("Year of experience", Icons.work,operation),
                      SizedBox(
                          height: size.width / 20
                      ),
                      _buildTextForm("Total Prescribed", Icons.edit,operation),
                      SizedBox(
                          height: size.width / 20
                      ),
                      _buildTextForm("Appointment fee", Icons.monetization_on,operation),
                      SizedBox(
                          height: size.width / 20
                      ),
                      _buildTextForm("Telemedicine service fee", Icons.monetization_on,operation),

                    ],
                  ),
                ),
                SizedBox(height: size.width / 20),

                ///Update button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isLoading? spinWave():GradientButton(
                          child: Text('Update Information'),
                          onPressed: ()async{
                            showToast('Updating information...');
                            operation.updateDoctorInformation(operation);
                          }, borderRadius: 3.0,
                          height: size.height*.05,
                          width: size.width*.2,
                          gradientColors: [
                            Theme.of(context).primaryColor,
                            Colors.teal.shade300
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: size.width / 40),

                ///Telemedicine service schedule...
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.width / 20,
                      ),
                      Text(
                        "Telemedicine service schedule",
                        style: TextStyle(
                            fontSize: size.width*.015,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                      // SizedBox(
                      //   height: size.width / 20,
                      // ),

                      operation.doctorId[0].provideTeleService==true? Container(
                          margin: EdgeInsets.only(top: 10),
                          child:
                          Text(
                            '${operation.doctorId[0].sat.isEmpty?'':'Sat: ${operation.doctorId[0].sat[0]}-${operation.doctorId[0].sat[1]}  ||  '}'
                                '${operation.doctorId[0].sun.isEmpty?'':'Sun: ${operation.doctorId[0].sun[0]}-${operation.doctorId[0].sun[1]}  ||  '}'
                                '${operation.doctorId[0].mon.isEmpty?'':'Mon: ${operation.doctorId[0].mon[0]}-${operation.doctorId[0].mon[1]}  ||  '}'
                                 '${operation.doctorId[0].tue.isEmpty?'':'Tue: ${operation.doctorId[0].tue[0]}-${operation.doctorId[0].tue[1]}  ||  '}'
                                '${operation.doctorId[0].wed.isEmpty?'':'Wed: ${operation.doctorId[0].wed[0]}-${operation.doctorId[0].wed[1]}  ||  '}'
                                '${operation.doctorId[0].thu.isEmpty?'':'Thu: ${operation.doctorId[0].thu[0]}-${operation.doctorId[0].thu[1]}  ||  '}'
                                '${operation.doctorId[0].fri.isEmpty?'':'Fri: ${operation.doctorId[0].fri[0]}-${operation.doctorId[0].fri[1]}  ||  '}',
                          )
                      )
                          :Padding(
                        padding: const EdgeInsets.only(bottom: 10,top: 10),
                        child: Text('You don\'t provide telemedicine service yet !',style: TextStyle(color: Color(0xffF0A732),fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: size.width / 40),

                      ///Add schedule button
                      Container(
                          width:operation.doctorId[0].provideTeleService? size.width * .41: size.width * .35,
                          //margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _isLoading? spinWave():GradientButton(
                                  child: Text(operation.doctorId[0].provideTeleService? 'Update schedule' :'Add schedule'),
                                  onPressed: ()async{
                                    operation.getDoctorId(operation.doctorId[0].id).then((value){
                                      publicProvider.category=publicProvider.subCategory;
                                      publicProvider.subCategory='Update Doctor Schedule';
                                    });
                                  }, borderRadius: 3.0,
                                  height: size.height*.05,
                                  width: size.width*.2,
                                  gradientColors: [
                                    Theme.of(context).primaryColor,
                                    Colors.teal.shade300
                                  ])
                            ],
                          ),
                      )],
                  ),
                ),
                SizedBox(height: size.width / 40),

                ///Service at...
                Container(
                  width: size.width*.5,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.width / 20,
                      ),
                      Text(
                        "Service at",
                        style: TextStyle(
                            fontSize: size.width*.015,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                      operation.hospitalList.isEmpty? Padding(
                        padding: const EdgeInsets.only(bottom: 10,top: 10),
                        child: Text('No hospital/chamber added yet !',style: TextStyle(color: Color(0xffF0A732),fontWeight: FontWeight.w500),),
                      )
                          : Container(
                        margin: EdgeInsets.only(top: 10),
                        child: AnimationLimiter(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: operation.hospitalList.length>2?2: operation.hospitalList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    horizontalOffset: 400,
                                    child: FadeInAnimation(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        child: HospitalTile(index: index),
                                      ),),
                                  )
                              );
                            },
                          ),
                        ),
                      ),
                      operation.hospitalList.length>2? Container(
                        width: size.width,
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: ()=> _viewAllChamberScheduleModal(context,operation),
                          child: Container(
                            child: Text("View all",textAlign: TextAlign.end,style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ):Container(),
                      SizedBox(height: size.width / 40),

                      ///Add hospital button
                      Container(
                          width: size.width * .20,
                          //margin: EdgeInsets.symmetric(horizontal: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _isLoading? spinWave():GradientButton(
                                  child: Text('Add Hospital'),
                                  onPressed: ()async{
                                    operation.getDoctorId(operation.doctorId[0].id).then((value){
                                      publicProvider.category=publicProvider.subCategory;
                                      publicProvider.subCategory='Add Hospitals';
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
                      ),
                      //_buildTextForm("Service at", Icons.location_on,operation),
                      SizedBox(
                        height: size.width / 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.width / 40),


              ],
            ),
          ),
        ),
    );
  }

  Widget _buildTextForm(String hint, IconData prefixIcon, DoctorProvider operation) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width*.5,
      child: TextFormField(

        maxLines: hint=='About'?4:null,
        readOnly: hint=='Phone number'?true
            :hint=='Specification'?true
            :hint=="Total Prescribed"?true
            :false,

        controller: hint=='Full name'? nameController
            :hint=='Phone number'?phoneController
            :hint=='Email address'?emailController
            :hint=='Password'?passController
            :hint=='About'?aboutController
            :hint=='Year of experience'?expController
            :hint=='Appointment fee'?appFeeController
            :hint=='Specification'?specificationController
            :hint=='Degree'?degreeController
            :hint=="Total Prescribed"?totalPrescribeController
            :teleFeeController,
        initialValue: null,
        decoration: FormDecoration.copyWith(
            alignLabelWithHint: true,
            labelText: hint,
            //labelStyle: TextStyle(fontSize: size.width*.016),
            prefixIcon: hint=='About' || hint=='Specification'?null: Icon(prefixIcon),
            fillColor: Color(0xffF4F7F5)),
        keyboardType: TextInputType.text,
        onChanged: (value){
          if(hint=='About') operation.doctorDetails.about=aboutController.text;
          else if(hint=='Full name') operation.doctorDetails.fullName=nameController.text;
          else if(hint=='Email address') operation.doctorDetails.email=emailController.text;
          else if(hint=='Password') operation.doctorDetails.password=passController.text;
          else if(hint=='Year of experience') operation.doctorDetails.experience=expController.text;
          else if(hint=='Appointment fee') operation.doctorDetails.appFee=appFeeController.text;
          else if(hint=='Telemedicine service fee') operation.doctorDetails.teleFee=teleFeeController.text;
          else if(hint=='Specification') operation.doctorDetails.specification=specificationController.text;
          else if(hint=='Degree') operation.doctorDetails.degree=degreeController.text;
        },

      ),
    );
  }


  void _addSpecification(DoctorProvider operation, Size size){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          Size size=MediaQuery.of(context).size;
          return AlertDialog(
            scrollable: true,
            title: Text('Add more specifications',style: TextStyle(fontSize: size.width*.039),),
            content: Container(
              child: Form(
                key: _specificFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(fontSize: size.width*.036),
                      controller: spController,
                      validator: (val)=>val!.isEmpty?'Enter specifications':null,
                      decoration: FormDecoration.copyWith(
                          alignLabelWithHint: true,
                          labelText: 'Write specifications',
                          labelStyle: TextStyle(fontSize: size.width*.033),
                          prefixIcon: null,
                          fillColor: Color(0xffF4F7F5)),
                    ),
                    SizedBox(height: size.width / 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          color: Colors.redAccent,
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width*.033
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () async{
                            if(_specificFormKey.currentState!.validate()){
                              optSpecificationList.add(spController.text);
                              showToast('Adding specification...');
                              await operation.updateDoctorSpecifications(operation, optSpecificationList,operation.doctorId[0].id);
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width*.033),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  ///Chamber Schedule Modal
  void _viewAllChamberScheduleModal(BuildContext context,DoctorProvider drProvider){
    Size size= MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              ),
              color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  //Color(0xffF4F7F5),
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Icon(Icons.clear,color: Colors.grey[100],size: 30,),
                  )
              ),

              Expanded(
                child: AnimationLimiter(
                  child: ListView.builder(
                      itemCount: drProvider.hospitalList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              horizontalOffset: 400,
                              child: FadeInAnimation(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: HospitalTile(index:index,fromModal: 'modal'),
                                ),),
                            )
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}

// ignore: must_be_immutable
class HospitalTile extends StatelessWidget {
  int? index;String? fromModal;
  HospitalTile({this.index,this.fromModal});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle common = TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Theme.of(context).primaryColor);
    return Consumer<DoctorProvider>(
      builder: (context, operation, child){
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          title: Text(operation.hospitalList[index].hospitalName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //address
              Text(operation.hospitalList[index].hospitalAddress,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
              Text(
                '${operation.hospitalList[index].sat==null?'':'Sat: ${operation.hospitalList[index].sat[0]}-${operation.hospitalList[index].sat[1]}  ||  '}'
                    '${operation.hospitalList[index].sun==null?'':'Sun: ${operation.hospitalList[index].sun[0]}-${operation.hospitalList[index].sun[1]}  ||  '}'
                    '${operation.hospitalList[index].mon==null?'':'Mon: ${operation.hospitalList[index].mon[0]}-${operation.hospitalList[index].mon[1]}  ||  '}'
                    '${operation.hospitalList[index].tue==null?'':'Tue: ${operation.hospitalList[index].tue[0]}-${operation.hospitalList[index].tue[1]}  ||  '}'
                    '${operation.hospitalList[index].wed==null?'':'Wed: ${operation.hospitalList[index].wed[0]}-${operation.hospitalList[index].wed[1]}  ||  '}'
                    '${operation.hospitalList[index].thu==null?'':'Thu: ${operation.hospitalList[index].thu[0]}-${operation.hospitalList[index].thu[1]}  ||  '}'
                    '${operation.hospitalList[index].fri==null?'':'Fri: ${operation.hospitalList[index].fri[0]}-${operation.hospitalList[index].fri[1]}  ||  '}',
                style: common,
              )
            ],
          ),
          trailing: InkWell(
            onTap: (){
              if(fromModal=='modal'){
                Navigator.pop(context);
                showToast('Removing hospitals...');
                operation.removeHospitalFromDB(context, operation.hospitalList[index].id, index!);
                Navigator.pop(context);

              }else{
                showToast('Removing hospitals...');
                operation.removeHospitalFromDB(context, operation.hospitalList[index].id, index!);
              }
            },
            child: Icon(
              Icons.cancel_presentation,
              color: Colors.red[400],
            ),
          ),
        );
      },
    );
  }
}
