import 'package:get/get.dart';

import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';

import 'package:kallcenter/Data/API/User.dart';


class Binding extends Bindings {

  @override

  void dependencies() {

    Get.put(SizeScreenConfig());

    Get.put(UserAPI(), permanent: true);

    // TODO: implement dependencies

  }

}

