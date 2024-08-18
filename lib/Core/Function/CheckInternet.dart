import 'dart:io';

import 'package:connectivity/connectivity.dart';

Future<bool> CheckInternet() async {
  // try {
  //   final result = await InternetAddress.lookup('google.com');
  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     print("you have the internet");
  //     return true;
  //   } else {
  //     print("you dont have the internet");
  //     return false;
  //   }
  // } on SocketException catch (_) {
  //   return false;
  // }
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    final result = await InternetAddress.lookup('google.com');
    if ((connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) &&
        result.isNotEmpty &&
        result[0].rawAddress.isNotEmpty) {
      print("You have internet connectivity");
      return true;
    } else {
      print("You don't have internet connectivity");
      return true;
    }
  } catch (e) {
    print("Error checking internet connectivity: $e");
    return true;
  }
}
