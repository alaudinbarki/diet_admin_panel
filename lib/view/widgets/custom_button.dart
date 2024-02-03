// ignore_for_file: must_be_immutable

import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import 'extention/border_extension.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.buttonName,
      required this.onPressed,
      this.buttonTextColor = whitePrimary,
      this.buttonColor = bluePrimary,
      this.borderColor = bluePrimary,
      this.height,
      this.width,
      this.radius = 10,
      this.textSize = 16});

  String buttonName;
  VoidCallback onPressed;
  Color buttonColor;
  Color borderColor;
  Color buttonTextColor = whitePrimary;
  double? height;
  double? width;
  double radius;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? 50.h,
            width: width ?? 313.w,
            decoration: BoxDecoration(
                borderRadius: borderRadiusCircular(radius),
                border: borderAll(color: borderColor),
                color: buttonColor),
            child: buttonName
                .toText(
                    color: buttonTextColor,
                    fontSize: textSize,
                    fontFamily: poppinsRegular)
                .center));
  }
}
