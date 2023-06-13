import 'dart:convert';

import 'package:MyCombinationsApp/pages/home/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../style/theme_colors.dart';

class AuthService {
  static final String? base = dotenv.env["API_URL"];

  void register(String first, String last, String email, String password) {
    http.post(Uri.parse("$base/auth/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "firstName": first,
          "lastName": last,
          "email": email,
          "password": password
        }));
  }

  void login(String email, String password) async {
    final response = await http.post(Uri.parse("$base/auth/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200) {
      var token = json.decode(response.body)['jwtToken'];
      GetStorage().write('token', token);
      Get.offAll(() => HomePage());
    } else {
      if (response.body.contains('BadCredentials')) {
        Get.snackbar('Error', 'Bad Credentials',
            backgroundColor: ThemeColors.error);
      } else {
        Get.snackbar('Error', response.body,
            backgroundColor: ThemeColors.error);
      }
    }
  }
}
