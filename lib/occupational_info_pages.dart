import 'package:flutter/material.dart';
import 'wave_painter.dart';


class OccupationalInfoBase extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback? onGoBack;
  final bool showNextButton;
  final String occupationName;

  const OccupationalInfoBase({
    Key? key,
    required this.title,
    required this.content,
    required this.onBack,
    required this.onNext,
    this.onGoBack,
    this.showNextButton = true,
    required this.occupationName,
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
                          'Occupational\nInformation',
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
                  
                  const SizedBox(height: 20),
                  
                  // Occupation name display
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5EED5), // Lighter beige
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      occupationName.isEmpty ? 'Enter an occupation' : occupationName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0A1033),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Page title if provided
                  if (title.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB86CA3), // Purple color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 16),
                  
                  // Main content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: content,
                      ),
                    ),
                  ),
                  
                  // Navigation buttons
                  if (onGoBack != null || showNextButton)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (onGoBack != null)
                            ElevatedButton(
                              onPressed: onGoBack,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB86CA3), // Purple color
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: const Text('go back'),
                            ),
                          if (onGoBack != null && showNextButton)
                            const SizedBox(width: 20),
                          if (showNextButton)
                            ElevatedButton(
                              onPressed: onNext,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB86CA3), // Purple color
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: const Text('next page'),
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
}

// 1. Search/Enter Occupation Page
class OccupationalSearchPage extends StatefulWidget {
  final VoidCallback onBack;
  
  const OccupationalSearchPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<OccupationalSearchPage> createState() => _OccupationalSearchPageState();
}

class _OccupationalSearchPageState extends State<OccupationalSearchPage> {
  final TextEditingController _occupationController = TextEditingController();
  
  @override
  void dispose() {
    _occupationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: '',
      occupationName: '',
      onBack: widget.onBack,
      onNext: () {
        // Navigate to general info page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalGeneralInfoPage(
              onBack: widget.onBack,
              occupationName: _occupationController.text.isEmpty ? 'Industrial Engineering' : _occupationController.text,
            ),
          ),
        );
      },
      onGoBack: null, // No go back on first page
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter the occupation you want information about:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _occupationController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5EED5), // Lighter beige
              hintText: 'Enter an occupation',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Discover key details about the occupation, including:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 10),
          _buildBulletPoint('working conditions'),
          _buildBulletPoint('future trends'),
          _buildBulletPoint('required skills'),
          _buildBulletPoint('pros and cons'),
          _buildBulletPoint('how certain disabilities might impact the career'),
        ],
      ),
    );
  }
  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1033),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF0A1033),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. General Information Page
class OccupationalGeneralInfoPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalGeneralInfoPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'General Information',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // Navigate to working conditions page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalWorkingConditionsPage(
              onBack: onBack,
              occupationName: occupationName,
            ),
          ),
        );
      },
      onGoBack: () {
        // Go back to search page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(
            'Definition:',
            'Industrial engineers design, optimize, and implement systems that integrate people, materials, information, and equipment to improve efficiency and productivity.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Required Education:',
            'Bachelor\'s degree in Industrial Engineering or related fields.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Work Sectors:',
            'Public institutions, private companies, manufacturing, logistics, healthcare, consultancy.',
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.7), // Lighter purple
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF0A1033),
          ),
        ),
      ],
    );
  }
}

// 3. Working Conditions Page
class OccupationalWorkingConditionsPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalWorkingConditionsPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'Working Conditions',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // Navigate to future outlook page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalFutureOutlookPage(
              onBack: onBack,
              occupationName: occupationName,
            ),
          ),
        );
      },
      onGoBack: () {
        // Go back to general info page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(
            'Work Hours:',
            'Typically 40-45 hours per week (may vary by country).',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Work Environment:',
            'Mostly office-based; occasional field visits.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Flexibility:',
            'Some remote/hybrid positions available.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Physical Demands:',
            'Generally low, but may require occasional factory visits.',
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.7), // Lighter purple
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF0A1033),
          ),
        ),
      ],
    );
  }
}

