import 'package:MyCombinationsApp/components/title.dart';
import 'package:flutter/material.dart';

import '../../style/theme_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.purpleLight,
      child: Center(
        child: CustomTitle(text: 'Home Page'),
      ),
    );
  }
}
