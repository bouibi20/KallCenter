import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
// import 'package:kallcenter/Core/Constante/RoutesApp.dart';
// import 'package:kallcenter/Core/Services/Storage.dart';

class Login_Middleware extends GetMiddleware {
  // MyStorage storage = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // if (storage.prefs!.getString("status") == "active") {
    //   print("your accout is active");
    //   return const RouteSettings(name: RoutesApp.Home);
    // } else if (storage.prefs!.getInt("IdPlans") != null) {
    //   print("your accout isn't active");
    //   return const RouteSettings(name: RoutesApp.Waiting);
    // } else if (storage.prefs!.getString("username") != null) {
    //   print("your shoud be select plans");
    //   return const RouteSettings(name: RoutesApp.Plans);
    // }
    return super.redirect(route);
  }
}
