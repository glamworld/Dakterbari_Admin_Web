import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/discount_shop_provider.dart';
import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/patient_provider.dart';
import 'package:admin_panel_web/providers/problem_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashBoardPage extends StatefulWidget {

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _counter=0;
  bool _isLoading=true;

  Future<void> _customInit(DoctorProvider doctorProvider)async{
    setState(()=>_counter++);
    await doctorProvider.getDoctor().then((value){
      setState(()=>_isLoading=false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final DoctorProvider doctorProvider = Provider.of<DoctorProvider>(context);
    final PatientProvider patientProvider = Provider.of<PatientProvider>(context);
    final DiscountShopProvider discountShopProvider = Provider.of<DiscountShopProvider>(context);
    final BlogProvider blogProvider = Provider.of<BlogProvider>(context);
    final ProblemProvider problemProvider = Provider.of<ProblemProvider>(context);
    final MedicineProvider medicineProvider = Provider.of<MedicineProvider>(context);
    if(_counter==0) _customInit(doctorProvider);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.grey.shade50,
      alignment: Alignment.center,
      child: GridView(
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        //physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width<700?3: 4,
          childAspectRatio: 1.4
        ),
        children: [
          _gridViewTile(size,FontAwesomeIcons.userMd,Color(0xff00A958),
              'Total Doctor','New Doctor','${doctorProvider.allDoctorList.length}','${doctorProvider.newDoctorList.length}'),
          _gridViewTile(size,FontAwesomeIcons.userInjured,Color(0xff00B5C9),
              'Total Patient','New Patient','${patientProvider.allPatientList.length}','${patientProvider.newPatientList.length}'),
          _gridViewTile(size,FontAwesomeIcons.storeAlt,Color(0xffFF8C00),
              'Total Discount Shop','','${discountShopProvider.allShopList.length}',''),
          _gridViewTile(size,FontAwesomeIcons.solidNewspaper,Color(0xff00A958),
              'All Blog','Pending Blog','${blogProvider.allArticleList.length}','${blogProvider.pendingArticleList.length}'),
          _gridViewTile(size,FontAwesomeIcons.exclamationTriangle,Color(0xffF0A732),
              'Doctor Problem','Patient Problem','${problemProvider.doctorProblemList.length}','${problemProvider.patientsProblemList.length}'),
          _gridViewTile(size,FontAwesomeIcons.capsules,Color(0xffA9D626),
              'Total Medicine','','${medicineProvider.medicineList.length}',''),
          // _gridViewTile(size,FontAwesomeIcons.calendarCheck,Color(0xffAD30B1),
          //     'Total Appointments','','50',''),
        ],
      ),
    );
  }

  Widget _gridViewTile(Size size,IconData iconData, Color bgColor,
      String heading1, String heading2, String h1Data, String h2Data){
    return Stack(
      children: [
        Container(
          width: size.height*.5,
          height: size.height*.21,
          margin: EdgeInsets.only(top: size.height*.05,left: size.height*.02,right: size.height*.02),
          padding: EdgeInsets.symmetric(horizontal: size.height*.02,vertical: size.height*.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5)
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(heading1,style: TextStyle(color: Colors.grey,fontSize: size.height*.018,fontWeight: FontWeight.w400),),
                  Text(h1Data,style: TextStyle(color: Colors.grey[900],fontSize: size.height*.030,fontWeight: FontWeight.w400)),
                  SizedBox(height: size.height*.01),
                  Text(heading2,style: TextStyle(color: Colors.grey,fontSize: size.height*.018,fontWeight: FontWeight.w400),),
                  Text(h2Data,style: TextStyle(color: Colors.grey[900],fontSize: size.height*.030,fontWeight: FontWeight.w400)),
                  Divider(height: 3,thickness: 0.2,color: Colors.grey),
                ],
              ),
              TextButton(
                  onPressed: (){},
                  child: Text('View All',style: TextStyle(fontSize: size.height*.016,fontWeight: FontWeight.w400))
              )
            ],
          ),
        ),
        Positioned(
          left: size.height*.04,
          top: size.height*.02,
          child: Container(
            height: size.height*.1,
            width: size.height*.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 10,
                  )
                ]
            ),
            child: Icon(iconData,color: Colors.white,size: size.height*.045),
          ),
        )
      ],
    );
  }
}

