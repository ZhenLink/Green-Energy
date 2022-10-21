import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Industrial extends StatefulWidget {
  const Industrial({Key? key}) : super(key: key);

  @override
  State<Industrial> createState() => _IndustrialState();
}

class _IndustrialState extends State<Industrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Industrial',
          style: GoogleFonts.openSans(fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Text(
          'Not yet implented..',
          style: GoogleFonts.openSans(fontSize: 18),
        ),
      ),
    );
  }
}
