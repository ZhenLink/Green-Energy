import 'package:flutter/cupertino.dart';
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
                    fontSize: 27, fontWeight: FontWeight.bold),
              ),
              Text(
                'We offer multiple solutions that will fit your needs.',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: Chip(
                  deleteIcon: const Icon(Icons.cancel),
                  label: const Text('Categories'),
                  autofocus: true,
                  labelStyle: GoogleFonts.openSans(
                      color: Colors.white, fontWeight: FontWeight.w400),
                  padding: const EdgeInsets.all(8),
                  avatar: const Icon(
                    CupertinoIcons.square_grid_2x2_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
              Chip(
                label: const Text('Equipments'),
                labelStyle: GoogleFonts.openSans(
                    color: Colors.blueGrey[600], fontWeight: FontWeight.w400),
                padding: const EdgeInsets.all(8),
                avatar: Icon(
                  Icons.handyman_outlined,
                  color: Colors.blueGrey[600],
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
