import 'package:flutter/material.dart';

class HorizontalLine extends CustomPainter {
  Paint _paint;
  final double endXOffset;
  final double strokeWidth;

  HorizontalLine({@required this.endXOffset, this.strokeWidth = 2}) {
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(1.0, 0.0), Offset(endXOffset, 0.0), _paint);
  }

  @override
  bool shouldRepaint(HorizontalLine oldDelegate) {
    return endXOffset != oldDelegate.endXOffset;
  }
}
