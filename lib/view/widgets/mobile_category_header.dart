import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'custom_image.dart';

class MobileCategoryHeader extends StatelessWidget {
  final String title;
  final String? imagePath;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double iconWidth;
  final double iconHeight;

  const MobileCategoryHeader({
    super.key,
    required this.title,
    this.imagePath,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = blackPrimary,
    this.iconWidth = 16,
    this.iconHeight = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 208.w,
      child: Row(
        children: [
          title.toText(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
          const SizedBox(width: 8), // Spacing between text and image
          if (imagePath != null)
            CustomImage(
              image: imagePath!,
              width: iconWidth,
              height: iconHeight,
            )
        ],
      ),
    );
  }
}
