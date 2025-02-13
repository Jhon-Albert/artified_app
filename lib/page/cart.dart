import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/cart_tile.dart';
import 'package:le_katsu_app_new/components/my_button.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/page/payment.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: const Text(
                      "        My Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFBF0E0E),
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            "Are you sure you want to clear the cart?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text(
                                "Cart is empty",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return CartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              MyButton(
                onTap: userCart.isNotEmpty
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        )
                    : null,
                text: "Checkout",
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
