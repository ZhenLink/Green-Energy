import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Already have an account?",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        Text(
          "Sign in",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.green),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 20.0))
      ],
    );
  }
}
