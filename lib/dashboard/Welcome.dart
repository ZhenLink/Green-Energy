import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
          child: Column(
        children: const [Text("Hello Metro")],
      )),
    );
  }
}
