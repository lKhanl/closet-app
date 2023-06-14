import 'package:MyCombinationsApp/pages/base_stateless_page.dart';
import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:MyCombinationsApp/pages/shoes/shoes_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../components/text_field.dart';
import '../../model/shoes_model.dart';
import '../../utils/router_utils.dart';
import '../home/user_state_manager.dart';
import '../login/login_page.dart';

class ShoesPage extends BasePage {
  ShoesPage({Key? key}) : super(key: key);

  final _shoesStateManager = GetIt.instance.get<ShoesStateManager>();
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
                title: Text('Add Shoes'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                          text: 'Enter a name',
                          onChanged: (value) =>
                              _shoesStateManager.setName(value)),
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
                        _shoesStateManager.create();
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
        title: Text('My Shoes'),
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
          future: _shoesStateManager.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var shoess = snapshot.data!;
              if (shoess.isEmpty) {
                return Center(
                  child: Text('No shoes found, add some!', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )),
                );
              }
              return ListView.builder(
                itemCount: shoess.length,
                itemBuilder: (context, index) {
                  final Shoes shoes = shoess[index];
                  return Card(
                    child: ListBody(
                      children: [
                        ListTile(
                          title: Text(shoes.name),
                          onTap: () {},
                        ),
                        Image(
                            image: NetworkImage(shoes.url ??
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
                                      title: Text('Edit Shoes'),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextField(
                                                text: 'Enter a name',
                                                onChanged: (value) =>
                                                    _shoesStateManager
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
                                              _shoesStateManager
                                                  .update(shoes.id);
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
                                      title: Text('Delete Shoes'),
                                      content: Text(
                                          'Are you sure you want to delete this shoes?'),
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
                                            // _shoesStateManager.delete(shoes.id);
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
