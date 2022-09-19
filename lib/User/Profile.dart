import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Assistant/Assistant.dart';
import '../Energy Monitor/EMonitor.dart';
import '../dashboard/Home.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Profile',
            style: GoogleFonts.openSans(
                fontSize: 22, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'This is the Profile Page',
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
                textStyle: GoogleFonts.openSans(),
                onPressed: () {
                  Get.to(() => const Home());
                },
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(),
                onPressed: () {
                  Get.to(() => const Assistant(title: 'Assistant'));
                },
              ),
              GButton(
                icon: Icons.solar_power,
                text: 'Energy Monitor',
                textStyle: GoogleFonts.openSans(),
                onPressed: () {
                  Get.to(() => const Emonitor());
                },
              ),
              GButton(
                icon: CupertinoIcons.person_alt_circle,
                text: 'Account',
                textStyle: GoogleFonts.openSans(),
              )
            ]),
      ),
    );
  }
}
