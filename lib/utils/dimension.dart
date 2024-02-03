import 'package:flutter/material.dart';

import 'constant.dart';

mediaQuerySize(BuildContext context) {
  mediaQuery = MediaQuery.of(context).size;
}

// ignore: prefer_typing_uninitialized_variables
var mediaQuery;

double widgetHeight(double pixels) {
  return mediaQuery.height / (Constant.designHeight / pixels);
}

double widgetWidth(double pixels) {
  return mediaQuery.width / (Constant.designWidth / pixels);
}

double webDesignHeight = 1020;
double webDesignWidth = 1920;

Size mediaQueryWebSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double webWidgetHeight(BuildContext context, double pixels) {
  return mediaQueryWebSize(context).height * (pixels / webDesignHeight);
}

double webWidgetWidth(BuildContext context, double pixels) {
  return mediaQueryWebSize(context).width * (pixels / webDesignWidth);
}

double webTextSize(BuildContext context, double pixels) {
  double scalingFactor;
  scalingFactor = pixels / webDesignWidth;
  return mediaQueryWebSize(context).width * scalingFactor;
}
