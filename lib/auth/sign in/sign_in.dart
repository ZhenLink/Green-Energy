import 'package:flutter/material.dart';
import './message_fields.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);
  final String _title = "Sign In";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Text(_title),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SignInForm(),
    );
  }
}
