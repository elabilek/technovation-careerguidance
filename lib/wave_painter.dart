// wave_painter.dart
import 'package:flutter/material.dart';

// Custom painter for the wave effect (used in all screens)
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dark navy bottom layer
    final darkNavyPaint = Paint()
      ..color = const Color(0xFF0A1033)
      ..style = PaintingStyle.fill;
      
    // Pink/purple wave
    final pinkPaint = Paint()
      ..color = const Color(0xFFB86CA3)
      ..style = PaintingStyle.fill;
    
    final width = size.width;
    final height = size.height;
    
    // Draw dark navy background at the bottom
    final darkNavyPath = Path()
      ..moveTo(0, height * 0.5)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, height * 0.5)
      ..quadraticBezierTo(width * 0.75, height * 0.25, width * 0.5, height * 0.4)
      ..quadraticBezierTo(width * 0.25, height * 0.55, 0, height * 0.5)
      ..close();
    
    canvas.drawPath(darkNavyPath, darkNavyPaint);
    
    // Draw pink/purple wave
    final pinkPath = Path()
      ..moveTo(0, height * 0.65)
      ..quadraticBezierTo(width * 0.25, height * 0.4, width * 0.5, height * 0.55)
      ..quadraticBezierTo(width * 0.75, height * 0.7, width, height * 0.6)
      ..lineTo(width, height * 0.85)
      ..quadraticBezierTo(width * 0.75, height * 0.9, width * 0.5, height * 0.8)
      ..quadraticBezierTo(width * 0.25, height * 0.7, 0, height * 0.8)
      ..close();
    
    canvas.drawPath(pinkPath, pinkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}