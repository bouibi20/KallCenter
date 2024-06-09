import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kallcenter/Core/Class/MyDialog.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';
import 'package:kallcenter/Core/Constante/RoutesApp.dart';
import 'package:kallcenter/Core/Services/Storage.dart';
import 'package:kallcenter/Data/model/User.dart';

abstract class DashboardController extends GetxController {
  commandePaimment(bool val);
  selectStores();
  switchCommandAndPaimment();
}

class DashboardControllerImp extends DashboardController {
  ///// for storage
  MyStorage storage = Get.find();
  late User_Model user;
  SizeScreenConfig size = Get.find();
  late String store;
  late bool swit;
  bool Commande = true;
  @override
  void onInit() {
    // TODO: implement onInit
    user = storage.getUser();
    swit = true;
    store = user.stores[0].name!;
    print(user.stores[0].name!);
    super.onInit();
  }

  @override
  commandePaimment(bool val) {
    swit = val;
    print(swit);
    update();
  }

  @override
  selectStores() {
    // MyDialog.Seccess("choisie votre store", () => null, textbtn)
    storage.delete();
    Get.offNamed(RoutesApp.Login);

    // Get.dialog(
    //   Dialog(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     backgroundColor: Colors.white,
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           const Text(
    //             "sélectionner votre store :",
    //             style: TextStyle(
    //               color: ColorsApp.PrimaryColor,
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           InkWell(
    //             onTap: () {
    //               print("hello woooord");
    //               // Get.back();
    //             },
    //             child: Container(
    //                 color: const Color.fromARGB(80, 100, 255, 219),
    //                 width: double.infinity,
    //                 child: Text(
    //                   "textbtn",
    //                   style: TextStyle(fontSize: 18),
    //                   textAlign: TextAlign.center,
    //                 )),
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             "select votre stores",
    //             style: const TextStyle(
    //               fontSize: 18,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             "select votre stores",
    //             style: const TextStyle(
    //               fontSize: 18,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             "select votre stores",
    //             style: const TextStyle(
    //               fontSize: 18,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             "select votre stores",
    //             style: const TextStyle(
    //               fontSize: 18,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: () {
    //               print("hello woooord");
    //               Get.back();
    //             },
    //             child: Text("textbtn"),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   barrierDismissible: true,
    // );
  }

  @override
  switchCommandAndPaimment() {
    Commande = !Commande;
  }
}
