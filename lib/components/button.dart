import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;

  const Button(
      {super.key,
      required this.text,
      this.onPressed,
      this.color = Colors.white,
      this.fontSize = 15,
      this.fontWeight = FontWeight.bold,
      this.width = 150,
      this.height = 50,
      this.borderRadius = 50,
      this.backgroundColor = Colors.deepPurple});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 50),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
      child: Text(text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
