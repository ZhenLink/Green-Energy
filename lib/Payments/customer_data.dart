import 'package:flutter/material.dart';
import 'package:gns_app/Payments/success.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gns_app/Payments/payment_manager.dart';
import 'package:get/get.dart';

class CustomerData extends StatefulWidget {
  const CustomerData({Key? key}) : super(key: key);

  @override
  State<CustomerData> createState() => _CustomerDataState();
}

class _CustomerDataState extends State<CustomerData> {
  final String project_ID = Get.arguments;
  late Map<String, dynamic> paymentData;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAdressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
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
                Icon(Icons.payment_rounded, color: Colors.green[600], size: 40),
                Text('Complete Payment',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                Text('Enter Billing Details below to complete the payment.',
                    style: GoogleFonts.openSans(fontSize: 17),
                    textAlign: TextAlign.center),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  controller: _fullNameController,
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    label: const Text('Full Name'),
                    labelStyle: GoogleFonts.openSans(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your fullname";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  controller: _emailAdressController,
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    label: const Text('Email Address'),
                    labelStyle: GoogleFonts.openSans(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email address";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: _amountController,
                  style: GoogleFonts.openSans(fontSize: 19),
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    label: const Text('Enter Amount'),
                    labelStyle: GoogleFonts.openSans(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the amount you want to pay";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                GestureDetector(
                  onTap: () async {
                    paymentData = {
                      "Project_Number": project_ID,
                      "Currency": "USD",
                      "Customer_Name": _fullNameController.text,
                      "Customer_Email": _emailAdressController.text,
                      "Amount": _amountController.text,
                    };
                    PaymentManager().makePayment(context, paymentData);
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Complete Payment',
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
