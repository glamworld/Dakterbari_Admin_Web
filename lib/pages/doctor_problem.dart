import 'package:admin_panel_web/providers/problem_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorProblemPage extends StatefulWidget {

  @override
  _DoctorProblemPageState createState() => _DoctorProblemPageState();
}

class _DoctorProblemPageState extends State<DoctorProblemPage> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    ProblemProvider operation = Provider.of<ProblemProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: _isLoading?Center(child: CircularProgressIndicator()):Container(
          width: publicProvider.pageWidth(size),
          height: size.height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'MessageFrom',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          ),
                        )),

                    Expanded(
                        child: Center(
                          child: Text(
                            'Message',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          ),
                        )),

                    Expanded(
                        child: Center(
                          child: Text(
                            'Phone',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Expanded(
                        child: Center(
                          child: Text(
                            'Email',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Expanded(
                        child: Center(
                          child: Text(
                            'Submit Date',
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
              ),
              SizedBox(height: 15),
              Divider(height: 1,color: Colors.black),
              Container(
                height: size.height * .7,
                width: size.width*.9,
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: operation.doctorProblemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].messageFrom,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),
                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].name,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),
                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].message,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),
                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].phone,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),

                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].email,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),
                                  Expanded(
                                      child: Center(
                                        child: Text(
                                          operation.doctorProblemList[index].submitDate,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),

                                ],
                              ),
                              SizedBox(height: 15),
                              Divider(height: 1,color: Colors.grey.shade700,),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ))
    );
  }
}
