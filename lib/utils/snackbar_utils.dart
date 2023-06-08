import 'package:MyCombinationsApp/style/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: ThemeColors.error,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      titleText: Text(
        'Error',
        style: TextStyle(
            color: ThemeColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      messageText: Text(
        message,
        style: TextStyle(color: ThemeColors.black),
      ),
    );
  }

  static void showSuccess(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ThemeColors.success);
  }
}
