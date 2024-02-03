
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';

class WebSocialButton extends StatelessWidget {
  const WebSocialButton({
    super.key,
    required this.image,
    required this.onPressed,
  });

  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 75.webH(context),
          decoration: BoxDecoration(
            color: whiteSecondary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            image,
            height: 40.webH(context),
            width: 40.webH(context),
          )).onPress(onPressed),
    );
  }
}
