import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:le_katsu_app_new/page/cart.dart';
import 'package:le_katsu_app_new/page/home.dart';
import 'package:le_katsu_app_new/page/menu.dart';
import 'package:le_katsu_app_new/page/profile.dart';
import 'package:le_katsu_app_new/page/transacHistory.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserPage> {
  int myIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Add a listener to the page controller
    pageController.addListener(() {
      setState(() {
        myIndex = pageController.page!
            .round(); // Update the index based on the current page
      });
    });
  }

  void onTapped(int index) {
    setState(() {
      myIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController
        .dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Try Bar')),
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          TransacHistoryPage(),
          MenuPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: const Color(0xFFBF0E0E),
        backgroundColor: Colors.black,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.restaurant_menu_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: onTapped,
        index: myIndex, // Set the current index for the navigation bar
      ),
    );
  }
}
