import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:gns_app/Assistant/assistant.dart';
import 'package:gns_app/User/Profile.dart';
//import 'package:get/get.dart';
import 'package:gns_app/dashboard/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import '../Energy Monitor/EMonitor.dart';
import '../Search.dart';
import 'categories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        leading: const Icon(CupertinoIcons.sunset_fill),
        foregroundColor: Colors.white,
        title: Text('Home',
            style: GoogleFonts.openSans(
                fontSize: 22, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.green[600],
        elevation: 0,
        actions: [
          IconButton(
              highlightColor: Colors.white,
              splashColor: Colors.white,
              tooltip: 'Search',
              onPressed: () => {Get.to(() => const Search())},
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
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
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(),
                onPressed: () {
                  Get.to(() => const Assistant(title: 'Asistant'));
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
                onPressed: () {
                  Get.to(() => const Profile());
                },
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
