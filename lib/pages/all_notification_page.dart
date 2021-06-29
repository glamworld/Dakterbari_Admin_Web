import 'package:admin_panel_web/providers/notification_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNotificationPage extends StatefulWidget {

  @override
  _AllNotificationPageState createState() => _AllNotificationPageState();
}

class _AllNotificationPageState extends State<AllNotificationPage> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final NotificationProvider notificationProvider = Provider.of<NotificationProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: _isLoading?Center(child: CircularProgressIndicator()):Container(
          width: publicProvider.pageWidth(size),
          height: size.height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          'To',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        child: Text(
                          'Title',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        )),

                    Expanded(
                        child: Text(
                          'Message',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: size.height * .02,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Divider(height: 1,color: Colors.black),
              Container(
                height: size.height * .84,
                width: size.width,
                //color: Colors.grey,
                child: ListView.builder(
                  //shrinkWrap: true,
                    itemCount: notificationProvider.notificationList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                      notificationProvider.notificationList[index].category,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Expanded(
                                    child: Text(
                                      notificationProvider.notificationList[index].title,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Expanded(
                                    child: Text(
                                      notificationProvider.notificationList[index].message,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: size.height * .02,
                                          fontWeight: FontWeight.w400),
                                    )),
                                IconButton(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        Widget okButton = FlatButton(
                                          child: Text("YES"),
                                          onPressed: () {
                                            showToast('Please wait..');
                                            notificationProvider.deleteNotification(notificationProvider.notificationList[index].id,context);
                                            Navigator.pop(context);

                                          },
                                        );
                                        Widget noButton = FlatButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                        AlertDialog alert = AlertDialog(
                                          title: Text("Are you sure you want to delete this Notification?"),
                                          content: Text("This Notification will be deleted"),
                                          actions: [
                                            noButton,
                                            okButton
                                          ],
                                        );
                                        return alert;
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete,color: Colors.red,),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            Divider(height: 1,color: Colors.grey.shade700,),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ))
    );
  }
}
