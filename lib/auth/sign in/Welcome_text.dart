import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
          Text(
            "Welcome Back",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "Sign in to your account to continue.",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
        ],
      ),
    );
  }
}
