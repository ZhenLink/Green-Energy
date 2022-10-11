import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ResidentialImages extends StatefulWidget {
  const ResidentialImages({Key? key}) : super(key: key);

  @override
  State<ResidentialImages> createState() => _ResidentialImagesState();
}

class _ResidentialImagesState extends State<ResidentialImages> {
  File? image, image2, image3, image4;
  Future pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final temporaryimage = File(image.path);

      setState(() {
        this.image = temporaryimage;
      });
    } on PlatformException catch (e) {
      print('Failed to pick Iamges : $e');
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
                child: Column(
                  children: [
                    Row(
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
                                  image != null
                                      ? Image.file(
                                          image!,
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
                                pickImages();
                              },
                              child: Row(
                                children: [
                                  image2 != null
                                      ? Image.file(
                                          image!,
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
                    Row(
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
                                  image3 != null
                                      ? Image.file(
                                          image!,
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
                                pickImages();
                              },
                              child: Row(
                                children: [
                                  image4 != null
                                      ? Image.file(
                                          image!,
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              GestureDetector(
                child: Container(
                  width: 120,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Upload images',
                          style: GoogleFonts.openSans(
                              fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                onTap: () => {},
              ),
            ],
          ))),
    );
  }
}
