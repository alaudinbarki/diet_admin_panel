// ignore_for_file: must_be_immutable

import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'extention/border_extension.dart';

class ButtonWithIcon extends StatelessWidget {
  ButtonWithIcon(
      {super.key, required this.buttonName,
      required this.onPressed,
      this.buttonTextColor = whitePrimary,
      this.buttonColor = bluePrimary,
      this.borderColor = bluePrimary,
      this.height,
      this.width,
      this.iconWidth,
      this.iconHeight,
      required this.icon});

  String buttonName;
  VoidCallback onPressed;
  Color buttonColor;
  Color borderColor;
  Color buttonTextColor = whitePrimary;
  double? height;
  double? width;
  String icon;
  double? iconHeight;
  double? iconWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? 44.h,
            width: width ?? 322.w,
            decoration: BoxDecoration(
                borderRadius: borderRadiusCircular(23),
                border: borderAll(color: borderColor),
                color: buttonColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter:
                      const ColorFilter.mode(whitePrimary, BlendMode.srcIn),
                  height: iconHeight ?? 19.h,
                  width: iconWidth ?? 19.w,
                ),
                5.width,
                buttonName
                    .toText(
                        color: buttonTextColor,
                        fontSize: 14,
                        fontFamily: poppinsRegular)
                    .center
              ],
            )));
  }
}
