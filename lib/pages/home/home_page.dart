import 'package:MyCombinationsApp/components/card.dart';
import 'package:MyCombinationsApp/pages/home/user_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../layout/box.dart';
import '../../utils/router_utils.dart';
import '../top/top_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _userStateManager = GetIt.instance.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(children: [
          Center(
              child: FutureBuilder(
                  future: _userStateManager.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var user = snapshot.data!;
                      return Center(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: Text("${user.firstName} ${user.lastName}")),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  })),
        ]),
        Box.h48,
        Row(
          children: [
            Box.w16,
            CustomCard(
              text: 'My Tops',
              onTap: () => RouterUtils.goStateless(TopPage()),
            ),
            Box.w8,
            CustomCard(text: 'My Bottoms'),
            Box.w16,
          ],
        ),
        Box.h8,
        Row(
          children: [
            Box.w16,
            CustomCard(text: 'My Shoes'),
            Box.w8,
            CustomCard(text: 'Combinations'),
            Box.w16,
          ],
        ),
      ]),
    );
  }
}
