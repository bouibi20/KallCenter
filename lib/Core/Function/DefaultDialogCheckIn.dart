// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void ShowDefaultDialog(
  BuildContext context, {
  String title = 'problem du connexion',
  String middleText = 'essayez une autre fois',
  Color backgroundColor = Colors.white,
  double radius = 10.0,
  TextStyle? titleStyle,
  TextStyle? middleTextStyle,
  List<Widget>? actions,
}) {
  if (Get.isDialogOpen != true) {
    Get.defaultDialog(
      title: title,
      content: Text(
        middleText,
        style: middleTextStyle ?? TextStyle(fontSize: 16.0),
      ),
      backgroundColor: backgroundColor,
      radius: radius,
      titleStyle:
          titleStyle ?? TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      actions: actions ??
          [
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
    );
  }
}
