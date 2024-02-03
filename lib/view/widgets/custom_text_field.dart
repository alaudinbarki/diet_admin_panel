// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.isBorder = true,
      this.height,
      this.width,
      this.validator,
      this.onChanged,
      this.onSubmitted,
      this.borderColor = greyLight,
      this.hintColor = greyLight,
      this.isPassword = false,
      this.isSearch = false,
      this.onEyeTap,
      this.radius = 10,
      this.iconPadding = 16,
      this.fillColor = whitePrimary,
      this.isVisible = false,
      this.inputFormatter = 50,
      this.iconColor = bluePrimary,
      this.isEdit = false,
      this.isReadOnly = false,
      this.onTap,
      this.label,
      this.suffixIcon,
      this.prefixIcon,
      this.onSearchTap,
      this.isSearchTap});

  TextEditingController controller;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool isBorder;
  double? height;
  double? width;
  bool isVisible;
  Color iconColor;
  bool isEdit;
  bool isReadOnly;

  Color borderColor;
  Color hintColor;
  bool isSearch;
  bool isPassword;
  double radius;
  Color fillColor;
  int inputFormatter;
  String? label;
  int iconPadding;

  Widget? suffixIcon;
  Widget? prefixIcon;

  // String? suffixIcon;

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
                fontSize: 12, fontFamily: poppinsRegular, color: blackPrimary)
            : const SizedBox(),
        label != null ? 6.height : const SizedBox(),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
              readOnly: isReadOnly,
              autofocus: false,
              controller: controller,
              autovalidateMode: controller.text.isNotEmpty
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              style: const TextStyle(
                  fontSize: 12, fontFamily: poppinsLight, color: blackPrimary),
              obscureText: obscureText ?? false,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              textInputAction: textInputAction,
              onTap: onTap,
              inputFormatters: [
                LengthLimitingTextInputFormatter(inputFormatter)
              ],
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    fontSize: 12,
                    color: redPrimary,
                    fontFamily: poppinsRegular),
                fillColor: fillColor,
                filled: isBorder == true ? true : false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 14, color: hintColor, fontFamily: poppinsLight),
                suffixIcon: suffixIcon,
                contentPadding: isBorder == true
                    ? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w)
                    : null,
                border: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                errorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide:
                            const BorderSide(color: redPrimary, width: 1),
                      )
                    : InputBorder.none,
                focusedErrorBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                        borderSide:
                            const BorderSide(color: redPrimary, width: 1.2),
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
                        borderSide:
                            const BorderSide(color: bluePrimary, width: 1),
                      )
                    : InputBorder.none,
              )),
        ),
      ],
    );
  }
}
