import 'package:flutter/material.dart';

class ImageFramePainter extends CustomPainter {
  final String imagePath;

  ImageFramePainter({required this.imagePath});

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the dimensions for the square frame
    double frameSize = size.width < size.height ? size.width : size.height;
    double left = (size.width - frameSize) / 2;
    double top = (size.height - frameSize) / 2;

    // Draw the square frame
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(Rect.fromLTWH(left, top, frameSize, frameSize), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
