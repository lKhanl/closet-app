import 'dart:convert';

import 'package:MyCombinationsApp/pages/bottom/bottoms_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/bottom_model.dart';
import '../utils/router_utils.dart';
import '../utils/snackbar_utils.dart';

class BottomService {
  static final String? base = dotenv.env["API_URL"];

  void createBottom(String name) async {
    final response = await http.post(
      Uri.parse("$base/api/v1/bottoms"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Bottom created');
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  void updateBottom(int id, String name) async {
    final response = await http.put(
      Uri.parse("$base/api/v1/bottoms/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Bottom updated');
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  Future<List<Bottom>> getBottoms() async {
    final response = await http.get(Uri.parse("$base/api/v1/bottoms"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": GetStorage().read('token')
        });

    if (response.statusCode == 200) {
      var content = json.decode(response.body);
      content = content.map<Bottom>((json) => Bottom.fromJson(json)).toList();
      return content;
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load bottoms');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$base/api/v1/bottoms/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": GetStorage().read('token')
        });

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess(
        "Success",
        "Bottom deleted",
      );
      RouterUtils.goStateless(BottomPage());
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load bottoms');
    }
  }
}
