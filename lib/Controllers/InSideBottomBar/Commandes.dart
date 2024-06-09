import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';

abstract class Commandes extends GetxController {
  searched(String value);
}

class CommandesImp extends Commandes {
  SizeScreenConfig size = Get.find();
  late TextEditingController search;
  bool isExpanded = false;
  late String store;
  @override
  void onInit() {
    // TODO: implement onInit
    store = " store test";
    search = TextEditingController();
    super.onInit();
  }

  @override
  searched(String value) {}
}
