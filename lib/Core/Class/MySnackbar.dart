// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

Duration duration = const Duration(seconds: 5);
Duration animationduration = const Duration(milliseconds: 1800);

class MySnackbar {
  static Error(String msg) {
    Get.snackbar(
      "Error :",
      "",
      icon: const Icon(
        Icons.error,
        color: ColorsApp.red,
      ),
      messageText: Text(
        msg,
        style: const TextStyle(
            color: ColorsApp.red, fontSize: 15, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
      // snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xEEFDF7E5),
      duration: duration,
      animationDuration: animationduration,
      reverseAnimationCurve: const Cubic(0, 0, 0, 2),
      forwardAnimationCurve: const Cubic(0, 0, 0, 10),
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      colorText: ColorsApp.red,
    );
  }

  static Warnning(String msg) {
    Get.snackbar(
      "Warnning :",
      "",
      icon: const Icon(
        Icons.warning,
        color: ColorsApp.orange,
      ),
      messageText: Text(
        msg,
        style: const TextStyle(
            color: ColorsApp.orange, fontSize: 15, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
      // snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xEEFDF7E5),
      duration: duration,
      animationDuration: animationduration,
      reverseAnimationCurve: const Cubic(0, 0, 0, 2),
      forwardAnimationCurve: const Cubic(0, 0, 0, 10),
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      colorText: ColorsApp.orange,
    );
  }

  static Seccess(String msg) {
    Get.snackbar(
      "Seccess :",
      "",
      icon: const Icon(
        Icons.check,
        color: ColorsApp.green,
      ),
      messageText: Text(
        msg,
        style: const TextStyle(
            color: ColorsApp.green, fontSize: 15, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
      // snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFFDF7E5),
      duration: duration,
      animationDuration: animationduration,
      reverseAnimationCurve: const Cubic(0, 0, 0, 2),
      forwardAnimationCurve: const Cubic(0, 0, 0, 10),
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      colorText: ColorsApp.green,
    );
  }
}
