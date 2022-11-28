import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/Payments/customer_data.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController _assessmentIDController = TextEditingController();
  bool isProjectIDValid = false;

  void checkProjectID(String id) {
    setState(() {
      isProjectIDValid == true;
    });
  }

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
                Text('Start Payment',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                Text(
                    'Enter The Project ID to start you payment. you can find it on your Quotation.',
                    style: GoogleFonts.openSans(fontSize: 17),
                    textAlign: TextAlign.center),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  controller: _assessmentIDController,
                  enableSuggestions: true,
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: 'Enter Project ID',
                    label: const Text('Project ID'),
                    labelStyle: GoogleFonts.openSans(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your project ID";
                    }
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CustomerData(),
                        arguments: _assessmentIDController.text);
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
