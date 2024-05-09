import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';

abstract class DashboardController extends GetxController {
  commandePaimment(bool val);
}

class DashboardControllerImp extends DashboardController {
  // late TabController tabController;
  // late TickerProvider vsyncc;
  // DashboardControllerImp(TickerProvider vsync) {
  //   vsyncc = vsync;
  // }
  SizeScreenConfig size = Get.find();
  late String store;
  late bool swit;
  @override
  void onInit() {
    // TODO: implement onInit
    // tabController = TabController(length: 5, vsync: vsyncc);
    swit = true;
    store = " store test";
    super.onInit();
  }

  @override
  commandePaimment(bool val) {
    swit = val;
    print(swit);
    update();
  }
}
