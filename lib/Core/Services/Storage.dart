// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:kallcenter/Data/Static/static.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kallcenter/Data/model/Strore.dart';
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
      await prefs!.setString("name", user.name!);
      await prefs!.setString("email", user.email!);
      await prefs!.setString("image", user.image!);
      await prefs!.setString("token", user.token!);
      await prefs!
          .setString("stores", Store_Model.ListStoretoSting(user.stores));

      print("data user is saved");
    } catch (e) {
      print("error:$e");
    }
  }

  getUser() {
    try {
      String? name = prefs!.getString("name");
      String? email = prefs!.getString("email");
      String? image = prefs!.getString("image");
      String? token = prefs!.getString("token");
      List<Store_Model> stores =
          Store_Model.StringToListStore(prefs!.getString("stores"));
      return User_Model(email, name, image, stores, token);
    } catch (e) {
      print("error for geting data user from storage: $e");
      return null;
    }
  }

  Future<bool?> delete() async {
    try {
      await prefs!.remove("name");
      await prefs!.remove("email");
      await prefs!.remove("image");
      await prefs!.remove("email");
      await prefs!.remove("token");
      await prefs!.remove("stores");
      print("data user is deteled");
      return true;
    } catch (e) {
      print("error:$e");
      return null;
    }
  }
}
