// ignore: file_names
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late bool _isSelected = false;
  late int _applianceScore = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              const Icon(Icons.waving_hand, color: Colors.amber),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
              Text(
                "Hello, Noel.",
                style: GoogleFonts.openSans(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 90)),
              const CircleAvatar(
                foregroundImage: AssetImage('assets/profile.jpg'),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Column(
            children: [
              Text(
                'Get quality Solar Systems with us.',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                'We offer multiple solutions that will fit your needs.',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 13)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.hardEdge,
            child: Row(
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
                      Icons.category,
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
                const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                Chip(
                  label: const Text('News'),
                  labelStyle: GoogleFonts.openSans(
                      color: Colors.blueGrey[600], fontWeight: FontWeight.w400),
                  padding: const EdgeInsets.all(8),
                  avatar: Icon(
                    Icons.newspaper,
                    color: Colors.blueGrey[600],
                    size: 20,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                ChoiceChip(
                  selected: _isSelected,
                  onSelected: (newBooleanValue) {
                    setState(() {
                      _isSelected = newBooleanValue;
                      _applianceScore += 5;
                    });
                  },
                  label: const Text('Renewable'),
                  labelStyle: GoogleFonts.openSans(
                      color: Colors.blueGrey[600], fontWeight: FontWeight.w400),
                  padding: const EdgeInsets.all(8),
                  avatar: Icon(
                    Icons.energy_savings_leaf_rounded,
                    color: Colors.blueGrey[600],
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
