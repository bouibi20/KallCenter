import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/MySnackbar.dart';
import 'package:kallcenter/Core/Constante/RoutesApp.dart';
import 'package:kallcenter/Core/Services/Storage.dart';

MyStorage storage = Get.find();

Future Logout() async {
  bool? logout = await storage.delete();
  if (logout!) {
    Get.offAllNamed(RoutesApp.Home);
  } else {
    MySnackbar.Error("Logout faild");
  }
}
