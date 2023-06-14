import 'package:MyCombinationsApp/components/text_field.dart';
import 'package:MyCombinationsApp/layout/box.dart';
import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/bottom/bottom_state_manager.dart';
import 'package:MyCombinationsApp/pages/combine/combine_state_manager.dart';
import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:MyCombinationsApp/pages/shoes/shoes_state_manager.dart';
import 'package:MyCombinationsApp/pages/top/top_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../components/button.dart';
import '../../../style/theme_colors.dart';
import '../../../utils/router_utils.dart';
import '../../home/user_state_manager.dart';
import '../../login/login_page.dart';

class AddCombinePage extends BasePage {
  AddCombinePage({Key? key}) : super(key: key);

  final _combineStateManager = GetIt.instance.get<CombineStateManager>();
  final _topStateManager = GetIt.instance.get<TopStateManager>();
  final _bottomStateManager = GetIt.instance.get<BottomStateManager>();
  final _shoesStateManager = GetIt.instance.get<ShoesStateManager>();
  final _userStateManager = GetIt.instance.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Combination'),
        actions: [
          IconButton(
            onPressed: () async {
              Get.offAll(() => HomePage());
            },
            icon: Icon(Icons.home),
          ),
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
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Center(
          child: Column(
            children: [
              Button(onPressed: () => _addTop(context), text: 'Add Top'),
              Box.h8,
              Button(onPressed: () => _addBottom(context), text: 'Add Bottom'),
              Box.h8,
              Button(onPressed: () => _addShoes(context), text: 'Add Shoes'),
              Box.h8,
              CustomTextField(
                  text: 'Name',
                  onChanged: (value) => _combineStateManager.setName(value)),
              Box.h16,
              Divider(thickness: 2),
              Box.h16,
              Button(
                  onPressed: () async {
                    await _combineStateManager.create();
                    Get.offAll(() => HomePage());
                  },
                  text: 'Save'),
            ],
          ),
        ),
      ),
    );
  }

  void _addTop(BuildContext context) {
    Get.defaultDialog(
      title: "My Tops",
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close", style: TextStyle(color: Colors.red))),
      content: SizedBox(
        height: MediaQuery.of(context).size.height < 500 ? 300 : 500,
        width: MediaQuery.of(context).size.width * 0.9,
        child: FutureBuilder(
          future: _topStateManager.getTops(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Card(
                      color: ThemeColors.purpleLight,
                      child: ListTile(
                        title: Text(items[index].name),
                      ),
                    ),
                    onTap: () {
                      _combineStateManager.setTopId(items[index].id);
                      Get.back();
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _addBottom(BuildContext context) {
    Get.defaultDialog(
      title: "My Bottoms",
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close", style: TextStyle(color: Colors.red))),
      content: SizedBox(
        height: MediaQuery.of(context).size.height < 500 ? 300 : 500,
        width: MediaQuery.of(context).size.width * 0.9,
        child: FutureBuilder(
          future: _bottomStateManager.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Card(
                      color: ThemeColors.purpleLight,
                      child: ListTile(
                        title: Text(items[index].name),
                      ),
                    ),
                    onTap: () {
                      _combineStateManager.setBottomId(items[index].id);
                      Get.back();
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _addShoes(BuildContext context) {
    Get.defaultDialog(
      title: "My Tops",
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close", style: TextStyle(color: Colors.red))),
      content: SizedBox(
        height: MediaQuery.of(context).size.height < 500 ? 300 : 500,
        width: MediaQuery.of(context).size.width * 0.9,
        child: FutureBuilder(
          future: _shoesStateManager.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Card(
                      color: ThemeColors.purpleLight,
                      child: ListTile(
                        title: Text(items[index].name),
                      ),
                    ),
                    onTap: () {
                      _combineStateManager.setShoesId(items[index].id);
                      Get.back();
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
