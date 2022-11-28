import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: GoogleFonts.poppins(fontSize: 17, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Need Help?',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        'Find answers to your questions below. If you Query is not there talk to our customer online assistant for more help.',
                        style: GoogleFonts.openSans(fontSize: 17),
                        textAlign: TextAlign.center),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text('How to find customer online assistance?',
                      style: GoogleFonts.openSans(
                          fontSize: 17, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                        'All you have to do is click on the bottom navigation menu where there is a message icon and you will be redirected to the online assistant.',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text('How to do the Appliance assessment?',
                      style: GoogleFonts.openSans(
                          fontSize: 17, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                        'Click on the Buy button on the home page will redirect to a page where you can do the assesment.',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text('How to find more help?',
                      style: GoogleFonts.openSans(
                          fontSize: 17, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                        'All you have to do is click on the bottom navigation menu where there is a message icon and you will be redirected to the online assistant where you can present your query.',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
