import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/client_location.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assessment_steps.dart';

class ApplianceChoice extends StatefulWidget {
  const ApplianceChoice({Key? key}) : super(key: key);

  @override
  State<ApplianceChoice> createState() => _ApplianceChoiceState();
}

class _ApplianceChoiceState extends State<ApplianceChoice> {
  bool electronicChip = false;
  bool cookingChip = false;
  bool lightingChip = false;
  bool cosmeticChip = false;

  List chosenCategories = [];

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
                                if (electronicChip) {
                                  chosenCategories.add('Electronic');
                                } else {
                                  chosenCategories.remove('Electronic');
                                }
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
                                if (cookingChip) {
                                  chosenCategories.add('Cooking');
                                } else {
                                  chosenCategories.remove('Cooking');
                                }
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
                                if (lightingChip) {
                                  chosenCategories.add('Lighting');
                                } else {
                                  chosenCategories.remove('Lighting');
                                }
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
                                if (cosmeticChip) {
                                  chosenCategories.add('Cosmetic');
                                } else {
                                  chosenCategories.remove('Cosmetic');
                                }
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
                        if (chosenCategories.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please choose atleast one category'),
                              ),
                            ),
                          }
                        else
                          {
                            Get.to(() => const ClientLocation(),
                                arguments: chosenCategories)
                          }
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
