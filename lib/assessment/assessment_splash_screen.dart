import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssessmentSplashScreen extends StatelessWidget {
  const AssessmentSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('lib/images/loader.gif')),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                'Please wait while we are setting up the assessment.',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[700]),
              ),
            ),
            const CircularProgressIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Continue',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
