import 'package:MyCombinationsApp/pages/home/user_state_manager.dart';
import 'package:MyCombinationsApp/pages/login/login_page.dart';
import 'package:MyCombinationsApp/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/router_utils.dart';
import '../top/top_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  setupGetIt();
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _userStateManager = GetIt.I.get<UserStateManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Combinations'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
            future: _userStateManager.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var user = snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 228, 232, 235),
                        Color.fromARGB(255, 204, 209, 212),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () => RouterUtils.goStateless(TopPage()),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 69, 76, 82),
                                Color.fromARGB(255, 132, 141, 148),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 100,
                          child: Center(
                            child: Text(
                              'Top',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () => RouterUtils.goStateless(TopPage()),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 132, 141, 148),
                                Color.fromARGB(255, 69, 76, 82),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 100,
                          child: Center(
                            child: Text(
                              'Bottom',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () => RouterUtils.goStateless(TopPage()),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 69, 76, 82),
                                Color.fromARGB(255, 132, 141, 148),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 100,
                          child: Center(
                            child: Text(
                              'Shoes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () => RouterUtils.goStateless(TopPage()),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 132, 141, 148),
                                Color.fromARGB(255, 69, 76, 82),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 100,
                          child: Center(
                            child: Text(
                              'Combination',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        ],
      ),
    );
  }
}
