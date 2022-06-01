import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MiniLineGraph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 1.5;
    final pointMode = ui.PointMode.polygon;

    final p0 = Offset(0, size.height / 2);
    final p1 = Offset(12, size.height / 3);
    final p2 = Offset(20, size.height / 2);
    final p3 = Offset(50, 2 * size.height / 3);

    final p6 = Offset(size.width, size.height / 2 - 10);
    final paint = Paint()
      ..color = Colors.white
      ..strokeJoin = ui.StrokeJoin.miter
      ..strokeCap = ui.StrokeCap.round
      ..strokeWidth = strokeWidth;

    //draw dash
    _drawDashedLine(canvas, size, paint);
    paint
      ..color = Colors.white
      ..strokeWidth = strokeWidth;

    final pointPaint = Paint()
      ..strokeWidth = 4
      ..strokeCap = ui.StrokeCap.round
      ..strokeJoin = ui.StrokeJoin.round
      ..color = Colors.white;

    canvas.drawPoints(pointMode, [p0, p1, p2, p3, p6], paint);
    canvas.drawPoints(ui.PointMode.points, [p0, p1, p2, p3, p6], pointPaint);
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    // Chage to your preferred size
    const int dashWidth = 4;
    const int dashSpace = 4;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = size.height / 2;
    paint.strokeWidth = 1;
    paint.color = Colors.white54;
    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startX < size.width) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
