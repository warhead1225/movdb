import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static void showSnackBar({String? title, required String message}) {
    if (Get.isSnackbarOpen) {
      Get.back(); //Dismiss current Snackbar
    }
    Get.snackbar(
      title ?? '',
      message,
      colorText: Colors.white,
      backgroundColor: Colors.black54,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      isDismissible: true,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
    );
  }
}
