import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/page/welcome.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCzImm5PD3TlPytdds1hRzmCN1wbIlSGOs",
            appId: "1:284088427365:web:a17faceadf38086cffb78c",
            messagingSenderId: "284088427365",
            projectId: "artified-firebase"));
  }

  await Firebase.initializeApp();
  //runApp(const MyApp());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Restaurant()),
        //ChangeNotifierProvider(create: (context) => StorageService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeKatsu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
