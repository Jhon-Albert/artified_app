import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/gcash_receipt.dart';

class GcashPayment extends StatefulWidget {
  const GcashPayment({super.key});

  @override
  State<GcashPayment> createState() => _GcashPaymentState();
}

class _GcashPaymentState extends State<GcashPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Gcash Payment",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: const Column(
        children: [
          MyGcashReceipt(),
        ],
      ),
    );
  }
}
