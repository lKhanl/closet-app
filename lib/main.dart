import 'package:ClosetApp/pages/initial/initial_page.dart';
import 'package:ClosetApp/style/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const ClosetApp());
}

class ClosetApp extends StatelessWidget {
  const ClosetApp({super.key});

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
