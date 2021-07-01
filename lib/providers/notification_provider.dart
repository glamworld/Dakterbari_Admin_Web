import 'package:admin_panel_web/model/notification_model.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class NotificationProvider extends ChangeNotifier{
  NotificationModel _notificationModel = NotificationModel();
  List<NotificationModel> _notificationList = [];

  NotificationModel get notificationModel => _notificationModel;
  get notificationList => _notificationList;

  set notificationModel(NotificationModel notifiModel) {
    notifiModel = NotificationModel();
    _notificationModel = notifiModel;
    notifyListeners();
  }

  Future<bool> sendNotificaton(NotificationModel notificationModel, BuildContext context) async {
    final id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    String date = DateFormat("dd-MMM-yyyy/hh:mm:aa").format(DateTime.
    fromMicrosecondsSinceEpoch(DateTime
        .now()
        .microsecondsSinceEpoch));
    try {
      FirebaseFirestore.instance.collection('Notifications').doc(id).set({
        'id': id,
        'category': notificationModel.category,
        'title': notificationModel.title,
        'message': notificationModel.message,
        'date': date,
      }).then((value) async {
        await getNotifications().then((value) {
          showToast('Notification sent');
        });
      }, onError: (error) {
        showToast(error.toString());
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getNotifications()async{

    try{
      await FirebaseFirestore.instance.collection('Notifications').get().then((snapshot) {
        _notificationList.clear();
        snapshot.docChanges.forEach((element) {
          NotificationModel notifications = NotificationModel(
            id: element.doc['id'],
            category: element.doc['category'],
            title: element.doc['title'],
            message: element.doc['message'],
            date: element.doc['date'],
          );
          _notificationList.add(notifications);
        });
      });
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }
  Future<void> deleteNotification(String id,BuildContext context)async{
    await FirebaseFirestore.instance.collection('Notifications').doc(id).delete().then((value) async{
      await getNotifications().then((value) {
        showToast('Notification deleted');
      });

    },onError: (error){
      showToast(error.toString());
    });
  }

}