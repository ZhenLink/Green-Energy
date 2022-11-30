import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gns_app/Assistant/Assistant.dart';
import 'package:gns_app/Payments/Payment.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Get quality Solar Systems with us.',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
              Text(
                'We offer multiple solutions that will fit your needs.',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const Assistant(title: 'Asistant'),
                      arguments: "About Green Energy Solutions");
                },
                child: Container(
                  width: 142,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Get Started',
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.blueGrey[900])),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2)),
                      const Icon(Icons.arrow_right_alt)
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
              GestureDetector(
                onTap: () {
                  Get.to(() => const Payment());
                },
                child: Container(
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Payments',
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.blueGrey[900])),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2)),
                      const Icon(Icons.payments)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
