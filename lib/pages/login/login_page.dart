import 'package:ClosetApp/components/button.dart';
import 'package:ClosetApp/components/text_field.dart';
import 'package:ClosetApp/components/title.dart';
import 'package:ClosetApp/layout/box.dart';
import 'package:ClosetApp/pages/base_stateless_page.dart';
import 'package:ClosetApp/pages/login/login_state_manager.dart';
import 'package:ClosetApp/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../register/register_page.dart';

class LoginPage extends BaseStatelessPage {
  LoginPage({Key? key}) : super(key: key);

  final _loginStateManager = GetIt.instance.get<LoginStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Login', fontSize: 30),
            Box.h24,
            CustomTextField(
                text: 'Email',
                onChanged: (value) => _loginStateManager.setEmail(value)),
            Box.h16,
            CustomTextField(
                text: 'Password',
                onChanged: (value) => _loginStateManager.setPassword(value)),
            Box.h16,
            Button(
              text: 'Login',
              onPressed: () => _loginStateManager.login(),
            ),
            Box.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () => RouterUtils.goStateless(RegisterPage()),
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
