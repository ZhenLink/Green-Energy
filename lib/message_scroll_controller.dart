import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScrollController extends GetxController {
  final ScrollController controller = ScrollController();

  void controllScroll() {
    controller.animateTo(controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }
}
