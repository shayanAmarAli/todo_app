import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const MyButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.amberAccent,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
