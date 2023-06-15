import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/profile/profile_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../utils/router_utils.dart';
import '../home/user_state_manager.dart';
import '../login/login_page.dart';

class ProfilePage extends BasePage {
  ProfilePage({Key? key}) : super(key: key);

  final _userStateManager = GetIt.instance.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          actions: [
            IconButton(
              onPressed: () async {
                await _userStateManager.clear();
                RouterUtils.goStateless(LoginPage());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        ));
  }
}
