import 'dart:convert';

import 'package:MyCombinationsApp/model/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../style/theme_colors.dart';

class UserService {
  static final String? base = dotenv.env["API_URL"];

  Future<User> getProfile() async {
    final response = await http.get(Uri.parse("$base/api/v1/users/profile"), headers: {
      "Content-Type": "application/json",
      "Authorization": GetStorage().read('token')
    });

    if (response.statusCode == 200) {
      var user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      Get.snackbar('Error', response.body, backgroundColor: ThemeColors.error);
      throw Exception('Failed to load user');
    }
  }
}