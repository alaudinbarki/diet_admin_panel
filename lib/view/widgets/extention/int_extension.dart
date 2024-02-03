
import 'package:flutter/material.dart';

import '../../../utils/dimension.dart';

extension IntExtension on int {
  // Extension use for sized box
  // To create space vertically of horizontally

  Widget get height => SizedBox(height: widgetHeight(toDouble()));

  Widget get width => SizedBox(width: widgetWidth(toDouble()));

  // Extension use for height and width of the widget

  double get h => widgetHeight(toDouble());

  double get w => widgetWidth(toDouble());

  // Extension use for sized box
  // To create space vertically of horizontally

  Widget webHeight(BuildContext context) => SizedBox(height:  webWidgetHeight(context,toDouble()));

  Widget webWidth(BuildContext context) => SizedBox(width:webWidgetWidth(context, toDouble()));

  Widget webScaleWidth(BuildContext context) => SizedBox(width: webTextSize(context, toDouble()));

  Widget webScaleHeight(BuildContext context) => SizedBox(height: webTextSize(context, toDouble()));

  // Extension use for height and width of the widget of Web
  
  double webH(BuildContext context) => webWidgetHeight(context,toDouble());

  double webW(BuildContext context) => webWidgetWidth(context, toDouble());

  double webT(BuildContext context) => webTextSize(context, toDouble());
}
