import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Energy%20Monitor/EMonitor.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceCheck extends StatefulWidget {
  const DeviceCheck({Key? key}) : super(key: key);

  @override
  State<DeviceCheck> createState() => _DeviceCheckState();
}

class _DeviceCheckState extends State<DeviceCheck> {
  final TextEditingController _deviceIDController = TextEditingController();
  bool isDeviceIDValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Device ID',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                Text('Enter The Device ID given to access this feature.',
                    style: GoogleFonts.openSans(fontSize: 17),
                    textAlign: TextAlign.center),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  controller: _deviceIDController,
                  enableSuggestions: true,
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: 'Enter Device ID',
                    label: const Text('Device ID'),
                    labelStyle: GoogleFonts.openSans(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Device ID";
                    }
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Emonitor());
                  },
                  child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Check',
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
