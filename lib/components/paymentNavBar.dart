import 'package:flutter/material.dart';

class PaymentNavBar extends StatelessWidget {
  const PaymentNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(25),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 133),
            child: Text(
              'Payment',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
