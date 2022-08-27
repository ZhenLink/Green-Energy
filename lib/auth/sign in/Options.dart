import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(
          "Create Account",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.green),
        )
      ],
    );
  }
}
