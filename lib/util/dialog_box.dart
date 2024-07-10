import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFFFF8E1),
      elevation: 100,
      content:  TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Add a new task",
        ),
      ),
      actions: [
        MaterialButton(onPressed: onCancel, child: Text("Cancel"),color: Color(0xFFA5D6A7),),
        MaterialButton(onPressed: onSave, child: Text("Save"),color: Color(0xFFA5D6A7),),

      ],
    );
  }
}
