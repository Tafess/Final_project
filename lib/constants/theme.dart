import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade100,
  primaryColor: Colors.blue,
  primarySwatch: Colors.green,
  canvasColor: Colors.red,

  ////////////////////////////////////////////////
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: Colors.blue,
    suffixIconColor: Colors.green,
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue,
      backgroundColor: Colors.white,
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      side: const BorderSide(color: Colors.blue, width: 3),
      disabledForegroundColor: Colors.blue.shade100,
      disabledBackgroundColor: Colors.grey, // Add this line
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.shade700,
      disabledBackgroundColor: Colors.grey, // Add this line
      textStyle: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
    //style: BorderStyle.solid,
    width: 1,
  ),
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
);
