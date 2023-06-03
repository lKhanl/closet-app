import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String)? onChanged;

  const CustomTextField({super.key, required this.text, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        onChanged: onChanged,
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
