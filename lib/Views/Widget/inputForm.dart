import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Core/Class/SizeScreenConfig.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class InputForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final IconData? iconsuffix;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  // static var golden = Colors.amber;
  final bool? obscureText;
  final Function()? onTap;
  final String? initialValue;
  final TextInputType? keyboardType;

  const InputForm(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.initialValue,
      this.onTap,
      required this.iconData,
      required this.validator,
      this.obscureText = false,
      this.iconsuffix,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    SizeScreenConfig size = Get.find();
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: ColorsApp.SecondColor,
        obscureText: obscureText!,
        initialValue: initialValue,
        style: const TextStyle(color: ColorsApp.black),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: ColorsApp.SecondColor,
              fontSize: size.fontSize! * 0.7,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: size.fontSize! * 0.7,
            ),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                iconsuffix,
                color: ColorsApp.PrimaryColor,
              ),
            ),
            prefixIcon: Icon(
              iconData,
              color: ColorsApp.PrimaryColor,
              size: size.fontSize!,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsApp.black, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            floatingLabelStyle: TextStyle(
              color: ColorsApp.SecondColor,
              fontSize: size.fontSize! * 0.8,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsApp.SecondColor, width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: TextStyle(fontSize: size.fontSize! * 0.63)));
  }
}
