import 'package:flutter/material.dart';
import 'package:njihuchallenge/constants/color.dart';

//croping a messagebox bot
class ShapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    var path = Path();
    path.moveTo(0, size.height - 5);
    path.quadraticBezierTo(0, size.height, 5, size.height);
    path.lineTo(5, size.height);
    path.lineTo(size.width - 15, size.height);
    path.quadraticBezierTo(
        size.width - 10, size.height, size.width - 10, size.height - 5);
    path.lineTo(size.width - 10, size.height - 5);
    path.lineTo(size.width - 10, 10);
    path.lineTo(size.width, 0);
    path.lineTo(5, 0);
    path.quadraticBezierTo(0, 0, 0, 5);
    path.lineTo(0, size.height - 5);
    canvas.drawShadow(path, appWhite, 2.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
