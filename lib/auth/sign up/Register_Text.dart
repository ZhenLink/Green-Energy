import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
        Text(
          "Create an account",
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "We will use this information to create your profile.",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
