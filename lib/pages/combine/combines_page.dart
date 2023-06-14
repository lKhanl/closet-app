import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/combine/combine_state_manager.dart';
import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../components/text_field.dart';
import '../../layout/box.dart';
import '../../model/combine_model.dart';
import '../../utils/router_utils.dart';
import '../home/user_state_manager.dart';
import '../login/login_page.dart';
import 'add/add_combine_page.dart';

class CombinePage extends BasePage {
  CombinePage({Key? key}) : super(key: key);

  final _combineStateManager = GetIt.instance.get<CombineStateManager>();
  final _userStateManager = GetIt.instance.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterUtils.goStateless(AddCombinePage());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('My Combinations'),
        actions: [
          IconButton(
              onPressed: () => {_random(context)}, icon: Icon(Icons.get_app)),
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
          future: _combineStateManager.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var combines = snapshot.data!;
              if (combines.isEmpty) {
                return Center(
                  child: Text('No combinations found, add some!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                );
              }
              return ListView.builder(
                itemCount: combines.length,
                itemBuilder: (context, index) {
                  final Combine combine = combines[index];
                  return Card(
                    child: ListBody(
                      children: [
                        ListTile(
                          title: Text(combine.name),
                        ),
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
                                      title: Text('Edit Combination'),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                                text: 'Enter a name',
                                                onChanged: (value) =>
                                                    _combineStateManager
                                                        .setName(value)),
                                            Box.h8,
                                            Container(
                                              child: Card(
                                                child: ListBody(
                                                  children: [
                                                    Text(combine.top.name),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Box.h8,
                                            Container(
                                              child: Card(
                                                child: ListBody(
                                                  children: [
                                                    Text(combine.bottom.name),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Box.h8,
                                            Container(
                                              child: Card(
                                                child: ListBody(
                                                  children: [
                                                    Text(combine.shoes.name),
                                                  ],
                                                ),
                                              ),
                                            )
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
                                              _combineStateManager
                                                  .update(combine.id);
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
                                      title: Text('Delete Combination'),
                                      content: Text(
                                          'Are you sure you want to delete this combination?'),
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
                                            _combineStateManager
                                                .delete(combine.id);
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

  void _random(BuildContext context) {
    Get.defaultDialog(
      title: "Random Combination",
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close", style: TextStyle(color: Colors.red))),
      content: SizedBox(
        child: FutureBuilder(
          future: _combineStateManager.randomize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var random = snapshot.data!;
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            random.name,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Top: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(random.top.name),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Bottom: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(random.bottom.name),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Shoes: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(random.shoes.name),
                        ],
                      ),
                    ),
                  ],
                ),
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
