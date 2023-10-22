import 'dart:js';

import 'package:belkis_marketplace/constants/routes.dart';
import 'package:belkis_marketplace/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String Password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
      return true;
    } catch (e) {
      print(e); 
      return false;
    }
  }
}
