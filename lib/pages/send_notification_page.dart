import 'dart:async';
import 'package:admin_panel_web/providers/notification_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendNotificationPage extends StatefulWidget {
  @override
  _SendNotificationPageState createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<SendNotificationPage> {
  int notifications = 4;
  String selectSentNotificationCategory = 'Doctor';
  bool _isLoading = false;

  void _initializeNotification(NotificationProvider auth) {
    auth.notificationModel.title = '';
    auth.notificationModel.message = '';
    auth.notificationModel.category = selectSentNotificationCategory;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final NotificationProvider auth =
        Provider.of<NotificationProvider>(context);
    if (auth.notificationModel.title == null ||
        auth.notificationModel.message == null) {
      _initializeNotification(auth);
    }
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Form(
            child: Container(
              width: size.width * .3,
              child: Column(
                children: [
                  ///Sent Notification Category...
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF4F7F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectSentNotificationCategory,
                        hint: Text("Selected Notification Category",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14)),
                        items: StaticVariables.sentNotificationCategoryList
                            .map((category) {
                          return DropdownMenuItem(
                            child: Text(category,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                )),
                            value: category,
                          );
                        }).toList(),
                        onChanged: (newValue) => setState(() {
                          selectSentNotificationCategory = newValue as String;
                          auth.notificationModel.category =
                              selectSentNotificationCategory;
                        }),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  ///Sent Notification title
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        hintText: "Title", fillColor: Color(0xffF4F7F5)),
                    onChanged: (val) {
                      setState(() {
                        auth.notificationModel.title = val;
                      });
                    },
                  ),
                  SizedBox(height: 25),

                  ///Notifications...
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: notifications,
                    decoration: FormDecorationWithoutPrefix.copyWith(
                        fillColor: Color(0xffF4F7F5),
                        hintText: "Notifications"),
                    onChanged: (String val) {
                      if (val.length >= 40) setState(() => notifications = 2);
                      if (val.length >= 80) setState(() => notifications = 4);
                      if (val.length >= 160)
                        setState(() => notifications = 7);
                      if (val.length >= 300)
                        setState(() => notifications = 11);
                      if (val.length >= 500)
                        setState(() => notifications = 18);
                      setState(() {
                        auth.notificationModel.message = val;
                      });
                    },
                  ),
                  SizedBox(height: 25),

                  ///Submit Button...
                  _isLoading
                      ? spinWave()
                      : GradientButton(
                      child: Text('Send Notification'),
                      onPressed: () async {
                        _checkValidity(auth);
                      },
                      borderRadius: 3.0,
                      height: size.height * .05,
                      width: size.width * .2,
                      gradientColors: [
                        Theme.of(context).primaryColor,
                        Colors.teal.shade300
                      ]),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }


  Future<void> _checkValidity(NotificationProvider auth) async {
    try {
      if (auth.notificationModel.category!.isNotEmpty &&
          auth.notificationModel.title!.isNotEmpty &&
          auth.notificationModel.message!.isNotEmpty) {

        setState(()=> _isLoading=true);

        await auth.sendNotificaton(auth.notificationModel, context).then(
            (value) async {
              Timer.periodic(const Duration(seconds: 2), (t) {
                setState(() {
                  _isLoading = false;
                });
                t.cancel(); //stops the timer
              });
        }, onError: () {
          showToast('Error sending notification. Try again');
        });
      } else
        showToast('Complete all the required fields');
    } catch (error) {
      //showSnackBar(_scaffoldKey, error.toString());
    }
  }
}
