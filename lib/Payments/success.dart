import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gns_app/dashboard/Home.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  Map successPaymentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green[600], size: 40),
              Text('Payment Completed',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Your payment has been completed successfully.',
                    style: GoogleFonts.openSans(fontSize: 17),
                    textAlign: TextAlign.center),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Customer Name: ',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  Text(successPaymentData['fullname'],
                      style: GoogleFonts.openSans(fontSize: 20),
                      textAlign: TextAlign.left),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Text('Email address: ',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  Text(successPaymentData['emailAddress'],
                      style: GoogleFonts.openSans(fontSize: 20),
                      textAlign: TextAlign.left),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Text('Payment Amount: ',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  Text(successPaymentData['amount'] + "USD",
                      style: GoogleFonts.openSans(fontSize: 20),
                      textAlign: TextAlign.left),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8))
                ],
              ),
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
                      Text('Finish',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                onTap: () => {Get.to(() => const Home())},
              ),
            ],
          ),
        ),
      ),
    );
  }
}