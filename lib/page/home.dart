import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';
  Future<void> _fetchUserData() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        // Fetch user data from Firestore based on email or UID
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid) // Using email as the document ID
            .get();

        if (userDoc.exists) {
          setState(() {
            // Assuming 'Username' is a field in your Firestore document
            _username = userDoc['Username'] ?? 'No Username';
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF000000),
          ),
          child: Column(
            children: [
              _buildHeader(width),
              _buildTopSellersSection(width),
              _buildMenuItemsSection(width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFBF0E0E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(32, 69, 31, 14),
      width: width <= 600 ? width * 0.9 : width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  letterSpacing: 0.1,
                  color: Color(0xFFB7B7B7),
                ),
              ),
              Text(
                _username,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              'assets/lekatsuLOGO.png',
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSellersSection(double width) {
    return Container(
      width: width <= 600 ? width * 0.9 : width * 0.7,
      margin: const EdgeInsets.symmetric(vertical: 17),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/home_bg.jpg'),
              ),
            ),
            height: 165,
          ),
          Positioned(
            left: 10,
            bottom: 70,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C1C),
              ),
              width: 350,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 13, 23, 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFED5151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: const Text(
                    'Top Sellers',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Buy one get one FREE',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemsSection(double width) {
    return Column(
      children: [
        _buildMenuItem(width, 'Chicken Katsu', '₱ 139.00', 'with Drinks',
            'assets/ChickenKatsu.jpg', '4.8'),
        _buildMenuItem(width, 'Pork Katsu', '₱ 159.00', 'with Drinks',
            'assets/PorkKatsu.jpg', '4.9'),
        _buildMenuItem(width, 'Katsu Dog', '₱ 99.00', 'with Drinks',
            'assets/Katsudog.jpg', '4.8'),
        _buildMenuItem(width, 'Tuna Balls Katsu', '₱ 159.00', 'with Drinks',
            'assets/TunaBallsKatsu.jpg', '4.9'),
        _buildMenuItem(width, 'Tori Katsu Burger', '₱ 99.00', 'with Drinks',
            'assets/burger/ToriKatsuBurgers.jpg', '4.8'),
        _buildMenuItem(width, 'Tonkotsu Ramen', '₱ 129.00', 'with Drinks',
            'assets/ramen/TonkotsuRamen.jpg', '4.9'),
      ],
    );
  }

  Widget _buildMenuItem(double width, String title, String price,
      String subtitle, String imagePath, String rating) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.1, 4.1, 18.4, 12.3),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 128,
                height: 145,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF2F2D2C),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF2F4B4E),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 10),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xFF2F2D2C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
