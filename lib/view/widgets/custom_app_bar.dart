import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

customAppBar(
    {required BuildContext context,
    required String title,
    required bool isBack}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: isBack == true
        ? SvgPicture.asset(
            Images.iconArrowBack,
            colorFilter: const ColorFilter.mode(whitePrimary, BlendMode.srcIn),
          ).onPress(() {
            Navigator.pop(context);
          }).paddingSymmetric(horizontal: 15, vertical: 10)
        : const SizedBox(),
    centerTitle: true,
    elevation: 0,
    title: title.toText(
        color: whitePrimary, fontSize: 20, fontFamily: poppinsRegular),
  );
}
