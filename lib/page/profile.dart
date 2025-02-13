import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/firebase_auth/firebase_auth_services.dart';
import 'package:le_katsu_app_new/page/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection('users');

  // logout
  void _logout() {
    final authService = FirebaseAuthServices();
    authService.signOut();
  }

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $field"),
        content: TextField(
          style: const TextStyle(color: Colors.black),
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Save', style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xFFBF0E0E),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 120),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 0, 22, 22.3),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        // Positioning the logo image inside the Stack
                                        Positioned(
                                          left: -10,
                                          top: -10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/lekatsuLOGO.png'),
                                              ),
                                            ),
                                            child: const SizedBox(
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        const Row(
                                          children: [
                                            Text(
                                              'Personal Profile',
                                              style: TextStyle(
                                                  fontSize: 35.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Username: ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey[500]),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  editField('Username'),
                                              icon: const Icon(Icons.settings),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2.0),
                                        Row(
                                          children: [
                                            Text(
                                              userData['Username'],
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Full Name: ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey[800]),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  editField('FullName'),
                                              icon: const Icon(Icons.settings),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2.0),
                                        Row(
                                          children: [
                                            Text(
                                              userData['FullName'],
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Address: ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey[800]),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  editField('Address'),
                                              icon: const Icon(Icons.settings),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2.0),
                                        Row(
                                          children: [
                                            Text(
                                              userData['Address'],
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Email: ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey[800]),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2.0),
                                        Row(
                                          children: [
                                            Text(
                                              userData['Email'],
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () {
                                            _logout();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage()),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 30),
                                            child: const Text(
                                              'Logout',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
