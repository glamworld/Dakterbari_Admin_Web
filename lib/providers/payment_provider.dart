import 'package:admin_panel_web/model/amount_model.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_panel_web/model/payment_appointment_model.dart';
import 'package:admin_panel_web/model/payment_discount_model.dart';

class PaymentProvider extends ChangeNotifier{
  List<PaymentDiscountModel> _paymentDiscountList = [];
  List<PaymentAppointmentModel> _paymentAppointmentList = [];
  AmountModel _amountModel = AmountModel();
  List<AmountModel> _amountList = [];

  get paymentDiscountList=>_paymentDiscountList;
  get paymentAppointmentList=>_paymentAppointmentList;
  get amountList=> _amountList;
  AmountModel get amountModel => _amountModel;

  set amountModel(AmountModel model) {
    model = AmountModel();
    _amountModel = model;
    notifyListeners();
  }

  Future<void> getDiscountPayment()async{

    try{
      await FirebaseFirestore.instance.collection('DiscountPaymentDetails').orderBy('timeStamp',descending: true).get().then((snapshot) {
        _paymentDiscountList.clear();
        snapshot.docChanges.forEach((element) {
          PaymentDiscountModel paymentDiscountModel = PaymentDiscountModel(
              id: element.doc['id'],
              pId: element.doc['pId'],
              pName: element.doc['pName'],
              amount: element.doc['amount'],
              currency: element.doc['currency'],
              shopId: element.doc['shopId'],
              shopName: element.doc['shopName'],
              paymentDate: element.doc['paymentDate'],
              timeStamp: element.doc['timeStamp'],
              transactionId: element.doc['transactionId']
          );
          _paymentDiscountList.add(paymentDiscountModel);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<void> getAppointmentPayment()async{

    try{
      await FirebaseFirestore.instance.collection('AppointmentPaymentDetails').orderBy('timeStamp',descending: true).get().then((snapshot) {
        _paymentAppointmentList.clear();
        snapshot.docChanges.forEach((element) {
          PaymentAppointmentModel paymentAppointmentModel = PaymentAppointmentModel(
              id: element.doc['id'],
              pId: element.doc['pId'],
              pName: element.doc['pName'],
              amount: element.doc['amount'],
              currency: element.doc['currency'],
              drId: element.doc['drId'],
              drName: element.doc['drName'],
              takenService: element.doc['takenService'],
              paymentDate: element.doc['paymentDate'],
              timeStamp: element.doc['timeStamp'],
              transactionId: element.doc['transactionId']
          );
          _paymentAppointmentList.add(paymentAppointmentModel);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<bool> addAmount(AmountModel amountModel, BuildContext context)async{
    final id = '123456';
    try {
      FirebaseFirestore.instance.collection('Amount').doc(id).set({
        'id': id,
        'amountCharge': amountModel.amountCharge,
        'dollarUnit': amountModel.dollarUnit,
      }).then((value){
        showToast('Amount details updated');
      },onError: (error){
        showToast(error.toString());
      });
      return true;
    } catch (e) {
      return false;
    }

  }

  Future<void> getAmount()async{

    try{
      await FirebaseFirestore.instance.collection('Amount').where('id',isEqualTo: '123456').get().then((snapshot) {
        _amountList.clear();
        snapshot.docChanges.forEach((element) {
          AmountModel amount = AmountModel(
              id: element.doc['id'],
              amountCharge: element.doc['amountCharge'],
              dollarUnit: element.doc['dollarUnit']
          );
          _amountList.add(amount);
          print(amountList.length);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }
}