import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gns_app/env/privates.dart';
import 'package:http/http.dart' as http;

class PaymentManager {
  late String userID;
  late double paymentAmount;
  late String assessmentID;
  Private myKeys = Private();

  Map<String, dynamic>? paymentIntentData;

  displayPaymentScreen(String id) async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print('Payment Successfull'));
    } catch (e) {
      print(e);
    }
  }

  //creating a payment intent session

  Future<void> makePayment(
      BuildContext context, double amount, VoidCallback success) async {
    try {
      paymentAmount = amount;
      paymentIntentData = await createPaymentIntent(paymentAmount, "USD");

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'Green Energy solutions',
          ))
          .then((value) => null)
          .catchError((e) {
        print(e);
      });

      displayPaymentScreen("12343");
    } catch (e) {
      return;
    }
  }

  createPaymentIntent(double amount, String currency) async {
    final secretKeys = myKeys.stripeSecretKey;

    try {
      Map<String, dynamic> paymentBody = {
        "amount": amount,
        "currency": "USD",
        "payment-Method": "Card"
      };

      if (paymentBody.isNotEmpty) {
        var response = await http.post(
            Uri.parse('http://api.stripe.com/v1/payment_intents'),
            body: jsonEncode(paymentBody),
            headers: {
              "authorization": 'Bearer $secretKeys',
              "content-Type": 'Application/x-www-form-ulrencoded'
            });

        return jsonDecode(response.body);
      }
    } catch (e) {
      print("There was an Error: ${e.toString()}");
    }
  }
}
