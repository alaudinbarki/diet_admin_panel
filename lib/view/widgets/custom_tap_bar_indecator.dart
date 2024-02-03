import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter();
  }
}

class _CustomPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = purplePrimary // Color for the indicator
      ..style = PaintingStyle.fill;

    final Offset indicatorOffset = Offset(
        offset.dx +
            configuration.size!.width / 2 -
            40, // Adjust the horizontal position
        offset.dy); // Change this to move the indicator line up or down

    const Size indicatorSize = Size(70, 2); // Width and height of the indicator

    final Rect rect = indicatorOffset & indicatorSize;

    canvas.drawRect(rect, paint);
  }
}
