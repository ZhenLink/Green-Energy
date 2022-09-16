import 'package:flutter/material.dart';

class ChatScrollEvent {
  final ScrollController controller = ScrollController();

  void controllScroll() {
    controller.animateTo(controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }
}
