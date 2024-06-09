import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/MySnackbar.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Core/Constante/RoutesApp.dart';
import 'package:kallcenter/Core/Function/HandlingData.dart';
import 'package:kallcenter/Core/Services/Storage.dart';
import 'package:kallcenter/Data/API/User.dart';
import 'package:kallcenter/Data/model/User.dart';

abstract class LoginController extends GetxController {
  showpasswordfunction();
  gotopageforgetpassword();
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
//////////////declaration username and password
  late TextEditingController email;
  late TextEditingController password;
  ////////////for showing password
  bool showpassword = true;
  ///// for API Data
  UserAPI userApi = Get.find();
  ///// for status
  late StatusRequest status;
  ///// for storage
  MyStorage storage = Get.find();
  ///// for size
  // SizeScreenConfig size = Get.find();
  SizeScreenConfig size = Get.put(SizeScreenConfig(), permanent: true);
  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    status = StatusRequest.success;
    size.init(Get.context!);
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  showpasswordfunction() {
    showpassword = !showpassword;
    update();
  }

  @override
  gotopageforgetpassword() {
    // TODO: implement gotopageforgetpassword
    throw UnimplementedError();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    //// validation input
    if (formdata!.validate()) {
      /////// active page loading
      status = StatusRequest.loading;
      update();
      ///////////////////////get data from API
      var request = await userApi.Login(email.text, password.text);
      var data = request.fold((l) => l, (r) => r);
      // check request is data or StatusRequest
      status = handlingData(data);
      if (status == StatusRequest.success) {
        print("login seccessufly");
        data as User_Model;
        await storage.SaveUser(data);
        Get.offNamed(RoutesApp.Home, arguments: data);
      } else if (status == StatusRequest.failure) {
        MySnackbar.Warnning("username or password not valide");
      } else if (status == StatusRequest.offlinefailure) {
        MySnackbar.Error("You don't have internet check your connection");
      } else if (status == StatusRequest.serveurfailure) {
        MySnackbar.Error("someThink is wrong Try onother time");
      }
    }
    update();
  }
}
