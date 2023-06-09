import 'package:MyCombinationsApp/components/button.dart';
import 'package:MyCombinationsApp/components/text_field.dart';
import 'package:MyCombinationsApp/components/title.dart';
import 'package:MyCombinationsApp/layout/box.dart';
import 'package:MyCombinationsApp/pages/login/login_page.dart';
import 'package:MyCombinationsApp/pages/register/register_state_manager.dart';
import 'package:MyCombinationsApp/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base_stateless_page.dart';

class RegisterPage extends BasePage {
  RegisterPage({super.key});

  final _registerStateManager = GetIt.instance.get<RegisterStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Register', fontSize: 30),
            Box.h24,
            CustomTextField(
                text: 'First Name',
                onChanged: (value) => _registerStateManager.setFirstName(value)),
            Box.h16,
            CustomTextField(
                text: 'Last Name',
                onChanged: (value) => _registerStateManager.setLastName(value)),
            Box.h16,
            CustomTextField(
                text: 'Email',
                onChanged: (value) => _registerStateManager.setUsername(value)),
            Box.h16,
            CustomTextField(
                text: 'Password',
                onChanged: (value) => _registerStateManager.setPassword(value)),
            Box.h16,
            Button(
              text: 'Register',
              onPressed: () => _registerStateManager.register(),
            ),
            Box.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => RouterUtils.goStateless(LoginPage()),
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
