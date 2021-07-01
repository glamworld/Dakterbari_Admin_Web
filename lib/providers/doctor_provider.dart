import 'package:admin_panel_web/model/doctor_details_model.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_panel_web/model/faq_model.dart';
import 'package:admin_panel_web/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorProvider extends ChangeNotifier{

  DoctorDetailsModel _doctorDetails = DoctorDetailsModel();
  HospitalModel _hospitalModel = HospitalModel();
  FaqModel _faqModel = FaqModel();
  List<DoctorDetailsModel> _allDoctorList=[];
  List<DoctorDetailsModel> _newDoctorList=[];
  List<DoctorDetailsModel> _doctorId=[];
  List<HospitalModel> _hospitalList = [];
  List<FaqModel> _faqList = [];
  bool _obscure = true;

  DoctorDetailsModel get doctorDetails => _doctorDetails;
  get allDoctorList=>_allDoctorList;
  get newDoctorList=>_newDoctorList;
  HospitalModel get hospitalModel=> _hospitalModel;
  get hospitalList=> _hospitalList;
  FaqModel get faqModel=> _faqModel;
  get faqList=> _faqList;
  get doctorId=>_doctorId;
  bool get obscure => _obscure;

  set doctorDetails(DoctorDetailsModel model) {
    model = DoctorDetailsModel();
    _doctorDetails = model;
    notifyListeners();
  }
  set hospitalModel(HospitalModel model){
    model = HospitalModel();
    _hospitalModel = model;
    notifyListeners();
  }
  set faqModel(FaqModel model){
    model = FaqModel();
    _faqModel = model;
    notifyListeners();
  }
  set obscure(bool val) {
    _obscure = val;
    notifyListeners();
  }


  Future<bool> addDoctor(DoctorDetailsModel doctorDetails, BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey) async {
    try {
      String date = DateFormat("dd-MM-yyyy").format(
          DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch));

      final String id = doctorDetails.countryCode! + doctorDetails.phone!.trim();

      if (doctorDetails.provideTeleService==true) {
        await FirebaseFirestore.instance.collection('Doctors').doc(id).set({
          'id': id,
          'name': doctorDetails.fullName,
          'phone': doctorDetails.phone,
          'password': doctorDetails.password,
          'email': doctorDetails.email,
          'about': doctorDetails.about,
          'country': doctorDetails.country,
          'state': doctorDetails.state,
          'city': doctorDetails.city,
          'joinDate': date,
          'gender': doctorDetails.gender,
          'specification': doctorDetails.specification,
          'optionalSpecification': doctorDetails.optionalSpecification,
          'degree': doctorDetails.degree,
          'bmdcNumber': doctorDetails.bmdcNumber,
          'currency': doctorDetails.currency,
          'appFee': doctorDetails.appFee,
          'teleFee': doctorDetails.teleFee,
          'experience': doctorDetails.experience,
          'photoUrl': doctorDetails.photoUrl,
          'totalPrescribe': doctorDetails.totalPrescribe,
          'totalTeleFee':doctorDetails.totalTeleFee,
          'countryCode': doctorDetails.countryCode,
          'provideTeleService': doctorDetails.provideTeleService,
          'teleSat': !doctorDetails.sat![0] ? null : [
            '${doctorDetails.sat![1].hour}:${doctorDetails.sat![1].minute}',
            '${doctorDetails.sat![2].hour}:${doctorDetails.sat![2].minute}'
          ],
          'teleSun': !doctorDetails.sun![0] ? null : [
            '${doctorDetails.sun![1].hour}:${doctorDetails.sun![1].minute}',
            '${doctorDetails.sun![2].hour}:${doctorDetails.sun![2].minute}'
          ],
          'teleMon': !doctorDetails.mon![0] ? null : [
            '${doctorDetails.mon![1].hour}:${doctorDetails.mon![1].minute}',
            '${doctorDetails.mon![2].hour}:${doctorDetails.mon![2].minute}'
          ],
          'teleTue': !doctorDetails.tue![0] ? null : [
            '${doctorDetails.tue![1].hour}:${doctorDetails.tue![1].minute}',
            '${doctorDetails.tue![2].hour}:${doctorDetails.tue![2].minute}'
          ],
          'teleWed': !doctorDetails.wed![0] ? null : [
            '${doctorDetails.wed![1].hour}:${doctorDetails.wed![1].minute}',
            '${doctorDetails.wed![2].hour}:${doctorDetails.wed![2].minute}'
          ],
          'teleThu': !doctorDetails.thu![0] ? null : [
            '${doctorDetails.thu![1].hour}:${doctorDetails.thu![1].minute}',
            '${doctorDetails.thu![2].hour}:${doctorDetails.thu![2].minute}'
          ],
          'teleFri': !doctorDetails.fri![0] ? null : [
            '${doctorDetails.fri![1].hour}:${doctorDetails.fri![1].minute}',
            '${doctorDetails.fri![2].hour}:${doctorDetails.fri![2].minute}'
          ],
        }).then((value) {
          showToast('Doctor added successful');
        }, onError: (error) {
          Navigator.pop(context);
          showToast(error.toString());
        });
        return true;
      } else {
        await FirebaseFirestore.instance.collection('Doctors').doc(id).set({
          'id': id,
          'name': doctorDetails.fullName,
          'phone': doctorDetails.phone,
          'password': doctorDetails.password,
          'email': doctorDetails.email,
          'about': doctorDetails.about,
          'country': doctorDetails.country,
          'state': doctorDetails.state,
          'city': doctorDetails.city,
          'joinDate': date,
          'gender': doctorDetails.gender,
          'specification': doctorDetails.specification,
          'degree': doctorDetails.degree,
          'bmdcNumber': doctorDetails.bmdcNumber,
          'currency': doctorDetails.currency,
          'appFee': doctorDetails.appFee,
          'teleFee': null,
          'experience': doctorDetails.experience,
          'photoUrl': doctorDetails.photoUrl,
          'totalPrescribe': doctorDetails.totalPrescribe,
          'totalTeleFee':doctorDetails.totalTeleFee,
          'countryCode': doctorDetails.countryCode,
          'provideTeleService': doctorDetails.provideTeleService,
          'optionalSpecification':doctorDetails.optionalSpecification,
          'teleSat': null,
          'teleSun': null,
          'teleMon': null,
          'teleTue': null,
          'teleWed': null,
          'teleThu': null,
          'teleFri': null,
        }).then((value) {
          showToast('Doctor added successful');
        }, onError: (error) {
          Navigator.pop(context);
          showToast(error.toString());
        });
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> getDoctor()async{
    String date = DateFormat("dd-MM-yyyy").format(
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch));

    try{
      await FirebaseFirestore.instance.collection('Doctors').get().then((snapShot){
        _allDoctorList.clear();
        _newDoctorList.clear();
        snapShot.docChanges.forEach((element) {
          DoctorDetailsModel doctors=DoctorDetailsModel(
            id: element.doc['id'],
            about: element.doc['about']??'',
            appFee: element.doc['appFee']??'',
            bmdcNumber: element.doc['bmdcNumber']??'',
            countryCode: element.doc['countryCode']??'',
            degree: element.doc['degree']??'',
            email: element.doc['email']??'',
            experience: element.doc['experience']??'',
            gender: element.doc['gender']??'',
            joinDate: element.doc['joinDate']??'',
            fullName: element.doc['name']??'',
            password: element.doc['password']??"",
            phone: element.doc['phone']??'',
            photoUrl: element.doc['photoUrl']??'',
            provideTeleService: element.doc['provideTeleService']??'',
            specification: element.doc['specification']??'',
            teleFee: element.doc['teleFee']??'',
            totalPrescribe: element.doc['totalPrescribe']??'',
            country: element.doc['country']??'',
            state: element.doc['state']??'',
            city: element.doc['city']??'',
            optionalSpecification: element.doc['optionalSpecification']??[],
            sat: element.doc['teleSat']??[],
            sun: element.doc['teleSun']??[],
            mon: element.doc['teleMon']??[],
            tue: element.doc['teleTue']??[],
            wed: element.doc['teleWed']??[],
            thu: element.doc['teleThu']??[],
            fri: element.doc['teleFri']??[],
            totalTeleFee: element.doc['totalTeleFee']??'',
            currency: element.doc['currency']??'',
          );
          _allDoctorList.add(doctors);
        });
      });
      int i=0;
      while(i<_allDoctorList.length){
        if(_allDoctorList[i].joinDate==date){
          _newDoctorList.add(_allDoctorList[i]);
        }
        i++;
      }
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }

  Future<void> getDoctorId(String id)async{
    String date = DateFormat("dd-MM-yyyy").format(
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch));

    try{
      await FirebaseFirestore.instance.collection('Doctors').where('id',isEqualTo: id).get().then((snapShot){
        _doctorId.clear();
        snapShot.docChanges.forEach((element) {
          DoctorDetailsModel doctors=DoctorDetailsModel(
            id: element.doc['id'],
            about: element.doc['about']??'',
            appFee: element.doc['appFee']??'',
            bmdcNumber: element.doc['bmdcNumber']??'',
            countryCode: element.doc['countryCode']??'',
            degree: element.doc['degree']??'',
            email: element.doc['email']??'',
            experience: element.doc['experience']??'',
            gender: element.doc['gender']??'',
            joinDate: element.doc['joinDate']??'',
            fullName: element.doc['name']??'',
            password: element.doc['password']??"",
            phone: element.doc['phone']??'',
            photoUrl: element.doc['photoUrl']??'',
            provideTeleService: element.doc['provideTeleService']??'',
            specification: element.doc['specification']??'',
            teleFee: element.doc['teleFee']??'',
            totalPrescribe: element.doc['totalPrescribe']??'',
            country: element.doc['country']??'',
            state: element.doc['state']??'',
            city: element.doc['city']??'',
            optionalSpecification: element.doc['optionalSpecification']??[],
            sat: element.doc['teleSat']??[],
            sun: element.doc['teleSun']??[],
            mon: element.doc['teleMon']??[],
            tue: element.doc['teleTue']??[],
            wed: element.doc['teleWed']??[],
            thu: element.doc['teleThu']??[],
            fri: element.doc['teleFri']??[],
            totalTeleFee: element.doc['totalTeleFee']??'',
            currency: element.doc['currency']??'',
          );
          _doctorId.add(doctors);
        });
      });
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }
  Future<void> updateDoctorSpecifications(DoctorProvider operation,List<dynamic> specificationList,String doctorId)async{
    await FirebaseFirestore.instance.collection('Doctors').doc(doctorId).update({
      'optionalSpecification': specificationList
    }).then((value){
      operation.doctorId[0].optionalSpecification = specificationList;
      notifyListeners();
      showToast('Specification successfully added');
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> removeDoctorSpecifications(DoctorProvider operation,String doctorId)async{
    await FirebaseFirestore.instance.collection('Doctors').doc(doctorId).update({
      'optionalSpecification': null
    }).then((value){
      operation.doctorId[0].optionalSpecification = null;
      notifyListeners();
      showToast('Specification successfully removed');
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> getHospitals(String id)async{
    try{
      await FirebaseFirestore.instance.collection('Hospitals').where('doctorId', isEqualTo: id).get().then((snapShot){
        _hospitalList.clear();
        snapShot.docChanges.forEach((element) {
          HospitalModel hospitals = HospitalModel(
            id: element.doc['id'],
            doctorId: element.doc['doctorId'],
            hospitalName: element.doc['hospitalName'],
            hospitalAddress: element.doc['hospitalAddress'],
            addingDate: element.doc['addingDate'],
            sat: element.doc['sat'],
            sun: element.doc['sun'],
            mon: element.doc['mon'],
            tue: element.doc['tue'],
            wed: element.doc['wed'],
            thu: element.doc['thu'],
            fri: element.doc['fri'],
          );
          _hospitalList.add(hospitals);
        });
      });
      notifyListeners();
    }catch(error){}
  }

  Future<void> insertHospital(DoctorProvider operation,String doctorId)async{
    final String hospitalId= doctorId+DateTime.now().millisecondsSinceEpoch.toString();
    final String addingDate= DateFormat("dd-MMM-yyyy/hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch));
    await FirebaseFirestore.instance.collection('Hospitals').doc(hospitalId).set({
      'id': hospitalId,
      'doctorId': doctorId,
      'addingDate': addingDate,
      'hospitalName': operation.hospitalModel.hospitalName,
      'hospitalAddress': operation.hospitalModel.hospitalAddress,
      'sat': !operation.hospitalModel.sat![0]? null: ['${operation.hospitalModel.sat![1].hour}:${operation.hospitalModel.sat![1].minute}','${operation.hospitalModel.sat![2].hour}:${operation.hospitalModel.sat![2].minute}'],
      'sun': !operation.hospitalModel.sun![0]? null: ['${operation.hospitalModel.sun![1].hour}:${operation.hospitalModel.sun![1].minute}','${operation.hospitalModel.sun![2].hour}:${operation.hospitalModel.sun![2].minute}'],
      'mon': !operation.hospitalModel.mon![0]? null: ['${operation.hospitalModel.mon![1].hour}:${operation.hospitalModel.mon![1].minute}','${operation.hospitalModel.mon![2].hour}:${operation.hospitalModel.mon![2].minute}'],
      'tue': !operation.hospitalModel.tue![0]? null: ['${operation.hospitalModel.tue![1].hour}:${operation.hospitalModel.tue![1].minute}','${operation.hospitalModel.tue![2].hour}:${operation.hospitalModel.tue![2].minute}'],
      'wed': !operation.hospitalModel.wed![0]? null: ['${operation.hospitalModel.wed![1].hour}:${operation.hospitalModel.wed![1].minute}','${operation.hospitalModel.wed![2].hour}:${operation.hospitalModel.wed![2].minute}'],
      'thu': !operation.hospitalModel.thu![0]? null: ['${operation.hospitalModel.thu![1].hour}:${operation.hospitalModel.thu![1].minute}','${operation.hospitalModel.thu![2].hour}:${operation.hospitalModel.thu![2].minute}'],
      'fri': !operation.hospitalModel.fri![0]? null: ['${operation.hospitalModel.fri![1].hour}:${operation.hospitalModel.fri![1].minute}','${operation.hospitalModel.fri![2].hour}:${operation.hospitalModel.fri![2].minute}'],
    }).then((value)async{
      await operation.getHospitals(doctorId);
      showToast('Hospital/chamber successfully added');
    },onError: (error){
      showToast(error.toString());
    });
  }

  void removeHospitalFromList(int index){
    _hospitalList.removeAt(index);
    notifyListeners();
  }

  Future<void> removeHospitalFromDB(BuildContext context, String id, int index)async{
    await FirebaseFirestore.instance.collection('Hospitals').doc(id).delete().then((value){
      removeHospitalFromList(index);
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> updateDoctorInformation(DoctorProvider operation)async{
    await FirebaseFirestore.instance.collection('Doctors').doc(operation.doctorId[0].id).update({
      'name':operation.doctorDetails.fullName!.isEmpty? operation.doctorId[0].fullName :operation.doctorDetails.fullName,
      'email':operation.doctorDetails.email!.isEmpty? operation.doctorId[0].email :operation.doctorDetails.email,
      'password':operation.doctorDetails.password!.isEmpty? operation.doctorId[0].password :operation.doctorDetails.password,
      'about':operation.doctorDetails.about!.isEmpty? operation.doctorId[0].about :operation.doctorDetails.about,
      'country':operation.doctorDetails.country!.isEmpty? operation.doctorId[0].country :operation.doctorDetails.country,
      'state':operation.doctorDetails.state!.isEmpty? operation.doctorId[0].state :operation.doctorDetails.state,
      'city':operation.doctorDetails.city!.isEmpty? operation.doctorId[0].city :operation.doctorDetails.city,
      'experience':operation.doctorDetails.experience!.isEmpty? operation.doctorId[0].experience :operation.doctorDetails.experience,
      'appFee':operation.doctorDetails.appFee!.isEmpty? operation.doctorId[0].appFee :operation.doctorDetails.appFee,
      'teleFee':operation.doctorDetails.teleFee!.isEmpty? null :operation.doctorDetails.teleFee,
      'degree':operation.doctorDetails.degree!.isEmpty? null :operation.doctorDetails.degree,
    }).then((value)async{
      operation.doctorId[0].fullName= operation.doctorDetails.fullName!.isEmpty? operation.doctorId[0].fullName :operation.doctorDetails.fullName;
      operation.doctorId[0].email= operation.doctorDetails.email!.isEmpty? operation.doctorId[0].email :operation.doctorDetails.email;
      operation.doctorId[0].password= operation.doctorDetails.password!.isEmpty? operation.doctorId[0].password :operation.doctorDetails.password;
      operation.doctorId[0].about= operation.doctorDetails.about!.isEmpty? operation.doctorId[0].about :operation.doctorDetails.about;
      operation.doctorId[0].country= operation.doctorDetails.country!.isEmpty? operation.doctorId[0].country :operation.doctorDetails.country;
      operation.doctorId[0].state= operation.doctorDetails.state!.isEmpty? operation.doctorId[0].state :operation.doctorDetails.state;
      operation.doctorId[0].city= operation.doctorDetails.city!.isEmpty? operation.doctorId[0].city :operation.doctorDetails.city;
      operation.doctorId[0].experience= operation.doctorDetails.experience!.isEmpty? operation.doctorId[0].experience :operation.doctorDetails.experience;
      operation.doctorId[0].appFee= operation.doctorDetails.appFee!.isEmpty? operation.doctorId[0].appFee :operation.doctorDetails.appFee;
      operation.doctorId[0].degree= operation.doctorDetails.degree!.isEmpty? operation.doctorId[0].degree :operation.doctorDetails.degree;
      operation.doctorId[0].teleFee= operation.doctorDetails.teleFee!.isEmpty? null :operation.doctorDetails.teleFee;
      notifyListeners();
      showToast('Updated successful');

    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> getFaq(String doctorId) async{
    try{
      await FirebaseFirestore.instance.collection('FAQ').where('id', isEqualTo: doctorId).get().then((snapshot){
        _faqList.clear();
        snapshot.docChanges.forEach((element) {
          FaqModel faqModel = FaqModel(
            id: element.doc['id'],
            one: element.doc['one'],
            two: element.doc['two'],
            three: element.doc['three'],
            four: element.doc['four'],
            five: element.doc['five'],
            six: element.doc['six'],
            seven: element.doc['seven'],
            eight: element.doc['eight'],
            nine: element.doc['nine'],
            ten: element.doc['ten'],
          );
          _faqList.add(faqModel);
        });
      });
      notifyListeners();
    }catch(error){}
  }

  Future<void> updateFaq(DoctorProvider operation, String docotorId)async{
    ///Insert operation
    if(operation.faqList.isEmpty){
      await FirebaseFirestore.instance.collection('FAQ').doc(docotorId).set({
        'id': doctorId,
        'one':operation.faqModel.one,
        'two':operation.faqModel.two,
        'three':operation.faqModel.three,
        'four':operation.faqModel.four,
        'five':operation.faqModel.five,
        'six':operation.faqModel.six,
        'seven':operation.faqModel.seven,
        'eight':operation.faqModel.eight,
        'nine':operation.faqModel.nine,
        'ten':operation.faqModel.ten,
      }).then((value){
        operation.getFaq(docotorId);
        showToast('FAQ update successful');
      },onError: (error){
        showToast(error.toString());
      });

    }
    ///Update operation
    else{
      await FirebaseFirestore.instance.collection('FAQ').doc(docotorId).update({
        'one':operation.faqModel.one!.isNotEmpty?operation.faqModel.one:operation.faqList[0].one,
        'two':operation.faqModel.two!.isNotEmpty?operation.faqModel.two:operation.faqList[0].two,
        'three':operation.faqModel.three!.isNotEmpty?operation.faqModel.three:operation.faqList[0].three,
        'four':operation.faqModel.four!.isNotEmpty?operation.faqModel.four:operation.faqList[0].four,
        'five':operation.faqModel.five!.isNotEmpty?operation.faqModel.five:operation.faqList[0].five,
        'six':operation.faqModel.six!.isNotEmpty?operation.faqModel.six:operation.faqList[0].six,
        'seven':operation.faqModel.seven!.isNotEmpty?operation.faqModel.seven:operation.faqList[0].seven,
        'eight':operation.faqModel.eight!.isNotEmpty?operation.faqModel.eight:operation.faqList[0].eight,
        'nine':operation.faqModel.nine!.isNotEmpty?operation.faqModel.nine:operation.faqList[0].nine,
        'ten':operation.faqModel.ten!.isNotEmpty?operation.faqModel.ten:operation.faqList[0].ten,
      }).then((value){
        operation.getFaq(docotorId);
        showToast('FAQ update successful');
      },onError: (error){
        showToast(error.toString());
      });
    }
  }

  Future<void> updateTeleSchedule(DoctorProvider operation,String doctorId)async{
    bool provideTele=false;
    if(operation.hospitalModel.sat![0]||operation.hospitalModel.sun![0]||operation.hospitalModel.mon![0]||operation.hospitalModel.tue![0]||
        operation.hospitalModel.wed![0]||operation.hospitalModel.thu![0]||operation.hospitalModel.fri![0]) provideTele=true;

    await FirebaseFirestore.instance.collection('Doctors').doc(doctorId).update({
      'provideTeleService':provideTele,
      'teleSat': !operation.hospitalModel.sat![0]? null: ['${operation.hospitalModel.sat![1].hour}:${operation.hospitalModel.sat![1].minute}','${operation.hospitalModel.sat![2].hour}:${operation.hospitalModel.sat![2].minute}'],
      'teleSun': !operation.hospitalModel.sun![0]? null: ['${operation.hospitalModel.sun![1].hour}:${operation.hospitalModel.sun![1].minute}','${operation.hospitalModel.sun![2].hour}:${operation.hospitalModel.sun![2].minute}'],
      'teleMon': !operation.hospitalModel.mon![0]? null: ['${operation.hospitalModel.mon![1].hour}:${operation.hospitalModel.mon![1].minute}','${operation.hospitalModel.mon![2].hour}:${operation.hospitalModel.mon![2].minute}'],
      'teleTue': !operation.hospitalModel.tue![0]? null: ['${operation.hospitalModel.tue![1].hour}:${operation.hospitalModel.tue![1].minute}','${operation.hospitalModel.tue![2].hour}:${operation.hospitalModel.tue![2].minute}'],
      'teleWed': !operation.hospitalModel.wed![0]? null: ['${operation.hospitalModel.wed![1].hour}:${operation.hospitalModel.wed![1].minute}','${operation.hospitalModel.wed![2].hour}:${operation.hospitalModel.wed![2].minute}'],
      'teleThu': !operation.hospitalModel.thu![0]? null: ['${operation.hospitalModel.thu![1].hour}:${operation.hospitalModel.thu![1].minute}','${operation.hospitalModel.thu![2].hour}:${operation.hospitalModel.thu![2].minute}'],
      'teleFri': !operation.hospitalModel.fri![0]? null: ['${operation.hospitalModel.fri![1].hour}:${operation.hospitalModel.fri![1].minute}','${operation.hospitalModel.fri![2].hour}:${operation.hospitalModel.fri![2].minute}'],
    }).then((value){
      operation.doctorId[0].provideTeleService= provideTele;
      operation.doctorId[0].sat= !operation.hospitalModel.sat![0]? null: ['${operation.hospitalModel.sat![1].hour}:${operation.hospitalModel.sat![1].minute}','${operation.hospitalModel.sat![2].hour}:${operation.hospitalModel.sat![2].minute}'];
      operation.doctorId[0].sun= !operation.hospitalModel.sun![0]? null: ['${operation.hospitalModel.sun![1].hour}:${operation.hospitalModel.sun![1].minute}','${operation.hospitalModel.sun![2].hour}:${operation.hospitalModel.sun![2].minute}'];
      operation.doctorId[0].mon= !operation.hospitalModel.mon![0]? null: ['${operation.hospitalModel.mon![1].hour}:${operation.hospitalModel.mon![1].minute}','${operation.hospitalModel.mon![2].hour}:${operation.hospitalModel.mon![2].minute}'];
      operation.doctorId[0].tue= !operation.hospitalModel.tue![0]? null: ['${operation.hospitalModel.tue![1].hour}:${operation.hospitalModel.tue![1].minute}','${operation.hospitalModel.tue![2].hour}:${operation.hospitalModel.tue![2].minute}'];
      operation.doctorId[0].wed= !operation.hospitalModel.wed![0]? null: ['${operation.hospitalModel.wed![1].hour}:${operation.hospitalModel.wed![1].minute}','${operation.hospitalModel.wed![2].hour}:${operation.hospitalModel.wed![2].minute}'];
      operation.doctorId[0].thu= !operation.hospitalModel.thu![0]? null: ['${operation.hospitalModel.thu![1].hour}:${operation.hospitalModel.thu![1].minute}','${operation.hospitalModel.thu![2].hour}:${operation.hospitalModel.thu![2].minute}'];
      operation.doctorId[0].fri= !operation.hospitalModel.fri![0]? null: ['${operation.hospitalModel.fri![1].hour}:${operation.hospitalModel.fri![1].minute}','${operation.hospitalModel.fri![2].hour}:${operation.hospitalModel.fri![2].minute}'];
      notifyListeners();
      showToast('Telemedicine service successfully updated');
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> deleteDoctor(String id,BuildContext context)async{
    await FirebaseFirestore.instance.collection('Doctors').doc(id).delete().then((value) async{
      await getDoctor().then((value) {

        showToast('Doctor deleted');
      });
    },onError: (error){
      //showSnackBar(scaffoldKey, error.toString());
    });
  }
}