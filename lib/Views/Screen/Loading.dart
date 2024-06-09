import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.whiteLite,
      child: Center(
        child: SpinKitPouringHourGlassRefined(
          color: ColorsApp.PrimaryColor,
          size: 80.0,
        ),
      ),
    );
  }
}
