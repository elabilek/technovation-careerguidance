// counseling_page.dart
import 'package:flutter/material.dart';
import 'wave_painter.dart';

class CounselingPage extends StatelessWidget {
  final VoidCallback onBack;

  const CounselingPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

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
                        const Text(
                          'Counseling',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033), // Dark navy text
                          ),
                        ),
                        ElevatedButton(
                          onPressed: onBack,
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
                  
                  // Counseling options
                  Expanded(
                    child: ListView(
                      children: [
                        _buildCounselingOption(
                          title: 'Support for Remote Workers',
                          description: 'Help managing boundaries between work and life.',
                          onTap: () {
                            // Navigate to remote workers support page
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildCounselingOption(
                          title: 'Planning Support for Parents',
                          description: 'Tools for balancing work and family life.',
                          onTap: () {
                            // Navigate to parent support page
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildCounselingOption(
                          title: 'Disability-Based Career Guidence',
                          description: 'Suggests suitable jobs based on disability type.',
                          onTap: () {
                            // Navigate to disability guidance page
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildCounselingOption(
                          title: 'Work-Life Balance Tracker',
                          description: 'Tracks daily time spent on work, leisure, etc.',
                          onTap: () {
                            // Navigate to work-life balance tracker
                          },
                        ),
                      ],
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

  Widget _buildCounselingOption({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1033),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF0A1033),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
