import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gns_app/Payments/success.dart';
import 'package:gns_app/env/privates.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PaymentManager {
  Private myKeys = Private();
  //late Map successPaymentData;

  Map<String, dynamic>? paymentIntentData;
  Map<String, dynamic> paymentData = {
    "fullname": 'Noel Phiri',
    "emailAddress": 'phirinoel@gmail.com',
    "amount": "200"
  };

  //creating a payment

  Future<void> makePayment(BuildContext context) async {
    try {
      paymentIntentData =
          await createPaymentIntent(paymentData['amount'], 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Green Energy Solutions'))
          .then((value) {
        print(paymentIntentData);
      });

      ///now finally display payment sheeet
      displayPaymentSheet(context);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(BuildContext buildContext) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(buildContext).showSnackBar(
          const SnackBar(
            content: Text('Payment Successfull..'),
          ),
        );
        Get.to(() => const PaymentSuccess(), arguments: paymentData);
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: buildContext,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      final secretKeys = myKeys.stripeSecretKey;
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKeys',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  displayPaymentScreen(String id) async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print('Payment Successfull'));
    } catch (e) {
      print(e);
    }
  }
}
