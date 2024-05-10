// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shukri_application_1/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,
   required this.controller,
   required this.onSave,
   required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height:120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller:controller,
            decoration:InputDecoration(
              border:OutlineInputBorder(),
              hintText:"Add new task",
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            MyButton(text: "save", onPressed: (){onSave;}),

            const SizedBox(width:10),

            MyButton(text: "cancel", onPressed: (){onCancel;}),
          ],)
        ],)),
    );
  }
}