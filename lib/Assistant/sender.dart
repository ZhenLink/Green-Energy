import 'package:flutter/material.dart';
import 'package:gns_app/Assistant/chat.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class Sender extends StatelessWidget {
  const Sender({Key? key, required this.messages}) : super(key: key);

  final List<Map> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              "Today, ${DateFormat("Hm").format(DateTime.now())}",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          ),
          Flexible(
              child: ListView.builder(
            itemBuilder: ((context, index) => const Chat()),
            reverse: true,
            itemCount: messages.length,
          )),
          const SizedBox(
            height: 22,
          ),
          const Divider(
            height: 5.0,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
