import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gns_app/assessment/assessment_steps.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  //final Completer<GoogleMapController> _mapController = Completer();

  final List _chosenCategoriesAndLocation = Get.arguments;

  static const LatLng sourceLocation = LatLng(-15.810880, 34.994546);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Your Current Location',
              style: GoogleFonts.openSans(
                  fontSize: 19,
                  color: Colors.blueGrey[800],
                  fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          height: double.maxFinite,
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            GoogleMap(
                initialCameraPosition:
                    const CameraPosition(target: sourceLocation, zoom: 14.5),
                markers: {
                  const Marker(
                    markerId: MarkerId('Home'),
                    position: sourceLocation,
                  )
                }),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: 'Continue',
          onPressed: () {
            Get.to(() => const AssessmentSteps(),
                arguments: _chosenCategoriesAndLocation);
          },
          child: const Icon(CupertinoIcons.arrow_right, color: Colors.green),
        ));
  }
}
