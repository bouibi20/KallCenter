import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeScreenConfig {
  static MediaQueryData? mediaQueryData;
  double? screenWidth;
  double? screenHeight;
  double? defaultSize;
  double? fontSize;
  static Orientation? orientation;
  double calculateFontSize(
      double screenWidth, double screenHeight, double percentage) {
    // Calculate the font size based on the smaller dimension (width or height)
    double smallerDimension =
        screenWidth < screenHeight ? screenWidth : screenHeight;

    // Calculate the font size as a percentage of the smaller dimension
    double fontSize = smallerDimension * percentage / 100.0;

    return fontSize;
  }

  void init(BuildContext context) {
    var contexts = Get.context;
    mediaQueryData = MediaQuery.of(contexts!);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
    fontSize = calculateFontSize(screenWidth!, screenHeight!, 5.0);
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = screenWidth! * 0.024;
    print("config size is initialized");
  }
}
