import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.image,
    required this.onPressed,
  });

  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.w,
        width: 60.w,
        decoration: BoxDecoration(
            color: whiteSecondary,
            shape: BoxShape.circle,
            border: Border.all(color: whiteSecondary)),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          image,
          height: 30.w,
          width: 30.w,
        )).onPress(onPressed);
  }
}
