import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Assistant/Assistant.dart';
//import 'package:get/get.dart';
import 'package:gns_app/dashboard/Welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        leading: const Icon(Icons.solar_power),
        foregroundColor: Colors.white,
        title: Text('Home',
            style: GoogleFonts.openSans(
                fontSize: 22, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.green[600],
        elevation: 0,
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
                active: true,
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(),
                onPressed: () =>
                    Get.to(() => const Assistant(title: 'Assistant')),
              ),
              GButton(
                icon: Icons.solar_power,
                text: 'Energy Monitor',
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
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              Welcome(title: 'Welcome'),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Categories()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(CupertinoIcons.question, color: Colors.green),
      ),
    );
  }
}
