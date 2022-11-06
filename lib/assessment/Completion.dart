import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Models/appliance_assessment.dart';

class Completion extends StatefulWidget {
  const Completion({Key? key}) : super(key: key);

  @override
  State<Completion> createState() => _CompletionState();
}

class _CompletionState extends State<Completion> {
  final List _assessmentData = Get.arguments;
  @override
  void initState() {
    ApplianceAssessment().calculateApplianceLoad(_assessmentData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completion'),
      ),
      body: const Center(
        child: Text('Thanks for completing the assessment'),
      ),
    );
  }
}
