import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Views/Screen/InSideBottomBar/Commandes.dart';
import 'package:kallcenter/Views/Screen/InSideBottomBar/Dashboard.dart';
import 'package:kallcenter/Views/Screen/InSideBottomBar/Setting.dart';

abstract class HomeController extends GetxController {
  next(int index);
}

class HomeControllerImp extends HomeController {
  SizeScreenConfig size = Get.put(SizeScreenConfig(), permanent: true);
  final List screens = [
    Dashboard(),
    Commandes(),
    Setting(),
  ];
  int currentIndex = 0;
  String text = "hello word from controller";
  @override
  void onInit() {
    size.init(Get.context!);
    super.onInit();
  }

  @override
  next(int index) {
    currentIndex = index;
    update();
  }
}
