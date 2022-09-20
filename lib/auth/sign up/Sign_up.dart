import 'package:flutter/material.dart';
//import 'package:gns_app/auth/sign%20in/Welcome_text.dart';
import 'package:gns_app/auth/sign%20up/Register_Form.dart';
import 'Register_Text.dart';
import 'Options.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  final String _title = "Sign Up";

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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                RegisterText(),
                RegisterForm(),
                RegisterOptions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
