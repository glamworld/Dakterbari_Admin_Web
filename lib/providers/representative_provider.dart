import 'package:admin_panel_web/model/manufacturer-representator_model.dart';
import 'package:admin_panel_web/model/medicine_model.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class RepresentativeProvider extends ChangeNotifier{
  List<ManufacturerRepresentativeModel> _representativeList = [];
  List<MedicineModel> _representativeMedicineList = [];

  get representativeList => _representativeList;
  get representativeMedicineList=> _representativeMedicineList;


  Future<void> addRepresentative(Map<String,String>map,String id,BuildContext context) async {

    await FirebaseFirestore.instance.collection('Representative').doc(id).set(map).then((value)async{
      showToast('Representative added successfully');
      getRepresentative();
    },onError: (error){
      //Navigator.pop(context);
      showToast(error.toString());
    });
  }

  Future<void> getRepresentative()async{

    try{
      await FirebaseFirestore.instance.collection('Representative').get().then((snapshot) {
        _representativeList.clear();
        snapshot.docChanges.forEach((element) {
          ManufacturerRepresentativeModel representatives = ManufacturerRepresentativeModel(
            id: element.doc['id'],
            representativeName: element.doc['representativeName'],
            companyName: element.doc['companyName'],
            phoneNumber: element.doc['phoneNumber'],
            password: element.doc['password'],
            email: element.doc['email'],
            nid: element.doc['nid'],
            dob: element.doc['dob'],
            address: element.doc['address'],
            executiveName: element.doc['executiveName'],
            executivePhone: element.doc['executivePhone'],
            date: element.doc['date'],
          );
          _representativeList.add(representatives);
        });
        print(_representativeList.length);
      });
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }

  Future<void> deleteRepresentative(String id,BuildContext context)async{
    await FirebaseFirestore.instance.collection('Representative').doc(id).delete().then((value) async{
      await getRepresentative().then((value) {

        showToast('Representative deleted');
      });
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> getRepresentativeMedicine(String phone)async{

    try{
      await FirebaseFirestore.instance.collection('Medicines').where('representativePhone',isEqualTo: phone).get().then((snapshot) {
        _representativeMedicineList.clear();
        snapshot.docChanges.forEach((element) {
          MedicineModel medicines = MedicineModel(
            id: element.doc['id'],
            name: element.doc['name'],
            strength: element.doc['strength'],
            genericName: element.doc['genericName'],
            dosage: element.doc['dosage'],
            manufacturer: element.doc['manufacturer'],
            price: element.doc['price'],
            indications: element.doc['indications'],
            adultDose: element.doc['adultDose'],
            childDose: element.doc['childDose'],
            renalDose: element.doc['renalDose'],
            representativePhone: element.doc['representativePhone'],
            administration: element.doc['administration'],
            contradiction: element.doc['contradiction'],
            sideEffect: element.doc['sideEffect'],
            precautions: element.doc['precautions'],
            pregnancy: element.doc['pregnancy'],
            therapeutic: element.doc['therapeutic'],
            modeOfAction: element.doc['modeOfAction'],
            interaction: element.doc['interaction'],
            darNo: element.doc['darNo'],
            date: element.doc['date'], state: '',
          );
          _representativeMedicineList.add(medicines);
        });
      });
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }



}