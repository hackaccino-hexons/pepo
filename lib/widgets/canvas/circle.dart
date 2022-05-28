import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  Paint _paint = Paint();
  Offset _offset = Offset(0.0, 0.0);
  double _radius = 100.0;

  DrawCircle(Color color, PaintingStyle style, {offset, radius}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = style;

    if (offset != null) {
      _offset = offset;
    }

    if (radius != null) {
      _radius = radius;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(_offset, _radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}