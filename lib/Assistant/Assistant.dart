import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
//import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Messages.dart';

class Assistant extends StatefulWidget {
  const Assistant({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Assistant> createState() => _AssistantState();
}

class _AssistantState extends State<Assistant> {
  DialogFlowtter? dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
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
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Colors.blueGrey[800],
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                )),
                IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
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

      DetectIntentResponse response = await dialogFlowtter!
          .detectIntent(queryInput: QueryInput(text: TextInput(text: text)));
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
