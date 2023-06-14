import 'dart:convert';

import 'package:MyCombinationsApp/utils/router_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/shoes_model.dart';
import '../pages/shoes/shoes_page.dart';
import '../utils/snackbar_utils.dart';

class ShoesService {
  static final String? base = dotenv.env["API_URL"];

  void createShoes(String name) async {
    final response = await http.post(
      Uri.parse("$base/api/v1/shoes"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Shoes created');
      RouterUtils.goStateless(ShoesPage());
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  void updateShoes(int id, String name) async {
    final response = await http.put(
      Uri.parse("$base/api/v1/shoes/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Shoes updated');
      RouterUtils.goStateless(ShoesPage());
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  Future<List<Shoes>> getShoes() async {
    final response = await http.get(Uri.parse("$base/api/v1/shoes"), headers: {
      "Content-Type": "application/json",
      "Authorization": GetStorage().read('token')
    });

    if (response.statusCode == 200) {
      var content = json.decode(response.body);
      return (content as List).map((e) => Shoes.fromJson(e)).toList();
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load shoes');
    }
  }
}
