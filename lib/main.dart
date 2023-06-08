import 'package:MyCombinationsApp/pages/initial/initial_page.dart';
import 'package:MyCombinationsApp/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  setupGetIt();
  runApp(const MyCombinationsApp());
}

class MyCombinationsApp extends StatelessWidget {
  const MyCombinationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Closet',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const InitialPage());
  }
}
