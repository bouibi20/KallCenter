import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Core/Constante/RoutesApp.dart';
import 'package:kallcenter/Core/Services/Storage.dart';
import 'package:kallcenter/Data/API/User.dart';

abstract class LoginController extends GetxController {
  showpasswordfunction();
  gotopageforgetpassword();
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
//////////////declaration username and password
  late TextEditingController username;
  late TextEditingController password;
  ////////////for showing password
  bool showpassword = true;
  ///// for API Data
  UserAPI userApi = Get.find();
  ///// for status
  late StatusRequest status;
  ///// for storage
  MyStorage sotage = Get.find();
  ///// for size
  // SizeScreenConfig size = Get.find();
  SizeScreenConfig size = Get.put(SizeScreenConfig(), permanent: true);
  @override
  void onInit() {
    // TODO: implement onInit
    username = TextEditingController();
    password = TextEditingController();
    status = StatusRequest.success;
    size.init(Get.context!);
    super.onInit();
  }

  @override
  showpasswordfunction() {
    // TODO: implement showpasswordfunction
  }

  @override
  gotopageforgetpassword() {
    // TODO: implement gotopageforgetpassword
    throw UnimplementedError();
  }

  @override
  login() {
    Get.offNamed(RoutesApp.Home);
  }
}
