import 'package:MyCombinationsApp/components/title.dart';
import 'package:MyCombinationsApp/layout/box.dart';
import 'package:MyCombinationsApp/pages/register/register_page.dart';
import 'package:MyCombinationsApp/utils/router_utils.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../style/theme_colors.dart';
import '../login/login_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.purpleLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const CustomTitle(text: 'My Combinations'),
          ),
          Box.h48,
          Button(
              text: 'Login',
              onPressed: () => RouterUtils.goStateless(LoginPage())),
          Box.h16,
          Button(
              text: 'Register',
              onPressed: () => RouterUtils.goStateless(RegisterPage())),
        ],
      ),
    );
  }
}
