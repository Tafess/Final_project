import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/constants/routes.dart';
import 'package:belkis_marketplace/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String Password, BuildContext context) async {
    try {
      ShowLoderDialog(context);

      await _auth.signInWithEmailAndPassword(email: email, password: Password);
      Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> siggnUp(
      String email, String Password, BuildContext context) async {
    try {
      ShowLoderDialog(context);

      await _auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
  }
}
