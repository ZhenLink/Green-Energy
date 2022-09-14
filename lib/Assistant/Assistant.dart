import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Messages.dart';
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
          title: const Text('Assistant'),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.blueGrey[900],
          backgroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}",
                style: GoogleFonts.openSans(
                    fontSize: 13, color: Colors.blueGrey[900])),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  style: GoogleFonts.openSans(
                      color: Colors.blueGrey[900], fontSize: 14),
                )),
                IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blueGrey[800],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  sendMessage(String text) async {
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
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
