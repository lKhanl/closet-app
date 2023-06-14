import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:MyCombinationsApp/pages/top/top_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../components/text_field.dart';
import '../../model/top_model.dart';
import '../../utils/router_utils.dart';
import '../home/user_state_manager.dart';
import '../login/login_page.dart';

class TopPage extends BasePage {
  TopPage({Key? key}) : super(key: key);

  final _topStateManager = GetIt.instance.get<TopStateManager>();
  final _userStateManager = GetIt.instance.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // show dialog and get input from user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final _formKey = GlobalKey<FormState>();
              return AlertDialog(
                title: Text('Add Top'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                          text: 'Enter a name',
                          onChanged: (value) =>
                              _topStateManager.setName(value)),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _topStateManager.create();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('My Tops'),
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
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: FutureBuilder(
          future: _topStateManager.getTops(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var tops = snapshot.data!;
              if (tops.isEmpty) {
                return Center(
                  child: Text('No tops found, add some!', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )),
                );
              }
              return ListView.builder(
                itemCount: tops.length,
                itemBuilder: (context, index) {
                  final Top top = tops[index];
                  return Card(
                    child: ListBody(
                      children: [
                        ListTile(
                          title: Text(top.name),
                          onTap: () {},
                        ),
                        Image(
                            image: NetworkImage(top.url ??
                                'https://dummyimage.com/600x400/000/fff')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text('Edit'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final _formKey = GlobalKey<FormState>();
                                    return AlertDialog(
                                      title: Text('Edit Top'),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                                text: 'Enter a name',
                                                onChanged: (value) =>
                                                    _topStateManager
                                                        .setName(value)),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Save'),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _topStateManager.update(top.id);
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            TextButton(
                              child: Text('Delete',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Delete Top'),
                                      content: Text(
                                          'Are you sure you want to delete this top?'),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Delete',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          onPressed: () {
                                            _topStateManager.delete(top.id);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
