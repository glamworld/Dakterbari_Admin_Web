import 'package:admin_panel_web/providers/patient_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPatientPage extends StatefulWidget {
  @override
  _AllPatientPageState createState() => _AllPatientPageState();
}

class _AllPatientPageState extends State<AllPatientPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PatientProvider patientProvider =
        Provider.of<PatientProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 200,
                            child: Center(
                              child: Text(
                                'Address',
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 200,
                            child: Center(
                              child: Text(
                                'Age',
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 200,
                            child: Center(
                              child: Text(
                                'BloodGroup',
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 200,
                            child: Center(
                              child: Text(
                                'currency',
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 200,
                            child: Center(
                              child: Text(
                                'TakenTeleService',
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            width: 140,
                            child: Center(
                              child: Text(
                                'countryCode',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: size.height * .02,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * .8,
                      width: size.height * 4.5,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          //shrinkWrap: true,
                          itemCount: patientProvider.allPatientList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                SizedBox(width: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                        Theme.of(context).primaryColor,
                                        width: 1.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Color(0xffAAF1E8),
                                  ),
                                  child: patientProvider
                                      .allPatientList[index]
                                      .imageUrl ==
                                      null
                                      ? Image.asset("assets/male.png",
                                      width: 120,
                                      height: 120,fit: BoxFit.cover)
                                      : ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    child: CachedNetworkImage(
                                      imageUrl: patientProvider
                                          .allPatientList[index]
                                          .imageUrl,
                                      placeholder: (context, url) =>
                                          Padding(
                                            padding: const EdgeInsets.all(
                                                10.0),
                                            child: Image.asset(
                                                'assets/loadingimage.gif',
                                                fit: BoxFit.cover,
                                                height: size.width * .20),
                                          ),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                          patientProvider
                                              .allPatientList[index].name??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].phone??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].email??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].country??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].state??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].city??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].joinDate??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].gender??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].address??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].age??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].bloodGroup??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider
                                            .allPatientList[index].currency??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        patientProvider.allPatientList[index]
                                            .takenTeleService??'',
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
                                            width: 1.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    width: 140,
                                    child: Center(
                                      child: Text(
                                        patientProvider.allPatientList[index]
                                            .countryCode??'',
                                        style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: size.height * .02,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                              ]),
                            );
                          }),
                    ),
                  ]),
            )));
  }
}
