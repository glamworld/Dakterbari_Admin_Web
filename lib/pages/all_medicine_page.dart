import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AllMedicinePage extends StatefulWidget {
  @override
  _AllMedicinePageState createState() => _AllMedicinePageState();
}

class _AllMedicinePageState extends State<AllMedicinePage> {
  bool _isLoading=false;
  //TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final MedicineProvider provider = Provider.of<MedicineProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return _isLoading?Center(child: CircularProgressIndicator()):Container(
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
                            'Strength',
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
                            'GenericName',
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
                            'Dosage',
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
                            'Manufacturer',
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
                            'Price',
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
                            'Date',
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
                            'Indications',
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
                            'AdultDose',
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
                            'ChildDose',
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
                            'RenalDose',
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
                            'RepresentativePhone',
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
                            'Administration',
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
                            'Contradiction',
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
                            'SideEffect',
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
                            'Precautions',
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
                            'Pregnancy',
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
                            'Therapeutic',
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
                            'ModeOfAction',
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
                            'Interaction',
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
                            'DarNo',
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
                  width: size.height * 6.22,
                  child: ListView.builder(
                      //shrinkWrap: true,
                      itemCount: provider.medicineList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
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
                                      provider.medicineList[index].name,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(width: 20),
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
                                        provider.medicineList[index].strength,
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
                                      provider.medicineList[index].genericName,
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
                                      provider.medicineList[index].dosage,
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
                                      provider.medicineList[index].manufacturer,
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
                                      provider.medicineList[index].price,
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
                                      provider.medicineList[index].date,
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
                                      provider.medicineList[index].indications,
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
                                      provider.medicineList[index].adultDose,
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
                                      provider.medicineList[index].childDose,
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
                                      provider.medicineList[index].renalDose,
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
                                      provider.medicineList[index]
                                          .representativePhone,
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
                                      provider.medicineList[index].administration,
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
                                      provider.medicineList[index].contradiction,
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
                                      provider.medicineList[index].sideEffect,
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
                                      provider.medicineList[index].precautions,
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
                                      provider.medicineList[index].pregnancy,
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
                                      provider.medicineList[index].therapeutic,
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
                                      provider.medicineList[index].modeOfAction,
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
                                      provider.medicineList[index].interaction,
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
                                      provider.medicineList[index].darNo,
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
                                    publicProvider.category=publicProvider.subCategory;
                                    publicProvider.subCategory='Update Medicine';
                                    setState(() {
                                      publicProvider.medicineModel.id=provider.medicineList[index].id;
                                      publicProvider.medicineModel.name=provider.medicineList[index].name;
                                      publicProvider.medicineModel.genericName=provider.medicineList[index].genericName;
                                      publicProvider.medicineModel.strength=provider.medicineList[index].strength;
                                      publicProvider.medicineModel.price=provider.medicineList[index].price;
                                      publicProvider.medicineModel.state=provider.medicineList[index].state;
                                      publicProvider.medicineModel.date=provider.medicineList[index].date;
                                      publicProvider.medicineModel.darNo=provider.medicineList[index].darNo;
                                      publicProvider.medicineModel.interaction=provider.medicineList[index].interaction;
                                      publicProvider.medicineModel.modeOfAction=provider.medicineList[index].modeOfAction;
                                      publicProvider.medicineModel.therapeutic=provider.medicineList[index].therapeutic;
                                      publicProvider.medicineModel.pregnancy=provider.medicineList[index].pregnancy;
                                      publicProvider.medicineModel.precautions=provider.medicineList[index].precautions;
                                      publicProvider.medicineModel.sideEffect=provider.medicineList[index].sideEffect;
                                      publicProvider.medicineModel.contradiction=provider.medicineList[index].contradiction;
                                      publicProvider.medicineModel.administration=provider.medicineList[index].administration;
                                      publicProvider.medicineModel.representativePhone=provider.medicineList[index].representativePhone;
                                      publicProvider.medicineModel.renalDose=provider.medicineList[index].renalDose;
                                      publicProvider.medicineModel.childDose=provider.medicineList[index].childDose;
                                      publicProvider.medicineModel.adultDose=provider.medicineList[index].adultDose;
                                      publicProvider.medicineModel.indications=provider.medicineList[index].indications;
                                      publicProvider.medicineModel.manufacturer=provider.medicineList[index].manufacturer;
                                      publicProvider.medicineModel.dosage=provider.medicineList[index].dosage;
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
                                          await provider.deleteMedicine(provider.medicineList[index].id, context).then((value){
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
                                        title: Text("Are you sure you want to delete this Medicine?"),
                                        content: Text("This Medicine will be deleted"),
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
