import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Models/appliance_assessment.dart';

class Completion extends StatefulWidget {
  const Completion({Key? key, required this.category}) : super(key: key);
  final List category;

  @override
  State<Completion> createState() => _CompletionState();
}

class _CompletionState extends State<Completion> {
  dynamic assessmentdata = Get.arguments;
  @override
  void initState() {
    // print(_assessmentData);
    ApplianceAssessment()
        .calculateApplianceLoad(assessmentdata, widget.category);
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
