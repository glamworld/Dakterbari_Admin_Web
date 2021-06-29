import 'package:admin_panel_web/login_page.dart';
import 'package:admin_panel_web/main_page.dart';
import 'package:admin_panel_web/providers/blog_provider.dart';
import 'package:admin_panel_web/providers/doctor_provider.dart';
import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/notification_provider.dart';
import 'package:admin_panel_web/providers/patient_provider.dart';
import 'package:admin_panel_web/providers/payment_provider.dart';
import 'package:admin_panel_web/providers/problem_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/providers/representative_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_web/providers/review_provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/discount_shop_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref= await SharedPreferences.getInstance();
  final String? adminPhone = pref.getString('phone');
  runApp(MyApp(adminPhone: adminPhone));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String? adminPhone;
  MyApp({required this.adminPhone});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PublicProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => MedicineProvider()),
        ChangeNotifierProvider(create: (context) => RepresentativeProvider()),
        ChangeNotifierProvider(create: (context) => PatientProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => ProblemProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => BlogProvider()),
        ChangeNotifierProvider(create: (context) => DiscountShopProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),

      ],
      child: MaterialApp(
        title: 'Dakterbari Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.teal,
          canvasColor: Colors.transparent,
        ),
        home: adminPhone==null? LogInPage():MainPage(),
      ),
    );
  }
}

