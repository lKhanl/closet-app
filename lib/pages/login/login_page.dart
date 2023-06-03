import 'package:ClosetApp/components/button.dart';
import 'package:ClosetApp/components/text_field.dart';
import 'package:ClosetApp/components/title.dart';
import 'package:ClosetApp/layout/box.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Login', fontSize: 30),
            Box.h48,
            const CustomTextField(text: 'Email'),
            Box.h16,
            const CustomTextField(text: 'Password'),
            Box.h16,
            Button(
              text: 'Login',
              onPressed: () => null,
            ),
          ],
        ),
      ),
    );
  }
}
