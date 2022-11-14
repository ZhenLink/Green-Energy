import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:gns_app/auth/sign%20in/sign_in.dart';
import 'package:gns_app/env/privates.dart';
//import 'package:gns_app/Assistant/Assistant.dart';
//import 'package:gns_app/Assistant/Assistant.dart';
//import 'package:gns_app/dashboard/Home.dart';
//import 'package:gns_app/auth/sign%20in/sign_in.dart';
//import 'auth/sign in/sign_in.dart';
//import 'auth/sign up/Sign_up.dart';
//import 'dashboard/Home.dart';

void main() {
  Stripe.publishableKey = Private().stripePublishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Energy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const Login(),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
