import 'dart:math';
import "dart:ui" as ui;

import "package:flutter/material.dart";
import 'package:weather_app/constants/colors.dart';

class SunriseSunsetPainter extends CustomPainter {
  final double coverPercent;
  SunriseSunsetPainter({this.coverPercent});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    final double minHeight = (size.height * 0.7);
    final double maxHeight = size.height * 0.2;
    final double rectWidth = (minHeight - maxHeight) * 2.0;
    final double minWidth = (size.width - rectWidth) / 2;

    // draw gray arc
    paint.color = CustomColors.gray;
    canvas.drawArc(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth),
        0.0, -pi, false, paint);

    // draw shade of sunshine
    paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, maxHeight),
        Offset(size.width / 2, minHeight),
        [
          CustomColors.lightYellow,
          CustomColors.veryLightYellow,
        ],
      );
    canvas.drawArc(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth),
        -pi, coverPercent * pi, true, paint);

    // draw yellow arc
    paint = Paint();
    paint.color = CustomColors.yellow;
    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth),
        -pi, coverPercent * pi, false, paint);

    // draw horizon
    paint.color = CustomColors.gray;
    canvas.drawLine(
        Offset(0.0, minHeight), Offset(size.width, minHeight), paint);

    // draw sunrinse and sunset entry point
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(minWidth, minHeight), 4.0, paint);
    canvas.drawCircle(Offset(size.width - minWidth, minHeight), 4.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SunriseSunset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: CustomPaint(
        painter: SunriseSunsetPainter(coverPercent: 0.6),
      ),
    );
  }
}
