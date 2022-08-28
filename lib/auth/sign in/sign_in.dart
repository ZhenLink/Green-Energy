import 'package:flutter/material.dart';
import 'package:gns_app/auth/sign%20in/Welcome_text.dart';
import 'Login_form.dart';
import 'Options.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
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
      body: Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            children: const [WelcomeText(), SignInForm(), Options()],
          ),
        ),
      ),
    );
  }
}
