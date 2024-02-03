// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimension.dart';
import '../../../utils/style.dart';

class WebTextField extends StatelessWidget {
  WebTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.isBorder = true,
      this.validator,
      this.onChanged,
      this.onSubmitted,
      this.borderColor = greyLight,
      this.hintColor = greyLight,
      this.isPassword = false,
      this.isSearch = false,
      this.iconPadding,
      this.onEyeTap,
      this.radius = 8,
      this.fillColor = whitePrimary,
      this.isVisible = false,
      this.inputFormatter = 50,
      this.height,
      this.width,
      this.iconColor = bluePrimary,
      this.isEdit = false,
      this.isReadOnly = false,
      this.isLabelBold = false,
      this.onTap,
      this.suffixIcon,
      this.prefixIcon,
      this.label,
      this.onSearchTap,
      this.isSearchTap});
  TextEditingController controller;
  double? height;
  String? label;
  double? width;
  bool? isLabelBold;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool isBorder;
  bool isVisible;
  Color iconColor;
  bool isEdit;
  bool isReadOnly;
  double? iconPadding;
  Color borderColor;
  Color hintColor;
  bool isSearch;
  bool isPassword;
  double radius;
  Color fillColor;
  int inputFormatter;

  Widget? suffixIcon;
  Widget? prefixIcon;

  bool? isSearchTap;
  VoidCallback? onEyeTap;
  VoidCallback? onTap;
  VoidCallback? onSearchTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? label!.toText(
            fontSize: 14.webT(context), fontFamily: poppinsRegular, color: blackPrimary, fontWeight: isLabelBold == null || !isLabelBold! ? FontWeight.w400 : FontWeight.w600)
            : const SizedBox(),
        label != null ? 15.webHeight(context) : const SizedBox(),
        SizedBox(
          height: height ?? 45.webH(context),
          width: width ?? 360.webW(context),
          child: TextFormField(
              readOnly: isReadOnly,
              autofocus: false,
              controller: controller,
              textAlign: TextAlign.start,
              autovalidateMode: controller.text.isNotEmpty
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              style: TextStyle(fontSize: 16.webT(context), fontFamily: poppinsLight, color: blackPrimary),
              obscureText: obscureText ?? false,
              keyboardType: textInputType,
              validator: validator,
              textAlignVertical: TextAlignVertical.center,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              textInputAction: textInputAction,
              onTap: onTap,
              inputFormatters: [LengthLimitingTextInputFormatter(inputFormatter)],
              decoration: InputDecoration(
                errorStyle: TextStyle(
                    fontSize: 16.webT(context),
                    color: redPrimary,
                    fontFamily: poppinsRegular),
                fillColor: fillColor,
                filled: isBorder == true ? true : false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 16.webT(context),
                    color: hintColor,
                    fontFamily: poppinsLight),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: EdgeInsets.only(left: 10.webT(context)),
                border: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                errorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: const BorderSide(color: redPrimary, width: 1),
                      )
                    : InputBorder.none,
                focusedErrorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: const BorderSide(color: redPrimary, width: 1.2),
                      )
                    : InputBorder.none,
                enabledBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                focusedBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: const BorderSide(color: bluePrimary, width: 1),
                      )
                    : InputBorder.none,
              )),
        ),
      ],
    );
  }
}
