import 'package:flutter/material.dart';
import 'wave_painter.dart';

class CareerSimulationsPage extends StatefulWidget {
  final VoidCallback onBack;

  const CareerSimulationsPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<CareerSimulationsPage> createState() => _CareerSimulationsPageState();
}

class _CareerSimulationsPageState extends State<CareerSimulationsPage> {
  String selectedProfession = 'Graphic Designer';
  
  final List<String> professions = [
    'Graphic Designer',
    'Software Engineer',
    'Data Scientist',
    'Marketing Manager',
    'Financial Analyst',
    'Teacher',
    'Healthcare Professional',
  ];

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
                          'Career\nSimulations',
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
                  
                  const SizedBox(height: 20),
                  
                  // Profession dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedProfession,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedProfession = newValue;
                            });
                          }
                        },
                        items: professions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // A Day in the Life title
                  const Text(
                    '🎨 A Day in the Life of a Graphic Designer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Schedule
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTimeBlock(
                            '08:00 AM',
                            'Wake up and get ready for the day. Since you work remotely, you enjoy a calm breakfast before heading to your desk.',
                          ),
                          
                          _buildTimeBlock(
                            '09:00 AM',
                            'Team meeting (online). You discuss upcoming deadlines, client feedback, and your current design tasks.',
                          ),
                          
                          _buildTimeBlock(
                            '10:00 AM',
                            'Start working on visuals for a new social media campaign. You create a mood board, choose fonts, and plan color palettes.',
                          ),
                          
                          _buildTimeBlock(
                            '12:30 PM',
                            'Lunch break. You usually prepare something quick at home or take a short walk if the weather\'s nice.',
                          ),
                          
                          _buildTimeBlock(
                            '1:00 PM',
                            'Check revision requests from a client on a logo project. Some notes are unclear, so you send a follow-up email asking for clarification.',
                          ),
                          
                          _buildTimeBlock(
                            '2:00 PM',
                            'Browse platforms like Behance and Pinterest for inspiration. You keep an eye on current design trends.',
                          ),
                          
                          _buildTimeBlock(
                            '3:00 PM',
                            'Begin designing a YouTube channel banner for a client. You contact the video team to make sure your visuals match the video content.',
                          ),
                          
                          _buildTimeBlock(
                            '5:00 PM',
                            'Wrap up your work, organize files, and leave notes in the team workspace for the next day.',
                          ),
                          
                          _buildTimeBlock(
                            '6:00 PM',
                            'Time to relax! Sometimes, you take on freelance gigs in the evening for extra income or creative freedom.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Next page button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CareerSimulationVideosPage(
                              profession: selectedProfession,
                              onBack: () => Navigator.pop(context),
                              onGoToMenu: widget.onBack,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB86CA3),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: const Text(
                        'next page',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTimeBlock(String time, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1033),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF0A1033),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Career Simulation Videos Page
class CareerSimulationVideosPage extends StatefulWidget {
  final String profession;
  final VoidCallback onBack;
  final VoidCallback onGoToMenu;

  const CareerSimulationVideosPage({
    Key? key,
    required this.profession,
    required this.onBack,
    required this.onGoToMenu,
  }) : super(key: key);

  @override
  State<CareerSimulationVideosPage> createState() => _CareerSimulationVideosPageState();
}

class _CareerSimulationVideosPageState extends State<CareerSimulationVideosPage> {
  int selectedPage = 1;

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
                          'Career\nSimulations',
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
                  
                  const SizedBox(height: 20),
                  
                  // Day in the Life title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Day in the Life of a ${widget.profession}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Video 1
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A Day in the Life\nof a ${widget.profession}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Career Simulation Vlog',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.videocam,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Play video logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                            ),
                            child: const Text('Play'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Video 2
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inside a\n${widget.profession}\'s\nWorkday',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Career Simulation Vlog',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Container(
                            width: 120,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.videocam,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Play video logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                            ),
                            child: const Text('Play'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Page indicators
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPageIndicator(1),
                        _buildPageIndicator(2),
                        _buildPageIndicator(3),
                        const Text('...'),
                        _buildPageIndicator(9),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.7),
                          foregroundColor: const Color(0xFF0A1033),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('go back'),
                      ),
                      ElevatedButton(
                        onPressed: widget.onGoToMenu,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.7),
                          foregroundColor: const Color(0xFF0A1033),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('menu'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPageIndicator(int pageNumber) {
    final isSelected = pageNumber == selectedPage;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPage = pageNumber;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB86CA3) : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF0A1033),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
