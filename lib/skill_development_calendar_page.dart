// skill_development_calendar_page.dart
import 'package:flutter/material.dart';
import 'wave_painter.dart';

class SkillDevelopmentCalendarPage extends StatefulWidget {
  final VoidCallback onBack;

  const SkillDevelopmentCalendarPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<SkillDevelopmentCalendarPage> createState() => _SkillDevelopmentCalendarPageState();
}

class _SkillDevelopmentCalendarPageState extends State<SkillDevelopmentCalendarPage> {
  String? selectedMajor;
  String timeGoal = 'monthly';
  
  final List<String> majors = [
    'Creative and design-related occupations',
    'Computer Science',
    'Engineering',
    'Business',
    'Healthcare',
    'Education',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header with back button
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Welcome to the\nSkill Development Calendar',
                          style: TextStyle(
                            fontSize: 24,
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
                  
                  const SizedBox(height: 30),
                  
                  // Major selection
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Choose your related major'),
                              value: selectedMajor,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMajor = newValue;
                                });
                              },
                              items: majors.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Time goal selection
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Set your time goal!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 10),
                        
                        // Time goal checkboxes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTimeGoalCheckbox('weekly', 'weekly'),
                            _buildTimeGoalCheckbox('monthly', 'monthly'),
                            _buildTimeGoalCheckbox('yearly', 'yearly'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Next page button
                  ElevatedButton(
                    onPressed: () {
                      if (selectedMajor != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonthlyCalendarPage(
                              major: selectedMajor!,
                              timeGoal: timeGoal,
                              onBack: () => Navigator.pop(context),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a major'),
                            backgroundColor: Color(0xFFB86CA3),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A1033), // Dark blue color
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      minimumSize: const Size(200, 45),
                    ),
                    child: const Text(
                      'next page',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 100), // Extra space at bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTimeGoalCheckbox(String value, String label) {
    return Row(
      children: [
        Checkbox(
          value: timeGoal == value,
          onChanged: (bool? selected) {
            if (selected == true) {
              setState(() {
                timeGoal = value;
              });
            }
          },
          activeColor: const Color(0xFF0A1033),
          checkColor: Colors.white,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// Monthly Calendar Page
class MonthlyCalendarPage extends StatefulWidget {
  final String major;
  final String timeGoal;
  final VoidCallback onBack;

  const MonthlyCalendarPage({
    Key? key,
    required this.major,
    required this.timeGoal,
    required this.onBack,
  }) : super(key: key);

  @override
  State<MonthlyCalendarPage> createState() => _MonthlyCalendarPageState();
}

class _MonthlyCalendarPageState extends State<MonthlyCalendarPage> {
  final List<bool> taskCompleted = [false, false, false, false];

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
                          'Skill Development Calendar',
                          style: TextStyle(
                            fontSize: 24,
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
                  
                  // Major info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1033),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'related major type: ${widget.major}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 5),
                  
                  // Time goal info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1033),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'time goal type: ${widget.timeGoal}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // This month's skill
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'This months skill: Learning Figma&Photoshop',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // April 2025 tasks
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'April, 2025',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Task 1
                        _buildTask(
                          'Watch videos related to Figma.',
                          0,
                        ),
                        
                        const SizedBox(height: 10),
                        
                        // Task 2
                        _buildTask(
                          'Practice assigned designs to practice',
                          1,
                        ),
                        
                        const SizedBox(height: 10),
                        
                        // Task 3
                        _buildTask(
                          'Watch videos related to Photoshop.',
                          2,
                        ),
                        
                        const SizedBox(height: 10),
                        
                        // Task 4
                        _buildTask(
                          'Practice the sample design.\nEdit the photo given by following the criteria.',
                          3,
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Checklist
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Checklist:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            for (int i = 0; i < 4; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: taskCompleted[i]
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Color(0xFF0A1033),
                                        )
                                      : null,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // See past assignments button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PastAssignmentsPage(
                              onBack: () => Navigator.pop(context),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF0A1033),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        minimumSize: const Size(250, 45),
                      ),
                      child: const Text(
                        'see the past assignments',
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
  
  Widget _buildTask(String text, int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF0A1033),
              ),
            ),
          ),
          Checkbox(
            value: taskCompleted[index],
            onChanged: (bool? value) {
              setState(() {
                taskCompleted[index] = value ?? false;
              });
            },
            activeColor: const Color(0xFF0A1033),
            checkColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Past Assignments Page
class PastAssignmentsPage extends StatelessWidget {
  final VoidCallback onBack;

  const PastAssignmentsPage({
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
                          'Skill Development Calendar',
                          style: TextStyle(
                            fontSize: 24,
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
                  
                  const SizedBox(height: 20),
                  
                  // Past Assignments title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Past Assignments',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // March 2025
                  _buildCompletedMonth('March, 2025'),
                  
                  const SizedBox(height: 20),
                  
                  // February 2025
                  _buildCompletedMonth('February, 2025'),
                  
                  const SizedBox(height: 20),
                  
                  // January 2025
                  _buildCompletedMonth('January, 2025'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCompletedMonth(String month) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFB86CA3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            month,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}