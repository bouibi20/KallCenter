// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:kallcenter/Data/Static/static.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Core/Function/CheckInternet.dart';
import 'package:kallcenter/Data/model/User.dart';

class MyStorage extends GetxService {
  late SharedPreferences? prefs;
  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   prefs = await SharedPreferences.getInstance();
  //   super.onInit();
  // }

  Future<MyStorage> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future SaveUser(User_Model user) async {
    try {
      await prefs!.setString("email", user.email!);
      print("data user is saved");
    } catch (e) {
      print("error:$e");
    }
  }

  getUser() {
    try {
      String? email = prefs!.getString("email");
      return email;
    } catch (e) {
      print("error for geting data user from storage: $e");
      return null;
    }
  }

  Future<bool?> delete() async {
    try {
      await prefs!.remove("email");
      print("data user is deteled");
      return true;
    } catch (e) {
      print("error:$e");
      return null;
    }
  }
}
