import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      this.isBack = false});

  final String image;
  final String title;
  final String description;
  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.height,
        isBack == false
            ? const SizedBox()
            : SvgPicture.asset(
                Images.iconArrowBack,
                height: 20.h,
                width: 24.w,
              )
                .onPress(() {
                  Navigator.pop(context);
                })
                .align(Alignment.topLeft)
                .paddingOnly(left: 20.w),
        SvgPicture.asset(
          image,
          height: 220.h,
          width: 305.w,
        ).paddingSymmetric(horizontal: 43.w),
        18.height,
        title
            .toText(
                color: bluePrimary, fontSize: 30, fontFamily: poppinsSemiBold)
            .center,
        4.height,
        SizedBox(
                width: 250.w,
                child: description.toText(
                    maxLine: 3,
                    textAlign: TextAlign.center,
                    color: greyPrimary,
                    fontSize: 12,
                    fontFamily: poppinsLight))
            .center,
      ],
    );
  }
}
