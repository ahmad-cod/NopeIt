// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white70,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.red,
          // fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
