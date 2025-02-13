import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:le_katsu_app/firebase_auth/firebase_auth_services.dart';
import 'package:le_katsu_app_new/global/common/toast.dart';
import 'package:le_katsu_app_new/page/login.dart';
import 'package:le_katsu_app_new/page/termsCondition.dart';
import 'package:le_katsu_app_new/page/user.dart';
import 'package:random_string/random_string.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isSignin = false;
  bool isChecked = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _usernameController.text.isEmpty) {
      showToast(message: "Please fill out all fields.");
      return;
    }

    if (!isChecked) {
      showToast(message: "Please agree to the Terms and Conditions.");
      return;
    }

    setState(() {
      _isSignin = true;
    });

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (credential.user != null) {
        String Id = randomNumeric(10);
        FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.email)
            .set({
          'UserId': Id,
          'Username': _usernameController.text,
          'FullName': 'Empty Full Name..',
          'Email': _emailController.text,
          'Address': 'Empty Address..',
        });

        showToast(message: "User is successfully created");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ));
      } else {
        showToast(
            message: "Please ensure all fields are filled out correctly.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }

    setState(() {
      _isSignin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/signup_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 30, right: 30),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey[500],
                        ),
                        label: const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.mail,
                          color: Colors.grey[500],
                        ),
                        label: const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey[500],
                        ),
                        label: const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  // Terms and Conditions
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool!;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Yes, I agree to the ",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms and Conditions.",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red[600],
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TermsAndConditionsPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      _signUp();
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: Center(
                        child: _isSignin
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(fontSize: 15),
                          children: [
                            TextSpan(
                              text: " Login",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.red[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
