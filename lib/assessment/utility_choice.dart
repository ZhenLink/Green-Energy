import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/industrial.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appliance_choice.dart';

class UtilityChoice extends StatelessWidget {
  const UtilityChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.online_prediction_sharp,
                  color: Colors.green[600], size: 42),
              Text('Utility type',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
                child: Text(
                  'Select your desired solar application type below to proceed.',
                  style: GoogleFonts.openSans(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Industrial());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                            height: 70,
                            width: 150,
                            color: Colors.blueGrey[900],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.factory,
                                        color: Colors.white),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      'Industrial',
                                      style: GoogleFonts.openSans(
                                          fontSize: 15, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ApplianceChoice());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                            height: 70,
                            width: 150,
                            color: Colors.blueGrey[900],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.house,
                                      color: Colors.white,
                                    ),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Text('Residential',
                                        style: GoogleFonts.openSans(
                                            fontSize: 17, color: Colors.white),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
