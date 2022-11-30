import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Assistant/assistant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../dashboard/home.dart';

class Emonitor extends StatefulWidget {
  const Emonitor({Key? key}) : super(key: key);

  @override
  State<Emonitor> createState() => _EmonitorState();
}

class _EmonitorState extends State<Emonitor> {
// get current readings from the cloud
  Stream<Int> currentReadings() async* {}
  int _selectedIndex = 2;
  final Color lowpower = Colors.red;
  final Color highpower = Colors.green;
  late Color? perfomanceColor;
  late String? perfomanceMessage;

  solarPerfomance(current) {
    if (current >= 50) {
      setState(() {
        perfomanceMessage = "Active";
      });
    } else if (current < 25) {
      setState(() {
        perfomanceMessage = "Low Power";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    solarPerfomance(0.8);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Energy Monitor',
            style: GoogleFonts.openSans(
                fontSize: 17,
                color: Colors.blueGrey[800],
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center),
        foregroundColor: Colors.blueGrey[800],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Column(children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green[600],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '24W',
                        style: GoogleFonts.openSans(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Current Power',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Column(
              children: [
                Text('Solar Perfomance',
                    style: GoogleFonts.openSans(
                        fontSize: 17,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,
                        color: perfomanceMessage == 'Active'
                            ? highpower
                            : lowpower,
                        size: 10),
                    const Padding(padding: EdgeInsets.only(left: 4)),
                    Text(
                      perfomanceMessage!,
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: perfomanceMessage == 'Active'
                              ? highpower
                              : lowpower,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
            gap: 8,
            tabBackgroundColor: Colors.green,
            haptic: true,
            padding: const EdgeInsets.all(10),
            activeColor: Colors.white,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: CupertinoIcons.home,
                text: 'Home',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Home());
                },
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Assistant(title: 'Assistant'));
                },
              ),
              GButton(
                icon: Icons.solar_power,
                text: 'Energy Monitor',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }
}
