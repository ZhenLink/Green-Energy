import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../env/privates.dart';

class ClientLocation extends StatefulWidget {
  const ClientLocation({Key? key}) : super(key: key);

  @override
  State<ClientLocation> createState() => _ClientLocationState();
}

class _ClientLocationState extends State<ClientLocation> {
  Position? position;
  Private myPrivates = Private();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      //permission = await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Center(
          child: SizedBox(
              height: 400,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_rounded,
                      color: Colors.green[600], size: 40),
                  Text('Residential Location',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  Text(
                      'Help us to know the location of your residence by tapping the button below.',
                      style: GoogleFonts.openSans(fontSize: 17),
                      textAlign: TextAlign.center),
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
                          Text('Get Location',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                    onTap: () => {
                      _determinePosition().then((value) => myPrivates
                          .getLocationdetails(40.7128, 74.0060)
                          .then((value) => print(value))),
                    },
                  ),
                ],
              ))),
    ));
  }
}
