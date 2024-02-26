import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';


class AppNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String errorPlaceHolder;

  const AppNetworkImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.errorPlaceHolder,
  });
  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: image,
      width: width,
      height: height,
      errorWidget: Image.asset(errorPlaceHolder),
    );
  }
}
