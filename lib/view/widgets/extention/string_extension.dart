import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';


extension StringExtension on String {
  Widget toText(
          {Color? color,
          double? fontSize,
          String? fontFamily,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          FontWeight? fontWeight,
          Color? backgroundColor,
          double? lineHeight,
          bool? isBold,
          bool? isMedium}) =>
      Text(
        this,
        maxLines: maxLine ?? maxLine,
        textAlign: textAlign ?? textAlign,
        style: TextStyle(
          height: lineHeight,
          backgroundColor: backgroundColor ?? backgroundColor,
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12,
          fontFamily: fontFamily,
          overflow: overflow ?? TextOverflow.ellipsis,
          fontWeight: fontWeight ??
              (isBold == true
                  ? FontWeight.bold
                  : (isMedium == true ? FontWeight.w500 : FontWeight.w400)),
        ),
      );

  // Web Text Extension
  Widget toTextWeb(
          {required BuildContext context,
          Color? color,
          required int fontSize,
          double? textScaleFactor,
          String? fontFamily,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          FontWeight? fontWeight,
          Color? backgroundColor,
          double? lineHeight,
          bool? isBold,
          bool? isMedium}) =>
      Text(
        this,
        maxLines: maxLine ?? maxLine,
        textAlign: textAlign ?? textAlign,
        textScaleFactor: textScaleFactor,
        style: TextStyle(
          height: lineHeight,
          backgroundColor: backgroundColor ?? backgroundColor,
          color: color ?? textColor,
          fontSize: fontSize.webT(context),
          fontFamily: fontFamily,
          overflow: overflow ?? TextOverflow.ellipsis,
          fontWeight: fontWeight ??
              (isBold == true
                  ? FontWeight.bold
                  : (isMedium == true ? FontWeight.w500 : FontWeight.w400)),
        ),
      );
  Widget toTextStyle({
    int? maxLine,
    TextAlign? textAlign,
    TextStyle? textStyle,
  }) =>
      Text(this,
          maxLines: maxLine ?? maxLine,
          textAlign: textAlign ?? textAlign,
          style: textStyle);
}
