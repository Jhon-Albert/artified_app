import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/page/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/welcome_bg.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    padding: const EdgeInsets.fromLTRB(30, 200, 30, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              text: "WE ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: "FRY",
                  style: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const TextSpan(
                  text: " TO ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "SATISFY",
                  style: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: const DefaultTextStyle(
            style: TextStyle(
              color: Colors.white, // replace with your desired color
              fontSize: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Le Katsu MNL is a restaurant in the Philippines that serves delicious and affordable Japanese food through dine-in and take-out orders as well as deliveries. We were established with the purpose of providing food for customers who seek convenience and class in their meals.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              //MaterialPageRoute(builder: (context) => const UserPage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 80),
            height: 50,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const DefaultTextStyle(
              style: TextStyle(
                color: Colors.white, // replace with your desired color
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
