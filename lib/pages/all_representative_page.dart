import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/providers/representative_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllRepresentativePage extends StatefulWidget {

  @override
  _AllRepresentativePageState createState() => _AllRepresentativePageState();
}

class _AllRepresentativePageState extends State<AllRepresentativePage> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final RepresentativeProvider provider = Provider.of<RepresentativeProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return _isLoading?LinearProgressIndicator():Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
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
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('RepresentativeName',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('CompanyName',style:TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('PhoneNumber',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Email',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Nid',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Dob',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Address',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('ExecutiveName',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('ExecutivePhone',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Text('Date',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.022,fontWeight: FontWeight.bold),)),
                  ],
                ),

                SizedBox(height: 20,),
                Container(
                  height: size.height*.7,
                  width: size.height*3.30,
                  child: ListView.builder(
                    //shrinkWrap: true,
                      itemCount: provider.representativeList.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].representativeName,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].companyName,style:TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].phoneNumber,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].password,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].email,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].nid,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].dob,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].address,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].executiveName,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].executivePhone,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Text(provider.representativeList[index].date,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),)),
                              SizedBox(width: 20,),
                              IconButton(icon:Icon(Icons.delete),color: Theme.of(context).primaryColor, onPressed: () async{
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
                                        await provider.deleteRepresentative(provider.representativeList[index].id, context).then((value){
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
                                      title: Text("Are you sure you want to delete this representative?"),
                                      content: Text("This representative will be deleted"),
                                      actions: [
                                        noButton,
                                        okButton
                                      ],
                                    );
                                    return alert;
                                  },
                                );
                              },),
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
