import 'package:flutter/material.dart';
import 'package:gns_app/auth/sign%20in/welcome_text.dart';
import 'login_form.dart';
import 'options.dart';

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
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.maxFinite,
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [WelcomeText(), SignInForm(), Options()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
