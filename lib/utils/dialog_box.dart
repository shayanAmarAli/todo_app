import 'package:flutter/material.dart';
import 'package:todo_app/widget/my_button.dart';

class DialogBoxWidget extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBoxWidget({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent,
      title: Text('Add a new task'),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your task here',
                border: OutlineInputBorder(),
              ),
            ),

            // Buttons section (Save + Cancel )
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
