import 'dart:io';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/question.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/appliance_assessment.dart';

import 'package:image_picker/image_picker.dart';

class AssessmentSteps extends StatefulWidget {
  const AssessmentSteps({Key? key}) : super(key: key);

  @override
  State<AssessmentSteps> createState() => _AssessmentStepsState();
}

class _AssessmentStepsState extends State<AssessmentSteps> {
  //final List _chosenCategories = Get.arguments;
  late int _currentStep = 0;

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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.question_answer_sharp,
                    color: Colors.green[600], size: 40),
                Text('Assessment Questions',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                      'Help us to assess the appliance load of your residence by answering questions below.',
                      style: GoogleFonts.openSans(fontSize: 17),
                      textAlign: TextAlign.center),
                ),
                Stepper(
                  type: StepperType.vertical,
                  steps: [
                    Step(
                        title: Text('Appliance Category',
                            style: GoogleFonts.openSans(fontSize: 18)),
                        subtitle: Text('Electronics',
                            style: GoogleFonts.openSans(fontSize: 14)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _questionIndex <
                                    data.applianceAssessmentQuestions.length
                                ? Question(
                                    questions: data
                                        .applianceAssessmentQuestions[
                                            _questionIndex]['Question']
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
                                  labelStyle:
                                      GoogleFonts.openSans(fontSize: 18),
                                )),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
