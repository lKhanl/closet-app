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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
