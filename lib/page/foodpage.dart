import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/my_button.dart';
import 'package:le_katsu_app_new/models/food.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/page/ar.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({
    super.key,
    required this.food,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  //view AR
  void viewAR() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ARFood(
          food: widget.food,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold
        Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(widget.food.image),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '\₱ ${widget.food.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        'Available Add-ons',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.redAccent,
                        ),
                      ),

                      // add ons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                '\₱${addon.price}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              value: widget.selectedAddons[addon],
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // AR button
                MyButton(
                  onTap: () => viewAR(),
                  text: "View in AR",
                ),
                const SizedBox(
                  height: 10,
                ),

                // button to add to cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: "Add to cart",
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),

        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
