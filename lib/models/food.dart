class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final double rating;
  final FoodCategory category;
  final String foodAR;
  final String foodCalorie;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.category,
    required this.foodAR,
    required this.availableAddons,
    required this.foodCalorie,
  });
}

enum FoodCategory {
  Bowls,
  Ramen,
  Burger,
  Party,
  Sides,
}

class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
