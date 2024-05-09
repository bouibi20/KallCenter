import 'package:get/get.dart';

import '../Services/Storage.dart';

Future InitialStorage() async {
  await Get.putAsync(() => MyStorage().init());
}
