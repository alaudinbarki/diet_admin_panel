import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

searchAppBar(
    {required BuildContext context,
    required TextEditingController textEditingController,
    required String title,
    required VoidCallback onSearchTap}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: SvgPicture.asset(
      Images.iconArrowBack,
      colorFilter: const ColorFilter.mode(whitePrimary, BlendMode.srcIn),
    ).onPress(() {
      Navigator.pop(context);
    }).paddingSymmetric(horizontal: 10, vertical: 9),
    centerTitle: true,
    toolbarHeight: 110.h,
    elevation: 0,
    title: title.toText(
        color: whitePrimary, fontSize: 20, fontFamily: poppinsRegular),
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
            height: 70.h,
            color: bluePrimary,
            alignment: Alignment.center,
            child: CustomTextField(
              height: 48.h,
              width: 333.w,
              iconColor: greyDark,
              radius: 23,
              borderColor: whitePrimary,
              hintColor: greyDark,
              controller: textEditingController,
              hintText: Constant.hintSearch,
              iconPadding: 8,
              suffixIcon: Container(
                width: 65.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: yellowPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Constant.btnSearch
                    .toText(
                        color: whitePrimary,
                        fontFamily: poppinsRegular,
                        fontSize: 12)
                    .center,
              ).paddingAll(8.h).onPress(onSearchTap),
            ))),
  );
}
