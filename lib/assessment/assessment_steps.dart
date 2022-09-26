import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          currentStep: _currentStep,
          steps: const [
            Step(
                title: Text('Lighting Appliances'),
                content: Text('My first step')),
            Step(
                title: Text('Cooking Appliances'),
                content: Text('My second step')),
            Step(
                title: Text('Electronic Appliances'),
                content: Text('My Third step'))
          ],
        ),
      ),
    );
  }
}
