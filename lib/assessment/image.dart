import 'dart:io';

import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({Key? key, required this.imagepath}) : super(key: key);
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130,
        width: 150,
        child: Row(
          children: [
            Image.file(
              File(imagepath),
              fit: BoxFit.cover,
              height: 130,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}
