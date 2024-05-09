import 'package:get/get.dart';


import 'package:kallcenter/Core/Constante/RoutesApp.dart';


import 'package:kallcenter/Core/Middlewares/Login.dart';


import 'package:kallcenter/Views/Screen/Auth/Login.dart';


import 'package:kallcenter/Views/Screen/Home.dart';


List<GetPage<dynamic>>? routes = [

  /////////////////Auth////////////////


  GetPage(name: RoutesApp.Home, page: () => Home()),


  GetPage(

      name: RoutesApp.Login,

      page: () => Login(),

      middlewares: [Login_Middleware()]),

];

