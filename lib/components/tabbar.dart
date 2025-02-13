import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        indicatorColor: Colors.redAccent,
        labelColor: Colors.redAccent,
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
