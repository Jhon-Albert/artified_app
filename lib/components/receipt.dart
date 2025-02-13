import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/my_button.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/page/user.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 30),
      child: Container(
        width: 360,
        height: 500,
        decoration: BoxDecoration(
          color: const Color(0xFFBF0E0E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Thank you for your order!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(25),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.displayCartReceipt(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Your order is being processed..",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserPage())),
                text: "Done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
