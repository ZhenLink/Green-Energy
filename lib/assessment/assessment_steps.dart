import 'package:flutter/material.dart';
import 'package:gns_app/assessment/question.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/appliance_assessment.dart';

class AssessmentSteps extends StatefulWidget {
  const AssessmentSteps({Key? key}) : super(key: key);

  @override
  State<AssessmentSteps> createState() => _AssessmentStepsState();
}

class _AssessmentStepsState extends State<AssessmentSteps> {
  late int _currentStep = 0;
  int _questionIndex = 0;
  ApplianceAssessment data = ApplianceAssessment();

  void nextQuestion() {
    if (_questionIndex < data.applianceAssessmentQuestions.length) {
      print('We have more Questions');
    }
    setState(() {
      _questionIndex += 1;
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
                title: Text('Lighting Appliances',
                    style: GoogleFonts.openSans(fontSize: 18)),
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
            Step(
                title: Text('Cooking Appliances',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: const Text('Hello')),
            Step(
                title: Text('Electronic Appliances',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: const Text('My Third step'))
          ],
        ),
      ),
    );
  }
}
