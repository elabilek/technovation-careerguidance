// digital_diary_page.dart
import 'package:flutter/material.dart';
import 'wave_painter.dart';

class DigitalDiaryPage extends StatefulWidget {
  final VoidCallback onBack;

  const DigitalDiaryPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<DigitalDiaryPage> createState() => _DigitalDiaryPageState();
}

class _DigitalDiaryPageState extends State<DigitalDiaryPage> {
  final TextEditingController _newEntryController = TextEditingController();
  final List<DiaryEntry> _entries = [
    DiaryEntry(
      date: DateTime(2025, 3, 28),
      content: 'Hi, I learned how to use Figma today. I really enjoyed it.',
    ),
    DiaryEntry(
      date: DateTime(2025, 1, 2),
      content: 'Me again. I submitted my application today.',
    ),
    DiaryEntry(
      date: DateTime(2025, 12, 27),
      content: 'I think I am between two majors. I haven\'t decided yet.',
    ),
    DiaryEntry(
      date: DateTime(2025, 12, 13),
      content: 'We had a ball that took place in our school today, I really had fun.',
    ),
  ];

  @override
  void dispose() {
    _newEntryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get current date
    final now = DateTime.now();
    final today = '${now.day} ${_getMonthName(now.month)} ${now.year}';

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
                        const Text(
                          'Digital Diary',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033), // Dark navy text
                          ),
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
                  
                  const SizedBox(height: 10),
                  
                  // Today's date
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Today is $today',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFB86CA3),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // New entry field
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _newEntryController,
                            decoration: const InputDecoration(
                              hintText: 'New entry...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0A1033),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_newEntryController.text.isNotEmpty) {
                              setState(() {
                                _entries.insert(
                                  0,
                                  DiaryEntry(
                                    date: DateTime.now(),
                                    content: _newEntryController.text,
                                  ),
                                );
                                _newEntryController.clear();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB86CA3),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          ),
                          child: const Text('done'),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Diary entries
                  Expanded(
                    child: ListView.builder(
                      itemCount: _entries.length,
                      itemBuilder: (context, index) {
                        final entry = _entries[index];
                        final date = '${entry.date.day} ${_getMonthName(entry.date.month)} ${entry.date.year}';
                        
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Date
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFB86CA3),
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: 5),
                            
                            // Entry content
                            Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                entry.content,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF0A1033),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}

class DiaryEntry {
  final DateTime date;
  final String content;

  DiaryEntry({
    required this.date,
    required this.content,
  });
}