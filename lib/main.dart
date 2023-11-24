//import 'dart:io';

import 'package:belkis_marketplace/constants/firebase_options/firebase_options.dart';
import 'package:belkis_marketplace/constants/theme.dart';
import 'package:belkis_marketplace/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:belkis_marketplace/provider/app_provider.dart';
import 'package:belkis_marketplace/screens/auth_ui/login/welcome.dart';

import 'package:belkis_marketplace/widgets/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51OFnrbL5s11I9QDMOFtPyDVhgwlglgvExwrsPoeZwvmFJa3hv6kdqMY06muBIWP3OgnqOGeQpMwmzOocYcWECL8k00hpdzUzvM';
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Belkis ',
        theme: themeData,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottomBar();
              } else {
                return const Welcome();
              }
            }),
      ),
    );
  }
}
