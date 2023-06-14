import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/bottom/bottom_state_manager.dart';
import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../components/text_field.dart';
import '../../model/bottom_model.dart';
import '../../utils/router_utils.dart';
import '../home/user_state_manager.dart';
import '../login/login_page.dart';

class BottomPage extends BasePage {
  BottomPage({Key? key}) : super(key: key);

  final _bottomStateManager = GetIt.instance.get<BottomStateManager>();
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
                title: Text('Add Bottom'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                          text: 'Enter a name',
                          onChanged: (value) =>
                              _bottomStateManager.setName(value)),
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
                        _bottomStateManager.create();
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
        title: Text('My Bottoms'),
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
          future: _bottomStateManager.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var bottoms = snapshot.data!;
              if (bottoms.isEmpty) {
                return Center(
                  child: Text('No bottoms found, add some!', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )),
                );
              }
              return ListView.builder(
                itemCount: bottoms.length,
                itemBuilder: (context, index) {
                  final Bottom bottom = bottoms[index];
                  return Card(
                    child: ListBody(
                      children: [
                        ListTile(
                          title: Text(bottom.name),
                          onTap: () {},
                        ),
                        Image(
                            image: NetworkImage(bottom.url ??
                                'https://dummyimage.com/600x400/000/fff')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text('Edit'),
                              onPressed: () {
                                // show dialog and get input from user
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final _formKey = GlobalKey<FormState>();
                                    return AlertDialog(
                                      title: Text('Edit Bottom'),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                                text: 'Enter a name',
                                                onChanged: (value) =>
                                                    _bottomStateManager
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
                                              _bottomStateManager
                                                  .update(bottom.id);
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
                                      title: Text('Delete Bottom'),
                                      content: Text(
                                          'Are you sure you want to delete this bottom?'),
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
                                            _bottomStateManager
                                                .delete(bottom.id);
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
