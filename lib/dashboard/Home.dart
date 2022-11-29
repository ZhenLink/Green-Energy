import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:gns_app/Assistant/assistant.dart';
import 'package:gns_app/Energy%20Monitor/device.dart';
import 'package:gns_app/User/Profile.dart';
import 'package:gns_app/dashboard/Help.dart';
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
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Assistant(title: 'Asistant'));
                },
              ),
              GButton(
                icon: Icons.solar_power,
                text: 'Energy Monitor',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const DeviceCheck());
                },
              ),
            ]),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            title: Text('Home',
                style: GoogleFonts.openSans(
                  color: Colors.white,
                )),
            expandedHeight: 310,
            pinned: true,
            leading:
                const Icon(CupertinoIcons.sunset_fill, color: Colors.white),
            backgroundColor: Colors.green[600],
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  padding: const EdgeInsets.all(18),
                  color: Colors.green[600],
                  child: const Welcome(title: 'Welcome'),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    tooltip: 'Search',
                    onPressed: () => {Get.to(() => const Search())},
                    icon: const Icon(Icons.search,
                        size: 30, color: Colors.white)),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.square_grid_2x2_fill,
                            color: Colors.green[600]),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          'Solar Categories',
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey[900]),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    const Categories()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.to(() => const Help());
        },
        child: const Icon(CupertinoIcons.question, color: Colors.green),
      ),
    );
  }
}
