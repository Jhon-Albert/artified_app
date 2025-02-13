import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:le_katsu_app_new/models/cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //Katsu_bowls
    Food(
      name: "Katsu Dog",
      description: "LeKatsu - Katsu Dog",
      price: 99.00,
      image: "assets/Katsudog.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/KatsuDog.glb",
      foodCalorie: "495",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Chicken Teriyaki Balls",
      description: "LeKatsu - Chicken Teriyaki Balls",
      price: 119.0,
      image: "assets/TeriyakiBallsKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/ChickenTeriyakiBalls.glb",
      foodCalorie: "525",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Katsu Curry",
      description: "LeKatsu - Katsu Curry",
      price: 149.00,
      image: "assets/CurryKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/KatsuCurry.glb",
      foodCalorie: "715",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Doriyaki",
      description: "LeKatsu - Doriyaki",
      price: 149.00,
      image: "assets/Doriyaki.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/doriyaki2.glb",
      foodCalorie: "870~1007",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Shrimp Katsu",
      description: "LeKatsu - Shrimp Katsu",
      price: 199.00,
      image: "assets/ShrimpKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/shrimpKatsu.glb",
      foodCalorie: "575~797",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Tuna Katsu",
      description: "LeKatsu - Tuna Katsu",
      price: 159.00,
      image: "assets/TunaBallsKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/TunaKatsuBowl.glb",
      foodCalorie: "815~1007",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Tori Menchi",
      description: "LeKatsu - Tori Menchi",
      price: 149.00,
      image: "assets/ToriMenchiKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/MenchiKatsu.glb",
      foodCalorie: "675~857",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Pork Katsu",
      description: "LeKatsu - Pork Katsu",
      price: 159.00,
      image: "assets/PorkKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/PorkKatsu.glb",
      foodCalorie: "675~897",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Chicken Katsu",
      description: "LeKatsu - Chicken Katsu",
      price: 139.00,
      image: "assets/ChickenKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Bowls,
      foodAR: "assets/arfood/ChickenKatsu.glb",
      foodCalorie: "675",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),

    //Ramen
    Food(
      name: "Tonkotsu Ramen",
      description: "LeKatsu - Tonkotsu Ramen",
      price: 129.00,
      image: "assets/ramen/TonkotsuRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/Tonkotsu.glb",
      foodCalorie: "725~1155",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Miso Ramen",
      description: "LeKatsu - Miso Ramen",
      price: 139.00,
      image: "assets/ramen/MisoRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/MisoRamen.glb",
      foodCalorie: "775~1105",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Shoyu Ramen",
      description: "LeKatsu - Shoyu Ramen",
      price: 139.00,
      image: "assets/ramen/ShoyuRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/ShoyuRamen.glb",
      foodCalorie: "725~1056",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Black Garlic Ramen",
      description: "LeKatsu - Black Garlic\nRamen",
      price: 149.00,
      image: "assets/ramen/BlackGarlicRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/blackGarlicRamen.glb",
      foodCalorie: "725~1095",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Tantanmen Ramen",
      description: "LeKatsu - Tantanmen Ramen",
      price: 189.00,
      image: "assets/ramen/TantanmenRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/TantanmenRamen.glb",
      foodCalorie: "740~1145",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Chicken Butter Ramen",
      description: "LeKatsu - Chicken Butter\nRamen",
      price: 139.00,
      image: "assets/ramen/ChickenButterRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/ChickenButterRamen.glb",
      foodCalorie: "725~1095",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Cheesy Pork Ramen",
      description: "LeKatsu - Cheesy Pork\nRamen",
      price: 159.00,
      image: "assets/ramen/CheesyPork.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/CheesyPorkRamen1.glb",
      foodCalorie: "780~1222",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Bomba Ramen",
      description: "LeKatsu - Bomba Ramen",
      price: 139.00,
      image: "assets/ramen/BombaRamen.jpg",
      rating: 5.0,
      category: FoodCategory.Ramen,
      foodAR: "assets/arfood/BombaRamen.glb",
      foodCalorie: "675~1010",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),

    //Burger
    Food(
      name: "Tori Katsu Burger",
      description: "LeKatsu - Tori Katsu\nWasabi Mayo",
      price: 99.00,
      image: "assets/burger/ToriKatsuBurgers.jpg",
      rating: 5.0,
      category: FoodCategory.Burger,
      foodAR: "assets/arfood/ToriKatsuBurgerWasabiMayo.glb",
      foodCalorie: "550~800",
      availableAddons: [],
    ),
    Food(
      name: "Tori Katsu Burger",
      description: "LeKatsu - Tori Katsu\nJapanese Mayo",
      price: 99.00,
      image: "assets/burger/ToriKatsu_japanesemayo.jpg",
      rating: 5.0,
      category: FoodCategory.Burger,
      foodAR: "assets/arfood/ToriKatsuBurgerJapMayo.glb",
      foodCalorie: "550~800",
      availableAddons: [],
    ),
    Food(
      name: "Tori Katsu Burger",
      description: "LeKatsu - Tori Katsu\nSpicy Mayo",
      price: 99.00,
      image: "assets/burger/ToriKatsu_hotspicy.jpg",
      rating: 5.0,
      category: FoodCategory.Burger,
      foodAR: "assets/arfood/ToriKatsuBurgerCheese.glb",
      foodCalorie: "550~800",
      availableAddons: [],
    ),
    Food(
      name: "Kani Bunwhich",
      description: "LeKatsu - Kani Bunwhich",
      price: 89.00,
      image: "assets/burger/KaniBunwich.jpg",
      rating: 5.0,
      category: FoodCategory.Burger,
      foodAR: "assets/arfood/CrabStripBurger.glb",
      foodCalorie: "400~600",
      availableAddons: [],
    ),

    //Party Boxes
    Food(
      name: "Chicken Katsu",
      description: "LeKatsu - Party Box\nChicken Katsu",
      price: 450.00,
      image: "assets/partyboxes/pb_ChickenKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/PartyBoxChickenKatsu.glb",
      foodCalorie: "1360",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Dori Katsu",
      description: "LeKatsu - Party Box\nDori Katsu",
      price: 480.00,
      image: "assets/partyboxes/pb_Doriyaki.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/PartyBoxDoriKatsu.glb",
      foodCalorie: "1410~2060",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Tuna Katsu Balls",
      description: "LeKatsu - Party Box\nTuna Katsu Balls",
      price: 510.00,
      image: "assets/partyboxes/pb_TunaKatsuBalls.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/PartyBoxTunaKatsuBall.glb",
      foodCalorie: "1110~1460",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Pork Katsu",
      description: "LeKatsu - Party Box\nPork Katsu",
      price: 530.00,
      image: "assets/partyboxes/pb_ChickenKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/PartyBoxPorkKatsu.glb",
      foodCalorie: "1360",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Shrimp Katsu",
      description: "LeKatsu - Party Box\nShrimp Katsu",
      price: 670.00,
      image: "assets/partyboxes/pb_Shrimp.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/PartyBoxTempura.glb",
      foodCalorie: "1110~1610",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),
    Food(
      name: "Mixed Katsu",
      description:
          "LeKatsu - Party Box\nMixed Tuna Katsu Ball\n& Chicken Katsu",
      price: 999.00,
      image: "assets/partyboxes/pb_Mixed.jpg",
      rating: 5.0,
      category: FoodCategory.Party,
      foodAR: "assets/arfood/MixedBallKatsu.glb",
      foodCalorie: "1055~1440",
      availableAddons: [
        Addon(name: "Extra Rice", price: 30.0),
        Addon(name: "Extra Sauce", price: 15.0)
      ],
    ),

    //Side Dish
    Food(
      name: "Chicken Katsu\nSalad",
      description: "LeKatsu - Chicken Katsu Salad",
      price: 129.00,
      image: "assets/side/ChikenKatsuSalad.jpg",
      rating: 5.0,
      category: FoodCategory.Sides,
      foodAR: "assets/arfood/saladSIDE.glb",
      foodCalorie: "423~602",
      availableAddons: [],
    ),
    Food(
      name: "Japfries",
      description: "LeKatsu - Japfries",
      price: 75.00,
      image: "assets/side/JapFries.jpg",
      rating: 5.0,
      category: FoodCategory.Sides,
      foodAR: "assets/arfood/Fries.glb",
      foodCalorie: "355~410",
      availableAddons: [],
    ),
    Food(
      name: "Katsu Maki",
      description: "LeKatsu - Katsu Maki",
      price: 149.00,
      image: "assets/side/MakiKatsu.jpg",
      rating: 5.0,
      category: FoodCategory.Sides,
      foodAR: "assets/arfood/MakiSIDE.glb",
      foodCalorie: "560~855",
      availableAddons: [
        Addon(name: "Wasabi Mayo", price: 00.0),
        Addon(name: "Spicy Mayo", price: 00.0),
        Addon(name: "Japanese Mayo", price: 00.0),
      ],
    ),
    Food(
      name: "Fish Tofu",
      description: "LeKatsu - Fish Tofu",
      price: 85.00,
      image: "assets/side/tofu.jpg",
      rating: 5.0,
      category: FoodCategory.Sides,
      foodAR: "assets/arfood/tofuSIDE.glb",
      foodCalorie: "230~310",
      availableAddons: [],
    ),
    Food(
      name: "Fried Crabsticks",
      description: "LeKatsu - Fried Crabsticks",
      price: 85.00,
      image: "assets/side/Crabstick.jpg",
      rating: 5.0,
      category: FoodCategory.Sides,
      foodAR: "assets/arfood/CrabStickSIDE.glb",
      foodCalorie: "340~460",
      availableAddons: [],
    ),
  ];

  //Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //Operations
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  // remove cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }

    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemAccount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //Helpers
  String displayCartReceipt() {
    final receipt = StringBuffer();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Add the user's name or email to the receipt
      receipt
          .writeln("Customer: ${currentUser.displayName ?? currentUser.email}");
    } else {
      receipt.writeln("Customer: Guest");
    }
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("Order Summary:");
    receipt.writeln("----------");

    for (final carItem in _cart) {
      receipt.writeln(
          "${carItem.quantity} x ${carItem.food.name} - ${_formatPrice(carItem.food.price)}");
      if (carItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(carItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemAccount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return " \₱ ${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
