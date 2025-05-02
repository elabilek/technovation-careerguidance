// menu_page.dart
import 'package:flutter/material.dart';
// Import the correct statistics file - fixing the URI error
import 'statistics_page.dart'; // Changed from statistics_pages.dart
import 'profile_page.dart';
import 'career_tests_page.dart';
import 'occupational_info_pages.dart';
import 'alumni_network_pages.dart';
import 'counseling_page.dart';
import 'event_calendar_page.dart';
import 'skill_development_calendar_page.dart';
import 'un_info_page.dart';
import 'digital_diary_page.dart';
import 'inspirational_career_journeys_page.dart';
import 'career_simulations_page.dart';
// Removed wave_painter.dart import as it's unused

class MenuPage extends StatelessWidget {
  // Fixed the key parameter to use super parameter
  const MenuPage({super.key});

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
                  // Header with settings button
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033), // Dark navy text
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.settings,
                                color: Color(0xFF0A1033),
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/settings');
                              },
                            ),
                            const Text(
                              'settings',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF0A1033),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Menu buttons in a scrollable list
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMenuButton(
                            'Profile', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Career Tests', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CareerTestsPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Occupational Information', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OccupationalSearchPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
  'Statistics',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsPage(
          onBack: () => Navigator.pop(context),
        ),
      ),
    );
  },
),

                          _buildMenuButton(
                            'Alumni Network', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlumniNetworkPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Counseling', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CounselingPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Event Calendar', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventCalendarPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Skill Development Calendar', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SkillDevelopmentCalendarPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Career Simulations', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CareerSimulationsPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'UN Info Page', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UNInfoPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Digital Diary', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DigitalDiaryPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          _buildMenuButton(
                            'Inspiring Career Journeys', 
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InspirationalCareerJourneysPage(
                                    onBack: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            }
                          ),
                          const SizedBox(height: 100), // Extra space at bottom
                        ],
                      ),
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

  Widget _buildMenuButton(String text, {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB86CA3), // Purple color
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Including the WavePainter class since it's used in the code
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFB86CA3) // Purple color for the top wave
      ..style = PaintingStyle.fill;
    
    // Draw the top (purple) wave
    final topPath = Path();
    topPath.moveTo(0, size.height * 0.7);
    topPath.quadraticBezierTo(
      size.width * 0.25, size.height * 0.5,
      size.width * 0.5, size.height * 0.7
    );
    topPath.quadraticBezierTo(
      size.width * 0.75, size.height * 0.9,
      size.width, size.height * 0.7
    );
    topPath.lineTo(size.width, size.height);
    topPath.lineTo(0, size.height);
    topPath.close();
    
    canvas.drawPath(topPath, paint);
    
    // Draw the bottom (dark blue) wave
    paint.color = const Color(0xFF2D3A6A); // Dark blue color for the bottom wave
    
    final bottomPath = Path();
    bottomPath.moveTo(0, size.height * 0.8);
    bottomPath.quadraticBezierTo(
      size.width * 0.2, size.height * 0.95,
      size.width * 0.5, size.height * 0.8
    );
    bottomPath.quadraticBezierTo(
      size.width * 0.8, size.height * 0.65,
      size.width, size.height * 0.8
    );
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();
    
    canvas.drawPath(bottomPath, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}