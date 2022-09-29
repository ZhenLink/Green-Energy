import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assessment_steps.dart';

class ApplianceChoice extends StatefulWidget {
  const ApplianceChoice({Key? key}) : super(key: key);

  @override
  State<ApplianceChoice> createState() => _ApplianceChoiceState();
}

class _ApplianceChoiceState extends State<ApplianceChoice> {
  bool _timeFinished = false;

  startAssessment() {
    Timer? timer =
        Timer(const Duration(seconds: 5), () => {_timeFinished = true});
  }

  bool electronicChip = false;
  bool cookingChip = false;
  bool lightingChip = false;
  bool cosmeticChip = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Appliance category',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Select the appliance category you want the solar to be connected to below.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, right: 5, top: 10, bottom: 10),
                        child: ChoiceChip(
                            onSelected: (currentChipState) {
                              setState(() {
                                electronicChip = currentChipState;
                              });
                            },
                            pressElevation: 0,
                            backgroundColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 2),
                            elevation: 0,
                            selectedColor: Colors.green[700],
                            selectedShadowColor: Colors.white,
                            avatar:
                                const Icon(Icons.computer, color: Colors.white),
                            label: const Text('Electronics',
                                style: TextStyle(color: Colors.white)),
                            selected: electronicChip),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 5),
                        child: ChoiceChip(
                            onSelected: (cookingChipState) {
                              setState(() {
                                cookingChip = cookingChipState;
                              });
                            },
                            elevation: 0,
                            selectedColor: Colors.green[700],
                            selectedShadowColor: Colors.white,
                            pressElevation: 0,
                            backgroundColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 4),
                            avatar: const Icon(Icons.microwave_outlined,
                                color: Colors.white),
                            label: const Text('Cooking',
                                style: TextStyle(color: Colors.white)),
                            selected: cookingChip),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, right: 5, top: 10, bottom: 10),
                        child: ChoiceChip(
                            onSelected: (lightingChipState) {
                              setState(() {
                                lightingChip = lightingChipState;
                              });
                            },
                            elevation: 0,
                            selectedColor: Colors.green[700],
                            selectedShadowColor: Colors.white,
                            pressElevation: 0,
                            backgroundColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 4),
                            avatar: const Icon(Icons.lightbulb_sharp,
                                color: Colors.white),
                            label: const Text('Lighting',
                                style: TextStyle(color: Colors.white)),
                            selected: lightingChip),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, right: 5, top: 10, bottom: 10),
                        child: ChoiceChip(
                            onSelected: (cosmeticChipChipState) {
                              setState(() {
                                cosmeticChip = cosmeticChipChipState;
                              });
                            },
                            elevation: 0,
                            selectedColor: Colors.green[700],
                            selectedShadowColor: Colors.white,
                            pressElevation: 0,
                            backgroundColor: Colors.blueGrey[900],
                            labelPadding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 2, right: 4),
                            avatar: const Icon(Icons.compost_outlined,
                                color: Colors.white),
                            label: const Text('Cosmetics',
                                style: TextStyle(color: Colors.white)),
                            selected: cosmeticChip),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text('Other Appliances (Specify here):',
                          style: GoogleFonts.openSans(fontSize: 18)),
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
                      onTap: () => {
                        startAssessment(),
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            useSafeArea: true,
                            builder: (_) => AlertDialog(
                                title: Text('Notification',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.blueGrey[900])),
                                backgroundColor: Colors.white,
                                content: _timeFinished == false
                                    ? Expanded(
                                        child: Row(
                                          children: [
                                            const CircularProgressIndicator(),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5)),
                                            Text(
                                              'Setting up assessment..',
                                              softWrap: true,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.blueGrey[900]),
                                            ),
                                          ],
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Get.to(() => const AssessmentSteps());
                                        },
                                        child: Container(
                                          width: 140,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Start assessment',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      )))
                      },
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
