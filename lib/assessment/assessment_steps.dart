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
  File? image;
  Future pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick Iamges : $e');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      //permission = await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  final List _chosenCategories = Get.arguments;
  late Position _currentPosition;
  late int _currentStep = 0;
  bool _locationPinned = false;
  //bool locationStatus = false;
  int _questionIndex = 0;
  ApplianceAssessment data = ApplianceAssessment();
  late List locationCoordinates = [];
  final int totalSteps = 2;

  getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    LatLng currentLocation =
        LatLng(latitude: position.latitude, longitude: position.longitude);

    if (currentLocation.latitude == null && currentLocation.longitude == null) {
      print('Couldnt get location');
    } else {
      setState(() {
        _locationPinned == true;
      });
      locationCoordinates.add(currentLocation);
      print(locationCoordinates);
    }
  }

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
          onStepContinue: () {
            nextAssessmentStep();
          },
          currentStep: _currentStep,
          type: StepperType.vertical,
          steps: [
            Step(
                title: Text('Residential Location',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: GestureDetector(
                  child: Container(
                    width: 110,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _locationPinned != _locationPinned
                            ? const Text('Completed')
                            : Text('Get Location',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () => {
                    _determinePosition(),
                    getMyLocation(),
                  },
                ),
                subtitle: Text('House coordinates',
                    style: GoogleFonts.openSans(fontSize: 14))),
            Step(
                title: Text('Residential Images',
                    style: GoogleFonts.openSans(fontSize: 18)),
                content: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0)),
                      GestureDetector(
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Upload images',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white)),
                            ],
                          ),
                        ),
                        onTap: () => {pickImages()},
                      ),
                    ],
                  ),
                ),
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
