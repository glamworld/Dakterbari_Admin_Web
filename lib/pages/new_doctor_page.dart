import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewDoctorPage extends StatefulWidget {

  @override
  _NewDoctorPageState createState() => _NewDoctorPageState();
}

class _NewDoctorPageState extends State<NewDoctorPage> {
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
                          'Photo',
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
                          'Phone',
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
                          'Password',
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
              Container(
                height: size.height * .7,
                width: size.height * 8.22,
                child: ListView.builder(
                  //shrinkWrap: true,
                    itemCount: doctorProvider.newDoctorList.length,
                    itemBuilder: (context, index) {
                      var dta =doctorProvider.newDoctorList[index];
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
                              child: doctorProvider.newDoctorList[index].photoUrl == null
                                  ? Image.asset("assets/male.png", width: size.width * .20)
                                  : ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: doctorProvider.newDoctorList[index].photoUrl,
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
                                      doctorProvider.newDoctorList[index].fullName,
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
                                    doctorProvider.newDoctorList[index].phone,
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
                                    doctorProvider.newDoctorList[index].password,
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
                                    doctorProvider.newDoctorList[index].email,
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
                                    doctorProvider.newDoctorList[index].about,
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
                                    doctorProvider.newDoctorList[index].country,
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
                                    doctorProvider.newDoctorList[index].state,
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
                                    doctorProvider.newDoctorList[index].city,
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
                                    doctorProvider.newDoctorList[index].joinDate,
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
                                    doctorProvider.newDoctorList[index].gender,
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
                                    doctorProvider.newDoctorList[index].specification,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            doctorProvider.newDoctorList[index].optionalSpecification == null
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
                                  itemCount: doctorProvider.newDoctorList[index].optionalSpecification.length,
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
                                    doctorProvider.newDoctorList[index].degree,
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
                                    doctorProvider.newDoctorList[index].bmdcNumber,
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
                                    doctorProvider.newDoctorList[index].currency,
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
                                    doctorProvider.newDoctorList[index].appFee,
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
                                    doctorProvider.newDoctorList[index].teleFee,
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
                                    doctorProvider.newDoctorList[index].experience,
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
                                    doctorProvider.newDoctorList[index].totalPrescribe,
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
                                    doctorProvider.newDoctorList[index].countryCode,
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
                                    '${doctorProvider.newDoctorList[index].provideTeleService}',
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
                                    '${doctorProvider.newDoctorList[index].totalTeleFee}',
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
                                    doctorProvider.newDoctorList[index].sat.isNotEmpty?'${doctorProvider.newDoctorList[index].sat[0]} - ${doctorProvider.newDoctorList[index].sat[1]}':'',
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
                                    doctorProvider.newDoctorList[index].sun.isNotEmpty?'${doctorProvider.newDoctorList[index].sun[0]} - ${doctorProvider.newDoctorList[index].sun[1]}':'',
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
                                    doctorProvider.newDoctorList[index].mon.isNotEmpty?'${doctorProvider.newDoctorList[index].mon[0]} - ${doctorProvider.newDoctorList[index].mon[1]}':'',
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
                                    doctorProvider.newDoctorList[index].tue.isNotEmpty?'${doctorProvider.newDoctorList[index].tue[0]} - ${doctorProvider.newDoctorList[index].tue[1]}':'',
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
                                    doctorProvider.newDoctorList[index].wed.isNotEmpty?'${doctorProvider.newDoctorList[index].wed[0]} - ${doctorProvider.newDoctorList[index].wed[1]}':'',
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
                                    doctorProvider.newDoctorList[index].thu.isNotEmpty?'${doctorProvider.newDoctorList[index].thu[0]} - ${doctorProvider.newDoctorList[index].thu[1]}':'',
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
                                    doctorProvider.newDoctorList[index].fri.isNotEmpty?'${doctorProvider.newDoctorList[index].fri[0]} - ${doctorProvider.newDoctorList[index].fri[1]}':'',
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
                                  doctorProvider.getDoctorId(doctorProvider.newDoctorList[index].id).then((value){
                                    doctorProvider.getHospitals(doctorProvider.newDoctorList[index].id).then((value){
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
                                        await doctorProvider.deleteDoctor(doctorProvider.newDoctorList[index].id, context).then((value){
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
        ],
      ),
    ),
    ));
  }
}
