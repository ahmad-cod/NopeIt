// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(height: 10),
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter A New Not Todo'
              ),
            ),

            //  buttons to save or cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}