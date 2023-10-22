import 'package:belkis_marketplace/constants/firebase_options/firebase_options.dart';
import 'package:belkis_marketplace/constants/theme.dart';
import 'package:belkis_marketplace/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:belkis_marketplace/screens/auth_ui/login/welcome.dart';
import 'package:belkis_marketplace/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belkis Marketplace',
      theme: themeData,
      home: Welcome(),
      // home: StreamBuilder(
      //     stream: FirebaseAuthHelper.instance.getAuthChange,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return const Home();
      //       } else {
      //         return Welcome();
      //       }
      //     }),
    );
  }
}
