import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:gns_app/assessment/image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ResidentialImages extends StatefulWidget {
  const ResidentialImages({Key? key}) : super(key: key);

  @override
  State<ResidentialImages> createState() => _ResidentialImagesState();
}

class _ResidentialImagesState extends State<ResidentialImages> {
  final List<XFile>? images = [];
  bool _box2Selected = false;
  bool _box3Selected = false;
  bool _box4Selected = false;

  Future pickImages() async {
    try {
      final List<XFile> selectedimages = await ImagePicker().pickMultiImage();
      if (selectedimages.isNotEmpty) {
        setState(() {
          images!.addAll(selectedimages);
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick Images : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: SizedBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Colors.green[600], size: 40),
              Text('Residential Images',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Text(
                  'Upload your Residential images by tapping the placeholder boxes.',
                  style: GoogleFonts.openSans(fontSize: 17),
                  textAlign: TextAlign.center),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 130,
                              width: 150,
                              child: GestureDetector(
                                onTap: () {
                                  pickImages();
                                },
                                child: Row(
                                  children: [
                                    images!.isNotEmpty == true
                                        ? Image.file(
                                            File(images![0].path),
                                            fit: BoxFit.cover,
                                            height: 130,
                                            width: 150,
                                          )
                                        : Image.asset('assets/blank.jpg',
                                            height: 130,
                                            width: 150,
                                            fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 130,
                              width: 150,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pickImages().whenComplete(
                                        () => _box2Selected = true);
                                  });
                                },
                                child: Row(
                                  children: [
                                    _box2Selected == true
                                        ? Image.file(
                                            File(images![1].path),
                                            fit: BoxFit.cover,
                                            height: 130,
                                            width: 150,
                                          )
                                        : Image.asset('assets/blank.jpg',
                                            height: 130,
                                            width: 150,
                                            fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 130,
                              width: 150,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pickImages().whenComplete(
                                        () => _box3Selected = true);
                                  });
                                },
                                child: Row(
                                  children: [
                                    _box3Selected == true
                                        ? Image.file(
                                            File(images![2].path),
                                            fit: BoxFit.cover,
                                            height: 130,
                                            width: 150,
                                          )
                                        : Image.asset('assets/blank.jpg',
                                            height: 130,
                                            width: 150,
                                            fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 130,
                              width: 150,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pickImages().whenComplete(
                                        () => _box4Selected = true);
                                  });
                                },
                                child: Row(
                                  children: [
                                    _box4Selected == true
                                        ? Image.file(
                                            File(images![3].path),
                                            fit: BoxFit.cover,
                                            height: 130,
                                            width: 150,
                                          )
                                        : Image.asset('assets/blank.jpg',
                                            height: 130,
                                            width: 150,
                                            fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              GestureDetector(
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Continue',
                          style: GoogleFonts.openSans(
                              fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                onTap: () => {print(images)},
              ),
            ],
          ))),
    );
  }
}
