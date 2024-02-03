// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class WebCustomButton extends StatelessWidget {
  const WebCustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.buttonTextColor = whitePrimary,
    this.buttonColor = bluePrimary,
    this.borderColor = bluePrimary,
    this.height,
    this.width,
    this.radius = 10,
    this.textSize = 16,
    this.prefixIcon, // Optional prefix icon
    this.postfixIcon, // Optional postfix icon
  });

  final String buttonName;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color borderColor;
  final Color buttonTextColor;
  final double? height;
  final double? width;
  final double radius;
  final int textSize;
  final Widget? prefixIcon; // Widget type to allow for custom icons
  final Widget? postfixIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 80.webH(context),
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          color: buttonColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max, // To wrap content in the row
          mainAxisAlignment: prefixIcon != null || postfixIcon != null
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
            ],
            Text(
              buttonName,
              style: TextStyle(
                color: buttonTextColor,
                fontSize: textSize.toDouble(),
                fontFamily: 'PoppinsRegular',
              ),
            ),
            if (postfixIcon != null) ...[
              postfixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
