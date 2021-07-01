import 'package:admin_panel_web/model/patient_model.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PatientProvider extends ChangeNotifier{
  List<PatientsModel> _allPatientList=[];
  List<PatientsModel> _newPatientList=[];
  get allPatientList => _allPatientList;
  get newPatientList => _newPatientList;

  Future<void> getPatients()async{
    String date = DateFormat("dd-MM-yyyy").format(
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch));
    try{
      await FirebaseFirestore.instance.collection('Patients').get().then((snapShot){
        _allPatientList.clear();
        _newPatientList.clear();
        snapShot.docChanges.forEach((element) {
          PatientsModel patients=PatientsModel(
              id: element.doc['id'],
              name: element.doc['name'],
              imageUrl: element.doc['imageUrl'],
              address: element.doc['address'],
              age: element.doc['age'],
              bloodGroup: element.doc['bloodGroup'],
              city: element.doc['city'],
              country: element.doc['country'],
              countryCode: element.doc['countryCode'],
              currency: element.doc['currency'],
              email: element.doc['email'],
              gender: element.doc['gender'],
              joinDate: element.doc['joinDate'],
              phone: element.doc['phone'],
              state: element.doc['state'],
              takenTeleService: element.doc['takenTeleService']
          );
          _allPatientList.add(patients);
        });
      });
      int i=0;
      while(i<_allPatientList.length){
        if(_allPatientList[i].joinDate==date){
          _newPatientList.add(_allPatientList[i]);
        }
        i++;
      }
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }


}