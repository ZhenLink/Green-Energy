import 'package:flutter/material.dart';
import 'package:gns_app/dashboard/Welcome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          CircleAvatar(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 6))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.vertical,
          child: Column(),
        ),
      ),
    );
  }
}
