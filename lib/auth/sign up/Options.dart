import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/auth/sign%20in/login_form.dart';
import 'package:gns_app/auth/sign%20in/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Already have an account?",
          style: GoogleFonts.openSans(fontSize: 18),
        ),
        GestureDetector(
          child: Text(
            "Sign in",
            style: GoogleFonts.openSans(fontSize: 18, color: Colors.green),
          ),
          onTap: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registered successfully'),
              ),
            ),
            Get.to(() => const Login())
          },
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 20.0))
      ],
    );
  }
}
