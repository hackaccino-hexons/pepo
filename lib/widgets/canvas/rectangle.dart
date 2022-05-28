import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:flutter/cupertino.dart';

class DrawRectangle extends CustomPainter {
  final double height;
  final double width;
  final Color fillColor;
  final double radius;

  DrawRectangle({
    this.height: 400.0,
    this.width: 300.0,
    this.fillColor: const Color(0xffffffff),
    this.radius: 50.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    @override
    void paint(Canvas canvas, Size size) {
      Paint paint = Paint()..color = Color(0x000000);
      Shapes shapes = Shapes(canvas: canvas, radius: this.radius, paint: paint, center: Offset.zero, angle: 0);

      shapes.drawCircle();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}