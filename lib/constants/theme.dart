import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue.shade700,
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: Colors.blue,
    suffixIconColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.shade400,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.black,
    style: BorderStyle.solid,
    width: 1,
  ),
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
);
