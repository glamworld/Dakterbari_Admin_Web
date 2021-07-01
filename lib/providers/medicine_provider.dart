import 'package:admin_panel_web/model/medicine_model.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/form_decorate.dart';

class MedicineProvider extends ChangeNotifier{

  List<MedicineModel> _medicineList = [];
  List<MedicineModel> _pendingMedicineList = [];

  get medicineList=> _medicineList;
  get pendingMedicineList=> _pendingMedicineList;


  Future<void> getMedicine()async{
    try{
      await FirebaseFirestore.instance.collection('Medicines').where('state',isEqualTo: 'approved').get().then((snapshot){
        _medicineList.clear();
        snapshot.docChanges.forEach((element) {
          MedicineModel medicineModel = MedicineModel(
            id: element.doc['id'],
            name: element.doc['name'],
            strength: element.doc['strength'],
            genericName: element.doc['genericName'],
            dosage: element.doc['dosage'],
            manufacturer: element.doc['manufacturer'],
            price: element.doc['price'],
            date: element.doc['date'],
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
            state: element.doc['state']
          );
          _medicineList.add(medicineModel);
        });
      });
      notifyListeners();
    }catch(error){}
  }

  Future<void> getPendingMedicine()async{
    try{
      await FirebaseFirestore.instance.collection('Medicines').where('state',isEqualTo: 'pending').get().then((snapshot){
        _pendingMedicineList.clear();
        snapshot.docChanges.forEach((element) {
          MedicineModel medicineModel = MedicineModel(
            id: element.doc['id'],
            name: element.doc['name'],
            strength: element.doc['strength'],
            genericName: element.doc['genericName'],
            dosage: element.doc['dosage'],
            manufacturer: element.doc['manufacturer'],
            price: element.doc['price'],
            date: element.doc['date'],
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
            state: element.doc['state']
          );
          _pendingMedicineList.add(medicineModel);

        });
      });
      notifyListeners();

    }catch(error){}
  }

  Future<void> submitMedicine(Map<String,String>map,String id,BuildContext context)async{

    await FirebaseFirestore.instance.collection('Medicines').doc(id).set(map).then((value)async{
        showToast('Medicine submitted successfully');
        getMedicine();
    },onError: (error){
      //Navigator.pop(context);
      showToast(error.toString());
    });
  }

  Future<void> updatePendingMedicine(String id, BuildContext context)async
  {
    FirebaseFirestore.instance.collection('Medicines').doc(id).update({
      'state': 'approved',

    }).then((value)async{
      showToast('Medicine approved');
      getMedicine();
      getPendingMedicine();
      notifyListeners();
    });

  }

  Future<void> updateMedicine(PublicProvider provider)async{
    FirebaseFirestore.instance.collection('Medicines').doc(provider.medicineModel.id).update({
      'id':provider.medicineModel.id,
      'name':provider.medicineModel.name,
      'strength':provider.medicineModel.strength,
      'genericName':provider.medicineModel.genericName,
      'dosage':provider.medicineModel.dosage,
      'manufacturer':provider.medicineModel.manufacturer,
      'price':provider.medicineModel.price,
      'date': provider.medicineModel.date,
      'indications':provider.medicineModel.indications,
      'adultDose':provider.medicineModel.adultDose,
      'childDose':provider.medicineModel.childDose,
      'representativePhone': provider.medicineModel.representativePhone,
      'renalDose':provider.medicineModel.renalDose,
      'administration':provider.medicineModel.administration,
      'contradiction':provider.medicineModel.contradiction,
      'sideEffect':provider.medicineModel.sideEffect,
      'precautions':provider.medicineModel.precautions,
      'pregnancy':provider.medicineModel.pregnancy,
      'therapeutic':provider.medicineModel.therapeutic,
      'modeOfAction':provider.medicineModel.modeOfAction,
      'interaction':provider.medicineModel.interaction,
      'darNo':provider.medicineModel.darNo,
      'state':'approved',

    }).then((value)async{
      showToast('Medicine Updated');
      notifyListeners();
    });
  }

  Future<void> deleteMedicine(String id,BuildContext context)async{
    await FirebaseFirestore.instance.collection('Medicines').doc(id).delete().then((value) async{
      await getMedicine().then((value) {

        showToast('Medicine deleted');
      });
    },onError: (error){
      showToast(error.toString());
    });
  }

}