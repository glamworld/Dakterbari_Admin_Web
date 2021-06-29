import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PendingMedicinePage extends StatefulWidget {
  @override
  _PendingMedicinePageState createState() => _PendingMedicinePageState();
}

class _PendingMedicinePageState extends State<PendingMedicinePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final MedicineProvider provider = Provider.of<MedicineProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
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
                    SizedBox(width: 10,),
                    Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),width:200,child: Center(child: Text('Name',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Strength',style:TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('GenericName',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Dosage',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Manufacturer',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Price',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Date',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Indications',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('AdultDose',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('ChildDose',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('RenalDose',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('RepresentativePhone',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Administration',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 40,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Contradiction',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('SideEffect',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Precautions',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Pregnancy',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Therapeutic',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('ModeOfAction',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('Interaction',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                    SizedBox(width: 20,),
                    Container(decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),width:200,child: Center(child: Text('DarNo',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.height*.02,fontWeight: FontWeight.bold),))),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: size.height*.7,
                  width: size.height*6.22,
                  child: ListView.builder(
                    //shrinkWrap: true,
                      itemCount: provider.pendingMedicineList.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].name,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].strength,style:TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400)))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].genericName,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].dosage,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].manufacturer,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].price,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].date,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].indications,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].adultDose,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].childDose,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].renalDose,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].representativePhone,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 40,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].administration,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].contradiction,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].sideEffect,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].precautions,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].pregnancy,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].therapeutic,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].modeOfAction,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:200,child: Center(child: Text(provider.pendingMedicineList[index].interaction,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20,),
                              Container(decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),width:140,child: Center(child: Text(provider.pendingMedicineList[index].darNo,style: TextStyle(color: Colors.grey.shade900,fontSize: size.height*.02,fontWeight: FontWeight.w400),))),
                              SizedBox(width: 20),
                              TextButton(onPressed: ()async{
                                await provider.updatePendingMedicine(provider.pendingMedicineList[index].id, context);
                              }, child: Text(
                                'Approve',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.width*.01,fontWeight: FontWeight.bold),
                              ))
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
