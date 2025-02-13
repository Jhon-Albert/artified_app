import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/foodtile.dart';
import 'package:le_katsu_app_new/components/tabbar.dart';
import 'package:le_katsu_app_new/models/food.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/page/foodpage.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MenuPage>
    with /*SingleTickerProviderStateMixin*/ TickerProviderStateMixin {
  late TabController _tabController;
  List<FoodCategory> _availableCategories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final restaurant = Provider.of<Restaurant>(context);
    _availableCategories = FoodCategory.values.where((category) {
      return restaurant.menu.any((food) => food.category == category);
    }).toList();

    _tabController =
        TabController(length: _availableCategories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort list of food items in each category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return _availableCategories.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Le Katsu Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFBF0E0E),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF000000),
          gradient: LinearGradient(colors: [
            Color(0xFFBF0E0E),
            Colors.black,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            MyTabBar(
              tabController: _tabController,
            ),
            Expanded(
                child: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
