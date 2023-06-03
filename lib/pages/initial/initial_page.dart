import 'package:ClosetApp/components/title.dart';
import 'package:ClosetApp/layout/box.dart';
import 'package:ClosetApp/pages/register/register_page.dart';
import 'package:ClosetApp/utils/router.dart';
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
          const CustomTitle(text: 'Closet App'),
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
