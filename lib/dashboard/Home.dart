import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/dashboard/Welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            onTabChange: (index) {},
            tabs: [
              GButton(
                icon: CupertinoIcons.home,
                text: 'Home',
                textStyle: GoogleFonts.openSans(),
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(),
              ),
              GButton(
                icon: Icons.newspaper_outlined,
                text: 'News',
                textStyle: GoogleFonts.openSans(),
              ),
              GButton(
                icon: CupertinoIcons.person_alt_circle,
                text: 'Account',
                textStyle: GoogleFonts.openSans(),
              )
            ]),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        child: const SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: Welcome(title: 'Hello'),
          ),
        ),
      ),
    );
  }
}
