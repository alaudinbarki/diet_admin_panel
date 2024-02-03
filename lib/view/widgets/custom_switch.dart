import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import 'extention/border_extension.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key, required this.isNotify, required this.onPressed});
  final bool isNotify;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 38.w,
      decoration: BoxDecoration(
          color: isNotify == false ? greyLight : bluePrimary,
          borderRadius: borderRadiusCircular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 15.w,
            width: 15.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isNotify == false ? greyDark : bluePrimary,
            ),
          ).paddingOnly(left: 2.w),
          Container(
            height: 15.w,
            width: 15.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isNotify == true ? skylarColor : greyLight,
            ),
          ).onPress(onPressed).paddingOnly(right: 2.w)
        ],
      ),
    ).paddingOnly(right: 20.w);
  }
}
