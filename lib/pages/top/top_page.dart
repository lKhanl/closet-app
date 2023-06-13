import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/top/top_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TopPage extends BasePage {
  TopPage({Key? key}) : super(key: key);

  final _topStateManager = GetIt.instance.get<TopStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
