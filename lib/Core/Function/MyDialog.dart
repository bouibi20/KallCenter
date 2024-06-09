import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class MyDialog {
  static Error(String msg, onPressed(), String textbtn) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Error",
                style: TextStyle(
                  color: ColorsApp.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                msg,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(textbtn),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Warning(String msg, onPressed(), String textbtn, bool btnBack,
      {bool backdouble = false, bool exite = false}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Warning",
                style: TextStyle(
                  color: ColorsApp.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                msg,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  if (exite)
                    ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text("exit"),
                    ),
                  if (exite) const Spacer(),
                  if (btnBack)
                    ElevatedButton(
                      onPressed: () {
                        if (backdouble) {
                          Get.back();
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: const Text("back"),
                    ),
                  if (btnBack) const Spacer(),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(textbtn),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Seccess(String msg, onPressed(), String textbtn) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Seccess",
                style: TextStyle(
                  color: ColorsApp.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                msg,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(textbtn),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
