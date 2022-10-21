import 'dart:io';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/question.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/appliance_assessment.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AssessmentSteps extends StatefulWidget {
  const AssessmentSteps({Key? key}) : super(key: key);

  @override
  State<AssessmentSteps> createState() => _AssessmentStepsState();
}

class _AssessmentStepsState extends State<AssessmentSteps> {
  //final List _chosenCategories = Get.arguments;
  late Position _currentPosition;
  late int _currentStep = 0;
  bool _locationPinned = false;
  //bool locationStatus = false;
  int _questionIndex = 0;
  ApplianceAssessment data = ApplianceAssessment();
  late List locationCoordinates = [];
  final int totalSteps = 2;

  void nextAssessmentStep() {
    if (_currentStep != totalSteps) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      print('We are done here');
    }
  }

  void nextQuestion() {
    if (_questionIndex < data.applianceAssessmentQuestions.length) {
      print('We have no more Questions');
    }
    setState(() {
      _questionIndex += 1;
      //print(_chosenCategories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          type: StepperType.vertical,
          steps: [
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
