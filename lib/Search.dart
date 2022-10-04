import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[600],
        title: TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
                tooltip: 'Search',
                enableFeedback: true,
                color: Colors.white,
                onPressed: () => {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            hintStyle:
                GoogleFonts.openSans(fontSize: 17, color: Colors.white70),
          ),
          style: GoogleFonts.openSans(color: Colors.white, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: const Center(
        child: Text(''),
      ),
    );
  }
}
