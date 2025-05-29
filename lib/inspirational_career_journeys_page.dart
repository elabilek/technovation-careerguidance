import 'package:flutter/material.dart';
import 'wave_painter.dart';

class InspirationalCareerJourneysPage extends StatelessWidget {
  final VoidCallback onBack;

  const InspirationalCareerJourneysPage({
    Key? key, // Keeping original key parameter
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
                        const Expanded(
                          child: Text(
                            'Inspirational Career Journeys',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A1033), // Dark navy text
                            ),
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
                  
                  const SizedBox(height: 10),
                  
                  // Today's Journey subtitle
                  const Center(
                    child: Text(
                      'Today\'s Journey',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0A1033),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Featured person banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Meet Dr. Ceyda Açılan Ayhan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Profile content
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile image and text side by side - FIXED VERSION
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text content
                                const Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Dr. Ceyda Açılan Ayhan is a pioneering cancer researcher at Koç University School of Medicine. With a PhD from the University of Pittsburgh, Dr. Ayhan focuses on understanding how',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0A1033),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                
                                const SizedBox(width: 10),
                                
                                // Profile image - Simplified approach
                                Container(
                                  width: 100, // Fixed width
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: NetworkImage('https://kuttam.ku.edu.tr/wp-content/uploads/2020/03/ceyda-a%C3%A7%C4%B1lan-2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.grey.withOpacity(0.3), // Fallback color
                                  ),
                                  child: const SizedBox(), // Empty SizedBox to ensure the container is rendered
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 15),
                            
                            // Continuation of the bio
                            const Text(
                              'cancer cells evade death by clustering extra centrosomes and developing resistance to drugs through epigenetic changes. Her lab investigates innovative strategies to target these mechanisms, aiming to selectively eliminate cancer cells while sparing healthy tissue. Her journey exemplifies the power of scientific curiosity and determination in advancing cancer treatment.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF0A1033),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
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
}
