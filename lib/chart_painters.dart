import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChartPainter extends CustomPainter {
  final String? title;
  
  PieChartPainter({this.title});
  
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 * 0.8;
    
    final paint = Paint()
      ..style = PaintingStyle.fill;
    
    // pie chart segments with colors and angles
    final segments = [
      {'color': const Color(0xFF5B9BD5), 'startAngle': 0.0, 'sweepAngle': 0.5},
      {'color': const Color(0xFFED7D31), 'startAngle': 0.5, 'sweepAngle': 0.7},
      {'color': const Color(0xFF70AD47), 'startAngle': 1.2, 'sweepAngle': 0.6},
      {'color': const Color(0xFFA5A5A5), 'startAngle': 1.8, 'sweepAngle': 0.4},
      {'color': const Color(0xFFB86CA3), 'startAngle': 2.2, 'sweepAngle': 0.5},
    ];
    
   
    for (final segment in segments) {
      paint.color = segment['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        (segment['startAngle'] as double) * math.pi,
        (segment['sweepAngle'] as double) * math.pi,
        true,
        paint,
      );
    }
    
    _drawAgeLabels(canvas, size, center, radius);
    
    // Add title if provided
    if (title != null) {
      _drawTitle(canvas, size, title!);
    }
  }
  
  void _drawAgeLabels(Canvas canvas, Size size, Offset center, double radius) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    final labels = [
      {'text': 'Age: 20-29 years', 'angle': 0.25, 'distance': 0.6},
      {'text': 'Age: 30-39 years', 'angle': 0.85, 'distance': 0.6},
      {'text': 'Age: 40-49 years', 'angle': 1.5, 'distance': 0.6},
      {'text': 'Age: 50-59 years', 'angle': 2.0, 'distance': 0.6},
      {'text': 'Age: 60+ years', 'angle': 2.45, 'distance': 0.6},
    ];
    
    for (final label in labels) {
      final angle = (label['angle'] as double) * math.pi;
      final distance = label['distance'] as double;
      
      final x = center.dx + math.cos(angle) * radius * distance;
      final y = center.dy + math.sin(angle) * radius * distance;
      
      textPainter.text = TextSpan(
        text: label['text'] as String,
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 10,
        ),
      );
      
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }
  
  void _drawTitle(Canvas canvas, Size size, String title) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, 10),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BarChartPainter extends CustomPainter {
  final String? title;
  
  BarChartPainter({this.title});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;
    
    final chartWidth = size.width * 0.8;
    final chartHeight = size.height * 0.7;
    final left = (size.width - chartWidth) / 2;
    final top = size.height * 0.1;
    
    // Draw title if provided
    if (title != null) {
      _drawTitle(canvas, size, title!);
    }
    
    // Draw axes
    paint.color = const Color(0xFF0A1033);
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    
    // X-axis
    canvas.drawLine(
      Offset(left, top + chartHeight),
      Offset(left + chartWidth, top + chartHeight),
      paint,
    );
    
    // Y-axis
    canvas.drawLine(
      Offset(left, top),
      Offset(left, top + chartHeight),
      paint,
    );
    
    // Draw bars
    paint.style = PaintingStyle.fill;
    
    // Define bar data: height percentages for women and men across age groups
    final barData = [
      {'women': 0.3, 'men': 0.4},
      {'women': 0.6, 'men': 0.7},
      {'women': 0.5, 'men': 0.6},
    ];
    
    final barWidth = chartWidth / (barData.length * 2 + 1);
    final spacing = barWidth / 2;
    
    for (int i = 0; i < barData.length; i++) {
      // Women bar (blue)
      paint.color = const Color(0xFF5B9BD5);
      final womenHeight = barData[i]['women']! * chartHeight;
      canvas.drawRect(
        Rect.fromLTWH(
          left + spacing + (barWidth * 2 + spacing) * i,
          top + chartHeight - womenHeight,
          barWidth,
          womenHeight,
        ),
        paint,
      );
      
      // Men bar (navy)
      paint.color = const Color(0xFF0A1033);
      final menHeight = barData[i]['men']! * chartHeight;
      canvas.drawRect(
        Rect.fromLTWH(
          left + spacing + barWidth + (barWidth * 2 + spacing) * i,
          top + chartHeight - menHeight,
          barWidth,
          menHeight,
        ),
        paint,
      );
    }
    
    // Add x-axis labels
    _drawXAxisLabels(canvas, size, left, top, chartWidth, chartHeight);
    
    // Add legend
    _drawLegend(canvas, size, left, top);
  }
  
  void _drawTitle(Canvas canvas, Size size, String title) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, 5),
    );
  }
  
  void _drawXAxisLabels(Canvas canvas, Size size, double left, double top, double chartWidth, double chartHeight) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    final labels = [
      '18-24 years',
      '25-49 years',
      '50-64 years',
    ];
    
    for (int i = 0; i < labels.length; i++) {
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 10,
        ),
      );
      
      textPainter.layout();
      
      final x = left + (chartWidth / labels.length) * (i + 0.5) - textPainter.width / 2;
      final y = top + chartHeight + 5;
      
      textPainter.paint(canvas, Offset(x, y));
    }
  }
  
  void _drawLegend(Canvas canvas, Size size, double left, double top) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    final paint = Paint()
      ..style = PaintingStyle.fill;
    
    // Women legend
    paint.color = const Color(0xFF5B9BD5);
    canvas.drawRect(
      Rect.fromLTWH(left, top + size.height * 0.85, 10, 10),
      paint,
    );
    
    textPainter.text = const TextSpan(
      text: 'women',
      style: TextStyle(
        color: Color(0xFF0A1033),
        fontSize: 10,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(canvas, Offset(left + 15, top + size.height * 0.85));
    
    // Men legend
    paint.color = const Color(0xFF0A1033);
    canvas.drawRect(
      Rect.fromLTWH(left + 70, top + size.height * 0.85, 10, 10),
      paint,
    );
    
    textPainter.text = const TextSpan(
      text: 'men',
      style: TextStyle(
        color: Color(0xFF0A1033),
        fontSize: 10,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(canvas, Offset(left + 85, top + size.height * 0.85));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
