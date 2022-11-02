import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gns_app/assessment/assessment_steps.dart';
import 'package:gns_app/assessment/residential_images.dart';
import 'package:google_fonts/google_fonts.dart';
import '../env/privates.dart';

class ClientLocation extends StatefulWidget {
  const ClientLocation({Key? key}) : super(key: key);

  @override
  State<ClientLocation> createState() => _ClientLocationState();
}

class _ClientLocationState extends State<ClientLocation> {
  final List _applianceCategories = Get.arguments;
  String _locationAddress = "Not set";
  var _locationCoordinates;
  bool _locationSet = false;
  final List _locationAndApplianceCategories = [];

  void addAssessmentArguments() {
    _locationAndApplianceCategories.add(_applianceCategories);
    _locationAndApplianceCategories.add(_locationCoordinates);
  }

  Private myPrivates = Private();

  setLocationDetails(locAddress, coordinates) {
    setState(() {
      _locationAddress = locAddress;
      _locationCoordinates = coordinates;
      _locationSet = true;
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle here.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Center(
          child: SizedBox(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_rounded, color: Colors.green[600], size: 40),
          Text('Residential Location',
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                'Help us to know the location of your residence by tapping the button below.',
                style: GoogleFonts.openSans(fontSize: 17),
                textAlign: TextAlign.center),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.blueGrey[900],
              width: 320,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // title and Details
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Residential address',
                              style: GoogleFonts.openSans(
                                  fontSize: 17, color: Colors.green[400]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 8.0, right: 8.0, bottom: 1),
                            child: Text(
                              _locationAddress,
                              style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          _locationSet == false
              ? GestureDetector(
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
                        Text('Get Location',
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () => {
                    _determinePosition().then((coordinates) => myPrivates
                        .getLocationdetails(
                            coordinates.latitude, coordinates.longitude)
                        .then((value) => setLocationDetails(
                            value.first.addressLine, value.first.coordinates))),
                  },
                )
              : GestureDetector(
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
                        Text('Continue..',
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () => {
                    addAssessmentArguments(),
                    Get.to(() => const AssessmentSteps(),
                        arguments: _locationAndApplianceCategories)
                  },
                ),
        ],
      ))),
    ));
  }
}
