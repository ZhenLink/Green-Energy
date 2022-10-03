import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/question.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/appliance_assessment.dart';
import 'package:geolocator/geolocator.dart';

class AssessmentSteps extends StatefulWidget {
  const AssessmentSteps({Key? key}) : super(key: key);

  @override
  State<AssessmentSteps> createState() => _AssessmentStepsState();
}

class _AssessmentStepsState extends State<AssessmentSteps> {
  final List _chosenCategories = Get.arguments;
  final Geolocator _geolocator = Geolocator();
  late Position _currentPosition;
  late int _currentStep = 0;
  int _questionIndex = 0;
  ApplianceAssessment data = ApplianceAssessment();

  getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng currentLocation =
        LatLng(latitude: position.latitude, longitude: position.longitude);
    return print(currentLocation);
  }

  void nextQuestion() {
    if (_questionIndex < data.applianceAssessmentQuestions.length) {
      print('We have more Questions');
    }
    setState(() {
      _questionIndex += 1;
      print(_chosenCategories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          currentStep: _currentStep,
          type: StepperType.vertical,
          steps: [
            Step(
                title: Text('Residential Location',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: GestureDetector(
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Get Location',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () => {print(getMyLocation()), print('ressukt')},
                ),
                subtitle: Text('House coordinates',
                    style: GoogleFonts.openSans(fontSize: 14))),
            Step(
                title: Text('Residential Images',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: const Text('My Third step'),
                subtitle: Text('House pictures',
                    style: GoogleFonts.openSans(fontSize: 14))),
            Step(
                title: Text('Appliances Survey',
                    style: GoogleFonts.openSans(fontSize: 18)),
                subtitle: Text('Appliance assessment',
                    style: GoogleFonts.openSans(fontSize: 14)),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _questionIndex < data.applianceAssessmentQuestions.length
                        ? Question(
                            questions: data
                                .applianceAssessmentQuestions[_questionIndex]
                                    ['Question']
                                .toString())
                        : Text('Completed! Continue',
                            style: GoogleFonts.openSans(fontSize: 16)),
                    TextField(
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (() => {nextQuestion()}),
                              child: const Icon(Icons.send)),
                          hintText: 'Answer here',
                          hintStyle: GoogleFonts.openSans(fontSize: 18),
                          labelStyle: GoogleFonts.openSans(fontSize: 18),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
