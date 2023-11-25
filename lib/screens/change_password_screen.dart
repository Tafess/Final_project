import 'package:belkis_marketplace/constants/constants.dart';
import 'package:belkis_marketplace/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:belkis_marketplace/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController conformPassword = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Change Password'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        children: [
          TextFormField(
            controller: newPassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'New password',
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                child: const Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: conformPassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Conform password',
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                child: const Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
              onPressed: () {
                if (newPassword.text.isEmpty) {
                  showMessage('Please enter a new password');
                } else if (conformPassword.text.isEmpty) {
                  showMessage('Please enter confirmation password');
                } else {
                  if (conformPassword.text == newPassword.text) {
                    FirebaseAuthHelper.instance
                        .changePassword(newPassword.text, context);
                  } else {
                    showMessage('Conforim password is not match');
                  }
                }
              },
              title: 'Update Password'),
        ],
      ),
    );
  }
}
