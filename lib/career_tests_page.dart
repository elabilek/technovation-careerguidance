// career_tests_page.dart (updated with Test 2 and Results)
import 'package:flutter/material.dart';
import 'wave_painter.dart';


class CareerTestsPage extends StatefulWidget {
  final VoidCallback onBack;
  
  const CareerTestsPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<CareerTestsPage> createState() => _CareerTestsPageState();
}

class _CareerTestsPageState extends State<CareerTestsPage> {
  // Simulate completed tests for demonstration
  bool test1Completed = false;
  bool test2Completed = false;
  
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
                          'Career Tests',
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
                  
                  const SizedBox(height: 40),
                  
                  // Test 1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Test 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                      const Text(
                        'Career Compatibility Test',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: test1Completed ? null : () {
                            // Navigate to Test 1
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CareerCompatibilityTestPage(
                                  onBack: () => Navigator.pop(context),
                                  onComplete: () {
                                    setState(() {
                                      test1Completed = true;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: test1Completed ? Colors.white : const Color(0xFFB86CA3),
                            foregroundColor: test1Completed ? Colors.grey : Colors.white,
                            disabledBackgroundColor: Colors.white,
                            disabledForegroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            test1Completed ? 'Completed' : 'Start',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (test1Completed)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text(
                              '(Your answers have been submitted)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Test 2
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Test 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                      const Text(
                        'Learning and Work Style Test',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: test1Completed && !test2Completed ? () {
                            // Navigate to Test 2
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LearningWorkStyleTestPage(
                                  onBack: () => Navigator.pop(context),
                                  onComplete: () {
                                    setState(() {
                                      test2Completed = true;
                                    });
                                  },
                                ),
                              ),
                            );
                          } : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: test2Completed ? Colors.white : const Color(0xFFB86CA3),
                            foregroundColor: test2Completed ? Colors.grey : Colors.white,
                            disabledBackgroundColor: Colors.white,
                            disabledForegroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            test2Completed ? 'Completed' : 'Start',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (test2Completed)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text(
                              '(Your answers have been submitted)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      if (!test1Completed && !test2Completed)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text(
                              '(This test will be activated after you complete Test 1)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Results button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (test1Completed && test2Completed) ? () {
                        // Navigate to Results page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CareerTestResultsPage(
                              onBack: () => Navigator.pop(context),
                            ),
                          ),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (test1Completed && test2Completed) ? const Color(0xFFB86CA3) : Colors.white,
                        foregroundColor: (test1Completed && test2Completed) ? Colors.white : Colors.grey,
                        disabledBackgroundColor: Colors.white,
                        disabledForegroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Results',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (!test1Completed || !test2Completed)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          '(You can see your results after taking the tests)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
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

// Career Compatibility Test Page (Test 1)
class CareerCompatibilityTestPage extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;
  
  const CareerCompatibilityTestPage({
    Key? key,
    required this.onBack,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<CareerCompatibilityTestPage> createState() => _CareerCompatibilityTestPageState();
}

class _CareerCompatibilityTestPageState extends State<CareerCompatibilityTestPage> {
  int _currentPage = 0;
  final List<Map<String, dynamic>> _testPages = [
    {
      'category': 'Work Environment',
      'questions': [
        {
          'question': 'Do you prefer working...',
          'options': ['in an office', 'remotely', 'in the field'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'Do you thrive in a...',
          'options': ['quiet and calm environment', 'dynamic and social workplace?'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Is ....... more suitable for you?',
          'options': ['physical activity', 'mental work'],
          'selected': <bool>[false, false],
        },
      ],
    },
    {
      'category': 'Work Style',
      'questions': [
        {
          'question': 'Do you prefer ...',
          'options': ['fixed working hours', 'flexible schedules'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you ...',
          'options': ['enjoy routine tasks', 'prefer a job where every day is different'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you ...',
          'options': ['like working independently', 'prefer being part of a team'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Would you rather ...',
          'options': ['take initiative', 'follow structured guidance'],
          'selected': <bool>[false, false],
        },
      ],
    },
    {
      'category': 'Job Content',
      'questions': [
        {
          'question': 'Are you more drawn to ...',
          'options': ['numbers, data, and analysis', 'creative processes'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you prefer... jobs?',
          'options': ['tech-heavy', 'low-tech'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you ...',
          'options': ['enjoy focusing on details', 'prefer seeing the bigger picture'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you prefer ...',
          'options': ['making quick decisions', 'conducting in-depth analysis'],
          'selected': <bool>[false, false],
        },
      ],
    },
    {
      'category': 'Social Interactions',
      'questions': [
        {
          'question': 'Do you ...',
          'options': ['want a job with constant human interaction', 'prefer working more independently'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you communicate better through...',
          'options': ['written means (reports, emails)', 'verbal communication (meetings, client interactions)'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you prefer ...',
          'options': ['directly helping people', 'contributing in an indirect way'],
          'selected': <bool>[false, false],
        },
      ],
    },
    {
      'category': 'Career Priorities',
      'questions': [
        {
          'question': 'Do you prioritize...',
          'options': ['work-life balance', 'career advancement'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Would you rather ...',
          'options': ['have a stable salary', 'take risks for a job you\'re passionate about'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you see yourself...',
          'options': ['working in a large company', 'running your own business'],
          'selected': <bool>[false, false],
        },
        {
          'question': 'Do you prefer careers that ...',
          'options': ['require extensive academic education', 'you can start quickly'],
          'selected': <bool>[false, false],
        },
      ],
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    final currentPageData = _testPages[_currentPage];
    final category = currentPageData['category'] as String;
    final questions = currentPageData['questions'] as List<Map<String, dynamic>>;
    
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
                  // Header
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Test 1-Career Compatibility Test',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0A1033),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Short notice: This test consists of 5 different categories, in total of 5 pages.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Category label
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3), // Purple color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_currentPage + 1}. $category',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'select from the choices given',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Questions
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < questions.length; i++)
                            _buildQuestionSection(questions[i], i),
                        ],
                      ),
                    ),
                  ),
                  
                  // Navigation buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_currentPage > 0)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentPage--;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB86CA3).withOpacity(0.7),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: const Text('go back'),
                          ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _testPages.length - 1) {
                              setState(() {
                                _currentPage++;
                              });
                            } else {
                              // Submit test
                              widget.onComplete();
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB86CA3).withOpacity(0.7),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: Text(_currentPage < _testPages.length - 1 ? 'next page' : 'submit'),
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
  
  Widget _buildQuestionSection(Map<String, dynamic> questionData, int questionIndex) {
    final question = questionData['question'] as String;
    final options = questionData['options'] as List<String>;
    final selected = questionData['selected'] as List<bool>;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < options.length; i++)
            _buildCheckboxOption(options[i], selected[i], (value) {
              setState(() {
                // Reset all options for this question
                for (int j = 0; j < selected.length; j++) {
                  selected[j] = false;
                }
                // Set the selected option
                selected[i] = value ?? false;
              });
            }),
        ],
      ),
    );
  }
  
  Widget _buildCheckboxOption(String text, bool isChecked, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: const Color(0xFF0A1033),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF0A1033),
            ),
          ),
        ),
      ],
    );
  }
}

// Learning and Work Style Test Page (Test 2)
class LearningWorkStyleTestPage extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;
  
  const LearningWorkStyleTestPage({
    Key? key,
    required this.onBack,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<LearningWorkStyleTestPage> createState() => _LearningWorkStyleTestPageState();
}

class _LearningWorkStyleTestPageState extends State<LearningWorkStyleTestPage> {
  int _currentPage = 0;
  final List<Map<String, dynamic>> _testPages = [
    {
      'category': 'Skills and Abilities',
      'questions': [
        {
          'question': 'I enjoy solving mentally challenging problems',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I can easily understand spatial relationships and directions',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'Following a rhythm or learning a musical instrument feels natural to me',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I\'m usually good at understanding people\'s emotional states in social settings',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I feel comfortable expressing my thoughts in writing',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I\'m good at organizing tasks and managing my time',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
      ],
    },
    {
      'category': 'Interests and Characteristics',
      'questions': [
        {
          'question': 'I enjoy physical activities such as sports, dance, or hiking',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'Spending time in nature (e.g., hiking, caring for animals) makes me feel good',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I quickly learn how to use new technology and digital tools',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I like drawing, designing, or working with visual elements',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I\'m interested in art, design, or creative expression',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I like exploring how things work, and I enjoy analyzing processes',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
      ],
    },
    {
      'category': 'Learning Style',
      'questions': [
        {
          'question': 'I feel excited when I learn something new or explore ideas',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I enjoy taking leadership roles and making decisions',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I\'m interested in practical, hands-on activities',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I feel fulfilled when I help others or improve their situations',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I enjoy creative tasks involving imagination and coming up with solutions to social problems',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I\'m interested in protecting nature and the environment',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
      ],
    },
    {
      'category': 'Learning Style',
      'questions': [
        {
          'question': 'I care about thoroughness and being exact',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I learn best by doing and through experiences',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I remember things more easily when I write them down',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I learn best by trying and through experiences',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I enjoy learning on my own and working independently',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
      ],
    },
    {
      'category': 'Learning Style',
      'questions': [
        {
          'question': 'I prefer learning with others through group activities and discussions',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'Diagrams, charts, and visuals help me learn better',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I remember things more easily when I hear them',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I learn best by trying and through experiences',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
        {
          'question': 'I relate to learning through stories, metaphors, and experiences',
          'options': ['Yes', 'Not Sure', 'No'],
          'selected': <bool>[false, false, false],
        },
      ],
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    final currentPageData = _testPages[_currentPage];
    final category = currentPageData['category'] as String;
    final questions = currentPageData['questions'] as List<Map<String, dynamic>>;
    
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
                  // Header
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Test 2-Learning and Work Style Test',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0A1033),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Short notice: This test consists of 5 different categories, in total of 5 pages.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Category label
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3), // Purple color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_currentPage + 1}. $category',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'select from the choices given',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Questions
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < questions.length; i++)
                            _buildQuestionSection(questions[i], i),
                        ],
                      ),
                    ),
                  ),
                  
                  // Navigation buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_currentPage > 0)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentPage--;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB86CA3).withOpacity(0.7),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: const Text('go back'),
                          ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _testPages.length - 1) {
                              setState(() {
                                _currentPage++;
                              });
                            } else {
                              // Submit test
                              widget.onComplete();
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB86CA3).withOpacity(0.7),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: Text(_currentPage < _testPages.length - 1 ? 'next page' : 'submit'),
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
  
  Widget _buildQuestionSection(Map<String, dynamic> questionData, int questionIndex) {
    final question = questionData['question'] as String;
    final options = questionData['options'] as List<String>;
    final selected = questionData['selected'] as List<bool>;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              for (int i = 0; i < options.length; i++)
                Expanded(
                  child: Row(
                    children: [
                      Radio<int>(
                        value: i,
                        groupValue: selected.indexOf(true) != -1 ? selected.indexOf(true) : null,
                        onChanged: (int? value) {
                          setState(() {
                            // Reset all options for this question
                            for (int j = 0; j < selected.length; j++) {
                              selected[j] = false;
                            }
                            // Set the selected option
                            if (value != null) {
                              selected[value] = true;
                            }
                          });
                        },
                        activeColor: const Color(0xFF0A1033),
                      ),
                      Text(
                        options[i],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// Career Test Results Page
class CareerTestResultsPage extends StatelessWidget {
  final VoidCallback onBack;
  
  const CareerTestResultsPage({
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
                  // Header
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Career Test Results',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1033),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Suitable professions
                  _buildResultSection(
                    'Some Professions That Are Suitable For You:',
                    [
                      'Data Analyst / Business Intelligence Specialist',
                      'Psychologist / Therapist or Clinician',
                      'UX/UI Designer / Web Developer',
                      'Librarian / Archivist / Information Specialist',
                    ],
                    true,
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Not suitable professions
                  _buildResultSection(
                    'Some Professions That Are Not Suitable For You:',
                    [
                      'Construction Worker / Carpenter / Mechanic',
                      'Sales Executive / Sales Engineer',
                      'Real Estate Agent / Event Planner',
                      'Public Relations / Marketing Specialist',
                      'Entrepreneur / Startup Founder',
                    ],
                    false,
                  ),
                  
                  const Spacer(),
                  
                  // Back to menu button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate back to menu
                        Navigator.popUntil(context, ModalRoute.withName('/menu'));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFB86CA3).withOpacity(0.7),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text('Click here to turn Back to the \'Menu\''),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Notice that these tests are just to guide, they might be incorrect.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildResultSection(String title, List<String> professions, bool isSuitable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1033),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFB86CA3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isSuitable ? 'Suitable' : 'Not Suitable',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              ' For You:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1033),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String profession in professions)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    '• $profession',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}