import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Models/appliance_assessment.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard/Home.dart';

class Completion extends StatefulWidget {
  const Completion({Key? key, required this.category}) : super(key: key);
  final List category;

  @override
  State<Completion> createState() => _CompletionState();
}

class _CompletionState extends State<Completion> {
  dynamic assessmentdata = Get.arguments;
  @override
  void initState() {
    // print(_assessmentData);
    ApplianceAssessment().assessmentManager(assessmentdata, widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completion'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green[600], size: 40),
              Text('Assessment Completed',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                    'Thanks for completing the appliance assessment. Your Qoutation will be sent shortly to your email address.',
                    style: GoogleFonts.openSans(fontSize: 17),
                    textAlign: TextAlign.center),
              ),
              GestureDetector(
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Return Home',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                onTap: () => {Get.to(() => const Home())},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
