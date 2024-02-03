import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';

Future warningBottumSheet(BuildContext context, String warningIcon,
    String description, VoidCallback onPressed) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: whitePrimary,
    // set this when inner content overflows, making RoundedRectangleBorder not working as expected
    clipBehavior: Clip.antiAlias,
    // set shape to make top corners rounded
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: greenSecondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Images.iconClose,
                    height: 20.h,
                    width: 20.h,
                  ).onPress(() {
                    Navigator.pop(context);
                  }),
                ],
              ).paddingOnly(bottom: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    warningIcon,
                    height: 90.h,
                    width: 90.h,
                  ),
                ],
              ).paddingOnly(bottom: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.w,
                    child: description
                        .toText(
                            fontSize: 18,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            fontFamily: poppinsMedium,
                            color: blackPrimary)
                        .center,
                  )
                ],
              ).paddingOnly(bottom: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonName: Constant.noText,
                    width: 168.w,
                    onPressed: () => Navigator.pop(context),
                  ),
                  15.width,
                  CustomButton(
                      buttonName: Constant.yesText,
                      width: 168.w,
                      buttonTextColor: bluePrimary,
                      buttonColor: whitePrimary,
                      onPressed: onPressed),
                ],
              ).paddingOnly(bottom: 10.h),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
      );
    },
  );
}
