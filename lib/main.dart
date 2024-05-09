// ignore_for_file: prefer_const_constructors, unused_import


import 'package:flutter/material.dart';


import 'package:flutter/services.dart';


import 'package:get/get.dart';


import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'package:kallcenter/Binding.dart';


import 'package:kallcenter/Core/Constante/RoutesApp.dart';


import 'package:kallcenter/Core/Function/initialStorage.dart';


import 'package:kallcenter/Routes.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  //initialized size


  await InitialStorage();


  runApp(const MyApp());

}


class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {

    return GetMaterialApp(

      // builder: DevicePreview.appBuilder,


      title: 'KallCenter',


      debugShowCheckedModeBanner: false,


      // home: LoginPage(),


      // home: Test(),


      // initialRoute: RoutesApp.Home,


      initialRoute: RoutesApp.Login,


      getPages: routes,


      initialBinding: Binding(),

    );

  }

}

