import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/assessment.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Card(
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage('assets/hybrid-Solar.gif'),
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.darken,
                    height: 150,
                    width: double.maxFinite,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Backup Solar System',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2)),
                        Text(
                          'A full solar installation that is connected to the main electrical power which  automatically switches on/off depending on the availability of main power.',
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 17),
                          softWrap: true,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4)),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Assessment());
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Get',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.blueGrey[900])),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.green,
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/Off-Grid-System.gif'),
                      fit: BoxFit.fill,
                      height: 150,
                      width: double.maxFinite,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Solar System',
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2)),
                          Text(
                            'A full solar installation that supplies electricity to the whole house independently from the main electric power.',
                            style: GoogleFonts.openSans(
                                color: Colors.white, fontSize: 17),
                            softWrap: true,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4)),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const Assessment());
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Get',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.blueGrey[900])),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
            ),
          ],
        ));
  }
}
