// ignore_for_file: use_build_context_synchronously

import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/constants/routes.dart';
import 'package:belkis_marketplace/models/user_model.dart';
import 'package:belkis_marketplace/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      ShowLoderDialog(context);

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Routes.instance
          .pushAndRemoveUntil(widget: const Home(), context: context);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      ShowLoderDialog(context);

      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          id: userCredential.user!.uid, name: name, email: email, image: null);
      Routes.instance
          .pushAndRemoveUntil(widget: const Home(), context: context);

      _firestore.collection('users').doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      ShowLoderDialog(context);

      _auth.currentUser!.updatePassword(password);

      // UserCredential? userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: Password);

      // UserModel userModel = UserModel(
      //     id: userCredential.user!.uid, name: name, email: email, image: null);
      // Routes.instance
      //     .pushAndRemoveUntil(widget: const Home(), context: context);

      // _firestore.collection('users').doc(userModel.id).set(userModel.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      showMessage('Password changed');
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
  }
}
