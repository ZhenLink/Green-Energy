import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:gns_app/Assistant/Assistant.dart';
//import 'package:gns_app/Assistant/Assistant.dart';
import 'package:gns_app/dashboard/Home.dart';
//import 'package:gns_app/auth/sign%20in/sign_in.dart';
//import 'auth/sign in/sign_in.dart';
//import 'auth/sign up/Sign_up.dart';
//import 'dashboard/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Energy Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const Home(),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
