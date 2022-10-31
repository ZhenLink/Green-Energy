import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:get/get.dart';
import 'package:gns_app/Energy%20Monitor/EMonitor.dart';
import 'package:gns_app/User/Profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:gns_app/message_scroll_controller.dart';
import '../dashboard/home.dart';
import 'messages.dart';
import '../env/privates.dart';

class Assistant extends StatefulWidget {
  const Assistant({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Assistant> createState() => _AssistantState();
}

class _AssistantState extends State<Assistant> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  Private myPrivates = Private();
  int _selectedIndex = 1;

  @override
  void initState() {
    DialogFlowtter jsonInstance = DialogFlowtter.fromJson(myPrivates.authkeys);
    dialogFlowtter = jsonInstance;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Assistant',
              style: GoogleFonts.openSans(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              )),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.green[600]),
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
                onPressed: () {
                  Get.to(() => const Home());
                },
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_2_fill,
                text: 'Assistant',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.solar_power,
                text: 'Energy Monitor',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Emonitor());
                },
              ),
              GButton(
                icon: CupertinoIcons.person_alt_circle,
                text: 'Account',
                textStyle: GoogleFonts.openSans(
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => const Profile());
                },
              )
            ]),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Column(children: [
              Text(
                "Today",
                style: GoogleFonts.openSans(
                    fontSize: 15, color: Colors.blueGrey[900]),
              ),
              Text(" ${DateFormat("Hm").format(DateTime.now())} pm",
                  style: GoogleFonts.openSans(
                      fontSize: 15, color: Colors.blueGrey[900])),
            ]),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: Colors.green[600], size: 25),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter message',
                          labelStyle: GoogleFonts.openSans(fontSize: 17),
                        ),
                        controller: _controller,
                        style: GoogleFonts.openSans(
                            color: Colors.blueGrey[900], fontSize: 16),
                      ),
                    )),
                    IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.green[600],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  sendMessage(String text) async {
    try {
      if (text.isEmpty) {
      } else {
        setState(() {
          addMessage(Message(text: DialogText(text: [text])), true);
        });

        DetectIntentResponse response = await dialogFlowtter.detectIntent(
            queryInput: QueryInput(text: TextInput(text: text)));
        if (response.message == null) {
          return;
        } else {
          setState(() {
            addMessage(response.message!);
          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
