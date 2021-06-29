import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllDoctorPage extends StatefulWidget {

  @override
  _AllDoctorPageState createState() => _AllDoctorPageState();
}

class _AllDoctorPageState extends State<AllDoctorPage> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DoctorProvider doctorProvider = Provider.of<DoctorProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return _isLoading?Center(child: CircularProgressIndicator()):Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'photo',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(width: 20),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'phone',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'password',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'About',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Country',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'State',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'City',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'JoinDate',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Specification',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'OptionalSpecification',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Degree',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'BmdcNumber',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Currency',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'AppFee',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'TeleFee',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'Experience',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 200,
                      child: Center(
                        child: Text(
                          'TotalPrescribe',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'CountryCode',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'ProvideTeleService',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TotalTeleFee',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleSat',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleSun',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleMon',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleTue',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleWed',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleThu',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      width: 140,
                      child: Center(
                        child: Text(
                          'TeleFri',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(height: 1,color: Colors.black),
              Expanded( 
                child: Container(
                  height: size.height * .8,
                  width: size.height * 8.22,
                  //color: Colors.grey,
                  child: ListView.builder(
                    //shrinkWrap: true,
                      itemCount: doctorProvider.allDoctorList.length,
                      itemBuilder: (context, index) {
                        var dta =doctorProvider.allDoctorList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor, width: 1.5),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffAAF1E8),
                                ),
                                child: doctorProvider.allDoctorList[index].photoUrl == null
                                    ? Image.asset("assets/male.png", width: 120,
                                    height: 120,fit: BoxFit.cover)
                                    : ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl: doctorProvider.allDoctorList[index].photoUrl,
                                    placeholder: (context, url) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset('assets/loadingimage.gif',
                                          fit: BoxFit.cover, height: size.width*.20),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 80),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                        doctorProvider.allDoctorList[index].fullName,
                                        style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: size.height * .02,
                                            fontWeight: FontWeight.w400)),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].phone,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].password,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].email,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].about,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].country,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].state,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].city,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].joinDate,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].gender,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].specification,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              doctorProvider.allDoctorList[index].optionalSpecification == null
                                  ? Container()
                                  : Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black),
                                  ),
                                ),
                                width: 200,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: doctorProvider.allDoctorList[index].optionalSpecification.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Container(
                                            child: Text(
                                                '- ${dta.optionalSpecification[index]??''}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: size.width*.01,
                                                  fontWeight: FontWeight.w500,
                                                ))),
                                      );
                                    }),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].degree,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 40,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].bmdcNumber,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].currency,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].appFee,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].teleFee,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].experience,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].totalPrescribe,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].countryCode,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      '${doctorProvider.allDoctorList[index].provideTeleService}',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      '${doctorProvider.allDoctorList[index].totalTeleFee}',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),

                        Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].sat.isNotEmpty?'${doctorProvider.allDoctorList[index].sat[0]} - ${doctorProvider.allDoctorList[index].sat[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].sun.isNotEmpty?'${doctorProvider.allDoctorList[index].sun[0]} - ${doctorProvider.allDoctorList[index].sun[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].mon.isNotEmpty?'${doctorProvider.allDoctorList[index].mon[0]} - ${doctorProvider.allDoctorList[index].mon[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].tue.isNotEmpty?'${doctorProvider.allDoctorList[index].tue[0]} - ${doctorProvider.allDoctorList[index].tue[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].wed.isNotEmpty?'${doctorProvider.allDoctorList[index].wed[0]} - ${doctorProvider.allDoctorList[index].wed[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].thu.isNotEmpty?'${doctorProvider.allDoctorList[index].thu[0]} - ${doctorProvider.allDoctorList[index].thu[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  width: 140,
                                  child: Center(
                                    child: Text(
                                      doctorProvider.allDoctorList[index].fri.isNotEmpty?'${doctorProvider.allDoctorList[index].fri[0]} - ${doctorProvider.allDoctorList[index].fri[1]}':'',
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                  onTap: () {
                                    showToast('Please wait..');
                                    doctorProvider.getDoctorId(doctorProvider.allDoctorList[index].id).then((value){
                                      doctorProvider.getHospitals(doctorProvider.allDoctorList[index].id).then((value){
                                        publicProvider.category=publicProvider.subCategory;
                                        publicProvider.subCategory='Update Doctor';
                                      });
                                    });
                                  },
                                  child: Icon(Icons.update,
                                      color: Theme.of(context).primaryColor)),
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                child: Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      Widget okButton = FlatButton(
                                        child: Text("YES"),
                                        onPressed: () async{
                                          Navigator.of(context).pop();
                                          setState(() {
                                            _isLoading=true;
                                          });
                                          await doctorProvider.deleteDoctor(doctorProvider.allDoctorList[index].id, context).then((value){
                                            setState(() {
                                              _isLoading=false;
                                            });
                                          });

                                        },
                                      );
                                      Widget noButton = FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      AlertDialog alert = AlertDialog(
                                        title: Text("Are you sure you want to remove this Doctor?"),
                                        content: Text("This Doctor will be removed"),
                                        actions: [
                                          noButton,
                                          okButton
                                        ],
                                      );
                                      return alert;
                                    },
                                 );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ));
  }
}
