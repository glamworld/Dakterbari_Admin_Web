import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_panel_web/model/problem_model.dart';

class ProblemProvider extends ChangeNotifier{
  List<ProblemModel> _doctorProblemList = [];
  List<ProblemModel> _patientsProblemList = [];

  get doctorProblemList => _doctorProblemList;
  get patientsProblemList => _patientsProblemList;

  Future<void> getPatientsProblems()async{

    try{
      await FirebaseFirestore.instance.collection('UserProblems').where('messageFrom',isEqualTo: 'patient').orderBy('timeStamp',descending: true).get().then((snapshot) {
        _patientsProblemList.clear();
        snapshot.docChanges.forEach((element) {
          ProblemModel problems = ProblemModel(
              id: element.doc['id'],
              email: element.doc['email'],
              message: element.doc['message'],
              messageFrom: element.doc['messageFrom'],
              name: element.doc['name'],
              phone: element.doc['phone'],
              submitDate: element.doc['submitDate']
          );
          _patientsProblemList.add(problems);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<void> getDoctorsProblems()async{

    try{
      await FirebaseFirestore.instance.collection('UserProblems').where('messageFrom',isEqualTo: 'doctor').orderBy('timeStamp',descending: true).get().then((snapshot) {
        _doctorProblemList.clear();
        snapshot.docChanges.forEach((element) {
          ProblemModel problems = ProblemModel(
              id: element.doc['id'],
              email: element.doc['email'],
              message: element.doc['message'],
              messageFrom: element.doc['messageFrom'],
              name: element.doc['name'],
              phone: element.doc['phone'],
              submitDate: element.doc['submitDate']
          );
          _doctorProblemList.add(problems);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }


}