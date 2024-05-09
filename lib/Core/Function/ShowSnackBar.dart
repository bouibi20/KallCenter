// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

ShowSnackBar(context, String text, Color colorText, Color backgroundColor,
    Duration duration,
    {double? fontsize,
    String? fontFamily,
    EdgeInsetsGeometry? padding,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? margin}) {
  Get.snackbar(
    "Error: ",
    "text",
    icon: Icon(
      Icons.warning,
      color: Colors.red,
    ),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    duration: duration,
    animationDuration: Duration(milliseconds: 1500),
    // reverseAnimationCurve: Cubic(0, 2, 2, 1),
    forwardAnimationCurve: ElasticInCurve(10),

    borderRadius: 5,
    margin: EdgeInsets.all(10),
    colorText: colorText,
    // titleText: Text(
    //   text,
    //   style: TextStyle(
    //       color: colorText as Color,
    //       fontSize: fontsize,
    //       fontFamily: fontFamily,
    //       fontWeight: fontWeight),
    //   textAlign: TextAlign.center,
    // ),
  );
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(
  //       text,
  //       style: TextStyle(
  //           color: colorText as Color,
  //           fontSize: fontsize,
  //           fontFamily: fontFamily,
  //           fontWeight: fontWeight),
  //       textAlign: TextAlign.center,
  //     ),
  //     backgroundColor: backgroundColor,
  //     duration: duration,
  //     padding: padding,
  //     // shape: StadiumBorder(),
  //     behavior: SnackBarBehavior.floating,
  //     margin: EdgeInsets.all(30),
  //     elevation: 30,
  //   ),
  // );
}
