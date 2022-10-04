import 'package:flutter/material.dart';
import 'package:gns_app/assessment/appliance_choice.dart';
import 'package:gns_app/assessment/utility_choice.dart';
//import 'package:gns_app/assessment/assessment_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Assessment extends StatefulWidget {
  const Assessment({Key? key}) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Assessment',
            style: GoogleFonts.openSans(
                fontSize: 22, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      body: const SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: UtilityChoice(),
      ),
    );
  }
}