// 4. Future Outlook Page
class OccupationalFutureOutlookPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalFutureOutlookPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'Future Outlook',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // Navigate to skills preparation page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalSkillsPreparationPage(
              onBack: onBack,
              occupationName: occupationName,
            ),
          ),
        );
      },
      onGoBack: () {
        // Go back to working conditions page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(
            'Trends:',
            'Increasing demand due to digital transformation, automation, and lean production.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'AI-Risk?',
            'No, expected to grow with tech integration.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'New Roles:',
            'Data-driven decision analyst, sustainability process engineer.',
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.7), // Lighter purple
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF0A1033),
          ),
        ),
      ],
    );
  }
}

// 5. Skills & Preparation Page
class OccupationalSkillsPreparationPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalSkillsPreparationPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'Skills & Preparation',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // Navigate to pros cons page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalProsConsPage(
              onBack: onBack,
              occupationName: occupationName,
            ),
          ),
        );
      },
      onGoBack: () {
        // Go back to future outlook page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(
            'Recommended Skills:',
            'Analytical thinking, systems design, project management, data analysis, communication.',
          ),
          const SizedBox(height: 20),
          _buildInfoSection(
            'Learning Resources:',
            '',
          ),
          _buildBulletPoint('Coursera – Industrial Engineering courses'),
          _buildBulletPoint('LinkedIn Learning – Project management and Lean Six Sigma'),
          _buildBulletPoint('Internship and co-op programs'),
        ],
      ),
    );
  }
  
  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.7), // Lighter purple
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (content.isNotEmpty)
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0A1033),
            ),
          ),
      ],
    );
  }
  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1033),
            ),
          ),
          Expanded(
            child: Text(
              text,
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

// 6. Pros & Cons Page
class OccupationalProsConsPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalProsConsPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'Pros & Cons',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // Navigate to private/public sectors page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OccupationalSectorsPage(
              onBack: onBack,
              occupationName: occupationName,
            ),
          ),
        );
      },
      onGoBack: () {
        // Go back to skills preparation page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProsCons('Diverse job opportunities (logistics, IT, health, etc.)', true),
          _buildProsCons('Can work in both private and public sectors', true),
          _buildProsCons('Can be stressful in fast-paced environments', false),
          _buildProsCons('Entry-level positions may be competitive', false),
        ],
      ),
    );
  }
  
  Widget _buildProsCons(String text, bool isPro) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isPro ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isPro ? '+' : '-',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
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

// 7. Private/Public Sectors Page
class OccupationalSectorsPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const OccupationalSectorsPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OccupationalInfoBase(
      title: 'Private/Public Sectors',
      occupationName: occupationName,
      onBack: onBack,
      onNext: () {
        // This is the last page, so we'll just go back to the menu
        Navigator.popUntil(context, ModalRoute.withName('/menu'));
      },
      showNextButton: false, // No next button on last page
      onGoBack: () {
        // Go back to pros cons page
        Navigator.pop(context);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectorSection(
            'Private Sector:',
            [
              'Work pace is usually faster and more intense.',
              'You often focus on project and process management, efficiency improvement, logistics, production planning, and data analysis.',
              'Career advancement is mostly performance-based.',
              'Salaries can be higher than in the public sector, especially in the beginning, but this depends on the company and industry.',
              'There\'s usually more flexibility and innovation, and entrepreneurship is more common.',
            ],
          ),
          const SizedBox(height: 20),
          _buildSectorSection(
            'Public Sector (Government):',
            [
              'Working hours are more regular (fixed schedule, weekends off).',
              'Tasks may involve bureaucratic work, statistical analysis, planning, resource management, and strategy development.',
              'Career progression depends on seniority and official exams.',
              'There is higher job security, but salaries are usually more stable and may increase slowly.',
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildSectorSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB86CA3).withOpacity(0.7), // Lighter purple
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...points.map((point) => _buildBulletPoint(point)).toList(),
      ],
    );
  }
  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1033),
            ),
          ),
          Expanded(
            child: Text(
              text,
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
