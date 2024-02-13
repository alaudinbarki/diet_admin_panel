// ignore_for_file: must_be_immutable

import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_image.dart';

class CustomPopupMenuButton extends StatefulWidget {
  bool? fromMobile;
  CustomPopupMenuButton({this.fromMobile = false, super.key});

  @override
  State<CustomPopupMenuButton> createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      surfaceTintColor: Colors.white,
      icon: CustomImage(
          image: Images.iconDropDown,
          width: widget.fromMobile! ? 22.w : 35.webT(context),
          height: widget.fromMobile! ? 22.w : 35.webT(context)),
      offset: Offset(0, widget.fromMobile! ? 25.w : 70.webT(context)),
      onSelected: (value) {
        switch (value) {
          case "0":
            debugPrint(value);
            break;
          case "1":
            Navigator.pushNamed(context, RouterHelper.accountSettingScreen);
            break;
          case "2":
            debugPrint(value);
            break;
          default:
            break;
        }

        debugPrint('Selected: $value');
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: '0',
            height: widget.fromMobile! ? 35.h : 55.webT(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.fromMobile!
                    ? "Manage Account".toText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: blackPrimary)
                    : "Manage Account".toTextWeb(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: blackPrimary,
                        context: context),
                Icon(
                  Icons.clear,
                  size: widget.fromMobile! ? 12.w : 20.webT(context),
                  color: textGreyColor,
                ).onPress(() {
                  Navigator.pop(context);
                }),
              ],
            ).paddingSymmetric(
                horizontal: widget.fromMobile! ? 10.w : 20.webT(context)),
          ),
          PopupMenuItem<String>(
            value: '1',
            height: widget.fromMobile! ? 35.h : 55.webT(context),
            child: Row(
              children: [
                CustomImage(
                    image: Images.iconSetting,
                    width: widget.fromMobile! ? 12.w : 20.webT(context),
                    height: widget.fromMobile! ? 16.w : 20.webT(context)),
                30.webScaleWidth(context),
                widget.fromMobile!
                    ? "Account Setting".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                      )
                    : "Account Setting".toTextWeb(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                        context: context),
              ],
            ).paddingSymmetric(
                horizontal: widget.fromMobile! ? 10.w : 20.webT(context)),
          ),
          PopupMenuItem<String>(
            value: '2',
            height: widget.fromMobile! ? 35.h : 55.webT(context),
            child: Row(
              children: [
                CustomImage(
                  image: Images.iconLogout,
                  width: widget.fromMobile! ? 12.w : 20.webT(context),
                  height: widget.fromMobile! ? 16.w : 20.webT(context),
                  iconColor: textGreyColor,
                ),
                30.webScaleWidth(context),
                widget.fromMobile!
                    ? "Log out".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                      )
                    : "Log out".toTextWeb(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                        context: context),
              ],
            ).paddingSymmetric(
                horizontal: widget.fromMobile! ? 10.w : 20.webT(context)),
          ),
        ];
      },
    );
  }
}
