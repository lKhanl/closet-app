import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/page_model.dart';
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
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  void updateShoes(String name) async {
    final response = await http.put(
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
      SnackbarUtils.showSuccess('Success', 'Shoes updated');
    } else {
      SnackbarUtils.showError(response.body);
    }
  }

  Future<PagingResult> getShoes() async {
    final response = await http.get(Uri.parse("$base/api/v1/shoes"), headers: {
      "Content-Type": "application/json",
      "Authorization": GetStorage().read('token')
    });

    if (response.statusCode == 200) {
      var content = json.decode(response.body)['content'] as List<dynamic>;
      var totalPages = json.decode(response.body)['totalPages'] as int;
      var totalElements = json.decode(response.body)['totalElements'] as int;
      var size = json.decode(response.body)['size'] as int;
      var page = json.decode(response.body)['page'] as int;
      var empty = json.decode(response.body)['empty'] as bool;

      PagingResult pagingResult = PagingResult(
          content: content,
          totalPages: totalPages,
          totalElements: totalElements,
          size: size,
          page: page,
          empty: empty);
      return pagingResult;
    } else {
      SnackbarUtils.showError(response.body);
      throw Exception('Failed to load shoes');
    }
  }
}