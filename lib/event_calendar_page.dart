// event_calendar_page.dart
import 'package:flutter/material.dart';
import 'wave_painter.dart';


class EventCalendarPage extends StatefulWidget {
  final VoidCallback onBack;
  
  const EventCalendarPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<EventCalendarPage> createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  String selectedEvent = 'Select an event';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8DFC0), // Beige/cream background
      body: Stack(
        children: [
          // Bottom wave decoration
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 250),
              painter: WavePainter(),
            ),
          ),
          
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with back button
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Event Calendar',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A1033), // Dark navy text
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.calendar_today,
                              color: const Color(0xFF0A1033),
                              size: 28,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: widget.onBack,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB86CA3), // Purple color
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: const Text(
                            'back',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Upcoming event card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1033), // Dark navy
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Upcoming event:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Mastering Economics: Macro&Micro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Venue: Hilton Garden Inn',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Calendar illustration
                  Center(
                    child: Container(
                      width: 280,
                      height: 280,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB86CA3), // Purple
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomPaint(
                        size: const Size(250, 250),
                        painter: CalendarPainter(),
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Event selection dropdown
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownButton<String>(
                      value: selectedEvent,
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedEvent = newValue;
                          });
                        }
                      },
                      items: <String>[
                        'Select an event',
                        'Mastering Economics: Macro&Micro',
                        'Career Fair 2025',
                        'Resume Workshop',
                        'Interview Skills Training'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Sign up button
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Sign up logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF0A1033),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Sign up!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Calendar Painter for Event Calendar
class CalendarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    
    // Draw calendar background
    final bgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, width, height),
        const Radius.circular(10),
      ),
      bgPaint,
    );
    
    // Draw calendar binding
    final bindingPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Draw binding rings
    for (int i = 0; i < 9; i++) {
      final x = width * (i + 1) / 10;
      
      // Ring
      canvas.drawCircle(
        Offset(x, 15),
        5,
        bindingPaint,
      );
      
      // Hole
      canvas.drawCircle(
        Offset(x, 15),
        3,
        Paint()..color = Colors.white,
      );
    }
    
    // Draw month header
    final headerPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(10, 30, width - 20, 30),
      headerPaint,
    );
    
    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    
    // Horizontal lines
    for (int i = 0; i <= 6; i++) {
      final y = 60 + i * (height - 70) / 6;
      canvas.drawLine(
        Offset(10, y),
        Offset(width - 10, y),
        gridPaint,
      );
    }
    
    // Vertical lines
    for (int i = 0; i <= 7; i++) {
      final x = 10 + i * (width - 20) / 7;
      canvas.drawLine(
        Offset(x, 60),
        Offset(x, height - 10),
        gridPaint,
      );
    }
    
    // Draw some event text
    _drawEventText(canvas, 'Econ Test', 3, 2, width, height);
    _drawEventText(canvas, 'Career Fair', 5, 4, width, height);
    _drawEventText(canvas, 'Macro Exam', 2, 5, width, height);
    _drawEventText(canvas, 'Resume Workshop', 6, 3, width, height);
  }
  
  void _drawEventText(Canvas canvas, String text, int col, int row, double width, double height) {
    final cellWidth = (width - 20) / 7;
    final cellHeight = (height - 70) / 6;
    
    final x = 10 + (col - 1) * cellWidth + 2;
    final y = 60 + (row - 1) * cellHeight + 2;
    
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 8,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout(maxWidth: cellWidth - 4);
    textPainter.paint(canvas, Offset(x, y));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}