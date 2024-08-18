import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Core/Function/Logout.dart';
import 'package:kallcenter/Data/model/User.dart';

abstract class Setting extends GetxController {}

class SettingImp extends Setting {
  SizeScreenConfig size = Get.find();
  late User_Model user;
  late double avatarRadius;
  @override
  void onInit() {
    // TODO: implement onInit
    avatarRadius = size.screenWidth! * 0.1;
    user = storage.getUser();
    super.onInit();
  }
}
