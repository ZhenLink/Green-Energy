import 'package:flutter/material.dart';
import 'package:gns_app/Payments/payment_manager.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              PaymentManager().makePayment(context, 2000, () {
                if (!mounted) return;
                Navigator.of(context).pop();
              });
            },
            child: const Text('Make payment')),
      ),
    );
  }
}
