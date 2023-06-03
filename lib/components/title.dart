import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTitle({super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          decoration: TextDecoration.none,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: FontStyle.italic),
    );
  }
}
