import 'dart:convert';

import 'package:MyCombinationsApp/pages/combine/combines_page.dart';
import 'package:MyCombinationsApp/pages/top/top_page.dart';
import 'package:MyCombinationsApp/utils/router_utils.dart';
import 'package:cross_file/src/types/interface.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/combine_model.dart';
import '../model/top_model.dart';
import '../utils/snackbar_utils.dart';

class CombineService {
  static final String? base = dotenv.env["API_URL"];

  void createCombine(String name, int topId, int bottomId, int shoesId) async {
    final response = await http.post(
      Uri.parse("$base/api/v1/combines"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'topId': topId.toString(),
        'bottomId': bottomId.toString(),
        'shoesId': shoesId.toString(),
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Combination created');
      RouterUtils.goStateless(CombinePage());
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  void updateCombine(int id, String name) async {
    final response = await http.put(
      Uri.parse("$base/api/v1/combines/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": GetStorage().read('token')
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess('Success', 'Combination updated');
      RouterUtils.goStateless(CombinePage());
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  Future<List<Combine>> getCombines() async {
    final response = await http.get(Uri.parse("$base/api/v1/combines"), headers: {
      "Content-Type": "application/json",
      "Authorization": GetStorage().read('token')
    });

    if (response.statusCode == 200) {
      var content = json.decode(response.body);
      content = content.map<Combine>((json) => Combine.fromJson(json)).toList();
      return content;
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load combinations');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$base/api/v1/combines/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": GetStorage().read('token')
        });

    if (response.statusCode == 200) {
      SnackbarUtils.showSuccess(
        "Success",
        "Top deleted",
      );
      RouterUtils.goStateless(CombinePage());
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load combinations');
    }
  }

  Future<Combine> randomize () async {
    final response = await http.get(Uri.parse("$base/api/v1/combines/randomize"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": GetStorage().read('token')
        });

    if (response.statusCode == 200) {
      return Combine.fromJson(json.decode(response.body));
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load combinations');
    }
  }

}
