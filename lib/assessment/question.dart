import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatelessWidget {
  const Question({Key? key, required this.questions}) : super(key: key);
  final String questions;

  @override
  Widget build(BuildContext context) {
    return Text(questions, style: GoogleFonts.openSans(fontSize: 17));
  }
}
