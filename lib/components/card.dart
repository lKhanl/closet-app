import 'package:MyCombinationsApp/style/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final GestureTapCallback? onTap;

  const CustomCard({
    super.key,
    required this.text,
    this.color = ThemeColors.purpleDark,
    this.height = 250,
    this.fontSize = 25,
    this.fontWeight = FontWeight.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          height: height,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
