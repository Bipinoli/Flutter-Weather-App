import "dart:math";
import "dart:ui" as ui;

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/widgets/sunrise_sunset_visual/sunrise_sunset_utils.dart';

class SunriseSunsetPainter extends CustomPainter {
  final double coverPercent;

  SunriseSunsetPainter({this.coverPercent});

  void _drawDashedArc(Rect rect, double startAngle, double sweepAngle,
      Canvas canvas, Paint paint) {
    final double angleGap = 0.05;
    final double angleDashWidth = 0.1;
    for (int i = 0; i < ((sweepAngle) / (angleGap + angleDashWidth)); i++) {
      double angleStart = startAngle + (i * (angleGap + angleDashWidth));
      canvas.drawArc(rect, angleStart, angleDashWidth, false, paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    final sizingAndLoc = SizingAndLocation(size: size);
    final double minHeight = sizingAndLoc.minHeight;
    final double maxHeight = sizingAndLoc.maxHeight;
    final double rectWidth = sizingAndLoc.rectWidth;
    final double minWidth = sizingAndLoc.minWidth;

    // draw gray arc
    paint.color = CustomColors.lightGray;
    _drawDashedArc(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth),
        -pi, pi, canvas, paint);

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
    var path = Path();
    path.moveTo(minWidth, minHeight);
    path.arcTo(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth), -pi,
        coverPercent * pi, false);
    path.lineTo(minWidth + rectWidth * coverPercent, minHeight);
    canvas.drawPath(path, paint);

    // draw yellow arc
    paint = Paint();
    paint.color = CustomColors.yellow;
    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;
    _drawDashedArc(Rect.fromLTWH(minWidth, maxHeight, rectWidth, rectWidth),
        -pi, coverPercent * pi, canvas, paint);

    // draw horizon
    paint.color = CustomColors.lightGray;
    paint.strokeWidth = 1.5;
    canvas.drawLine(
        Offset(0.0, minHeight), Offset(size.width, minHeight), paint);

    // draw sunrinse and sunset entry point
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(sizingAndLoc.locateSunRisePoint(), 4.0, paint);
    canvas.drawCircle(sizingAndLoc.locateSunSetPoint(), 4.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
