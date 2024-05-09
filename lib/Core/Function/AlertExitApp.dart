import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
      title: "exit",
      middleText: "are you sure?? ",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('yes')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("no"))
      ]);
}
