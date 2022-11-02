import 'dart:io';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gns_app/Api/api.dart';
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
  final List _chosenCategoriesAndLocation = Get.arguments;
  final TextEditingController _answerController = TextEditingController();
  Response? _response;
  int _questionIndex = 0;
  ApplianceAssessment data = ApplianceAssessment();
  late List locationCoordinates = [];
  late List assessmentQuestions = [];
  var assessmentAnswers = [];

  //getting assessment questions from mongoDB
  getAssessmentQuestions() async {
    var categories = _chosenCategoriesAndLocation[0];

    _response = await MyAPI().getQuestions(categories, '/assessment/questions');
    if (_response!.statusCode == 200) {
      setState(() {
        assessmentQuestions = _response!.body;
      });
    } else {
      print(_response!.statusCode);
    }
  }

  //getting next questions from questions list
  void nextQuestion() {
    if (_questionIndex < assessmentQuestions.length) {
    } else {
      print('We have no more Questions');
    }
    setState(() {
      _questionIndex += 1;
    });
  }

  //Answering Question

  void setAssessmentAnswers(answerText, questionID, category, question) {
    if (answerText != null) {
      setState(() {
        assessmentAnswers.add({
          "Id": questionID,
          "Question": question,
          "Category": category,
          "Answer": answerText
        });
      });
    } else {
      print('The question has not been answered');
    }
  }

  @override
  void initState() {
    getAssessmentQuestions();
    super.initState();
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
                        subtitle: _questionIndex < assessmentQuestions.length
                            ? Text(
                                assessmentQuestions[_questionIndex]['Category']
                                    .toString(),
                                style: GoogleFonts.openSans(fontSize: 14))
                            : Text('categories finished',
                                style: GoogleFonts.openSans(fontSize: 14)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _questionIndex < assessmentQuestions.length
                                ? Question(
                                    questions:
                                        assessmentQuestions[_questionIndex]
                                                ['Question']
                                            .toString())
                                : Text('Assessment Completed!',
                                    style: GoogleFonts.openSans(fontSize: 16)),
                            TextField(
                                maxLines: 4,
                                minLines: 1,
                                controller: _answerController,
                                style: const TextStyle(fontSize: 17),
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: (() async => {
                                            if (_questionIndex <
                                                assessmentQuestions.length)
                                              {
                                                setAssessmentAnswers(
                                                    _answerController.text,
                                                    assessmentQuestions[
                                                        _questionIndex]['_id'],
                                                    assessmentQuestions[
                                                            _questionIndex]
                                                        ['Category'],
                                                    assessmentQuestions[
                                                            _questionIndex]
                                                        ['Question'])
                                              }
                                            else
                                              {print('done adding questions')},
                                            nextQuestion(),
                                            _answerController.clear(),
                                          }),
                                      child: const Icon(Icons.send)),
                                  hintText: 'Answer here',
                                  hintStyle: GoogleFonts.openSans(fontSize: 17),
                                  labelStyle:
                                      GoogleFonts.openSans(fontSize: 17),
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
