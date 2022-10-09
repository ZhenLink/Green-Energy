import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Assistant/assistant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../User/Profile.dart';
import '../dashboard/home.dart';

class Emonitor extends StatefulWidget {
  const Emonitor({Key? key}) : super(key: key);

  @override
  State<Emonitor> createState() => _EmonitorState();
}

class _EmonitorState extends State<Emonitor> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Monitor'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'This is the E-Monitor Page',
          style: TextStyle(fontSize: 22),
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
              GButton(
                icon: CupertinoIcons.person_alt_circle,
                text: 'Account',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Profile());
                },
              )
            ]),
      ),
    );
  }
}
