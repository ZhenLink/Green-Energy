import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/assessment_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplianceChoice extends StatelessWidget {
  const ApplianceChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Appliance category',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
              const Text(
                'Select the appliance category you want the solar to be connected to below.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 5),
                        child: ChoiceChip(
                            disabledColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 2),
                            elevation: 1,
                            avatar:
                                const Icon(Icons.computer, color: Colors.white),
                            label: const Text('Electronics',
                                style: TextStyle(color: Colors.white)),
                            selected: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 5),
                        child: ChoiceChip(
                            disabledColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 4),
                            avatar: const Icon(Icons.microwave_outlined,
                                color: Colors.white),
                            label: const Text('Cooking',
                                style: TextStyle(color: Colors.white)),
                            selected: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 5),
                        child: ChoiceChip(
                            disabledColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 4),
                            avatar: const Icon(Icons.lightbulb_sharp,
                                color: Colors.white),
                            label: const Text('Lighting',
                                style: TextStyle(color: Colors.white)),
                            selected: false),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Text('Other Appliances (Specify here):',
                          style: TextStyle(fontSize: 18)),
                    ),
                    TextField(
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText:
                              'Enter message (Separate with whitespace), ',
                          hintStyle: GoogleFonts.openSans(fontSize: 18),
                          labelStyle: GoogleFonts.openSans(fontSize: 18),
                        )),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    GestureDetector(
                      child: Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Continue',
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white)),
                          ],
                        ),
                      ),
                      onTap: () =>
                          {Get.to(() => const AssessmentSplashScreen())},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
