import 'package:flutter/material.dart';
//import 'package:gns_app/auth/sign%20up/register_form.dart';
import 'package:gns_app/auth/sign%20up/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const Register());
          },
          child: Text(
            "Create Account",
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green),
          ),
        )
      ],
    );
  }
}
