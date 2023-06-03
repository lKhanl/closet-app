import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;

  const CustomTextField(
      {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: text,
        ),
      ),
    );
  }
}
