// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      const SizedBox(
        height: kToolbarHeight,
      ),
      if (title == 'Login' || title == 'Create Account')
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
      SizedBox(
        height: 12.0,
      ),
      Text(
        title,
        style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      const SizedBox(
        height: 12,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ]);
  }
}
