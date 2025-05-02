// statistics_pages.dart
import 'package:flutter/material.dart';
import 'dart:math';

class StatisticsPage extends StatefulWidget {
  final VoidCallback onBack;

  const StatisticsPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String? selectedCountry;
  String? selectedOccupation;
  
  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'Japan',
    'Australia',
  ];
  
  final List<String> occupations = [
    'Computer Science',
    'Engineering',
    'Healthcare',
    'Education',
    'Finance',
    'Marketing',
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
                          'Statistics',
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
                  
                  const SizedBox(height: 30),
                  
                  // Country dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select a country'),
                        value: selectedCountry,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCountry = newValue;
                          });
                        },
                        items: countries.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Occupation dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select an occupation'),
                        value: selectedOccupation,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOccupation = newValue;
                          });
                        },
                        items: occupations.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Statistics details
                  const Text(
                    'Discover key details about the occupation, including...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Statistics options
                  _buildStatOption('Employment/Unemployment Rates'),
                  _buildStatOption('Average salary'),
                  _buildStatOption('Gender distribution'),
                  _buildStatOption('Retirement age'),
                  _buildStatOption('Maternity leave'),
                  
                  const Spacer(),
                  
                  // View statistics button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedCountry != null && selectedOccupation != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmploymentUnemploymentPage(
                                country: selectedCountry!,
                                occupation: selectedOccupation!,
                                onBack: () => Navigator.pop(context),
                                onGoToMenu: widget.onBack,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select both a country and an occupation'),
                              backgroundColor: Color(0xFFB86CA3),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2D3A6A), // Dark blue color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: const Text(
                        'View the statistics',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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
  
  Widget _buildStatOption(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Text(
            '•',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB86CA3),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0A1033),
            ),
          ),
        ],
      ),
    );
  }
}

// Employment & Unemployment Rates Page
class EmploymentUnemploymentPage extends StatefulWidget {
  final String country;
  final String occupation;
  final VoidCallback onBack;
  final VoidCallback onGoToMenu;

  const EmploymentUnemploymentPage({
    Key? key,
    required this.country,
    required this.occupation,
    required this.onBack,
    required this.onGoToMenu,
  }) : super(key: key);

  @override
  State<EmploymentUnemploymentPage> createState() => _EmploymentUnemploymentPageState();
}

class _EmploymentUnemploymentPageState extends State<EmploymentUnemploymentPage> {
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
                          'Statistics',
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
                  
                  // Category title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Employment&Unemployment Rates',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Unemployment Rates by Age title
                  Text(
                    'Unemployment Rates by Age for ${widget.occupation} in ${widget.country}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Pie chart
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomPaint(
                      painter: PieChartPainter(),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Employment Rates by Age title
                  Text(
                    'Employment Rates by Age for ${widget.occupation} in ${widget.country}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Bar chart
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomPaint(
                      painter: BarChartPainter(),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0A1033),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('go back'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenderDistributionPage(
                                country: widget.country,
                                occupation: widget.occupation,
                                onBack: () => Navigator.pop(context),
                                onGoToMenu: widget.onGoToMenu,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('next page'),
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
}

// Gender Distribution Page
class GenderDistributionPage extends StatefulWidget {
  final String country;
  final String occupation;
  final VoidCallback onBack;
  final VoidCallback onGoToMenu;

  const GenderDistributionPage({
    Key? key,
    required this.country,
    required this.occupation,
    required this.onBack,
    required this.onGoToMenu,
  }) : super(key: key);

  @override
  State<GenderDistributionPage> createState() => _GenderDistributionPageState();
}

class _GenderDistributionPageState extends State<GenderDistributionPage> {
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
                          'Statistics',
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
                  
                  // Category title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Gender Distribution',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Gender Distribution title
                  Text(
                    'Gender Distribution for ${widget.occupation} in ${widget.country}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Bar chart
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomPaint(
                      painter: GenderBarChartPainter(),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Maternity leave info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'maternity leave',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'In the U.S., there is no federal paid maternity leave, but under the Family and Medical Leave Act (FMLA), eligible employees can take up to 12 weeks of unpaid leave. However, some states like California, New York, and New Jersey have implemented paid leave programs with varying durations and pay rates.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0A1033),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('go back'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AverageSalariesPage(
                                country: widget.country,
                                occupation: widget.occupation,
                                onBack: () => Navigator.pop(context),
                                onGoToMenu: widget.onGoToMenu,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('next page'),
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
}

// Average Salaries Page
class AverageSalariesPage extends StatefulWidget {
  final String country;
  final String occupation;
  final VoidCallback onBack;
  final VoidCallback onGoToMenu;

  const AverageSalariesPage({
    Key? key,
    required this.country,
    required this.occupation,
    required this.onBack,
    required this.onGoToMenu,
  }) : super(key: key);

  @override
  State<AverageSalariesPage> createState() => _AverageSalariesPageState();
}

class _AverageSalariesPageState extends State<AverageSalariesPage> {
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
                          'Statistics',
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
                  
                  // Category title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Average Salaries',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Salary information
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salaries for ${widget.occupation.toLowerCase()} scientists in the United States vary based on experience, location, and industry. According to data from January 2025, the average annual salary is approximately \$125,000.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Experience Level title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Experience Level',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Experience levels
                  _buildExperienceLevel(
                    'Entry-Level (0-2 years)',
                    'Salaries typically range from \$70,000 to \$90,000 per year.',
                  ),
                  
                  const SizedBox(height: 10),
                  
                  _buildExperienceLevel(
                    'Mid-Career (3-5 years)',
                    'Salaries can increase to between \$90,000 and \$110,000 annually.',
                  ),
                  
                  const SizedBox(height: 10),
                  
                  _buildExperienceLevel(
                    'Senior-Level (6-10 years)',
                    'Experienced professionals may earn from \$120,000 to \$150,000 per year.',
                  ),
                  
                  const Spacer(),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0A1033),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('go back'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RetirementAgePage(
                                country: widget.country,
                                occupation: widget.occupation,
                                onBack: () => Navigator.pop(context),
                                onGoToMenu: widget.onGoToMenu,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('next page'),
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
  
  Widget _buildExperienceLevel(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '•',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB86CA3),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A1033),
                ),
              ),
              const SizedBox(height: 4),
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
      ],
    );
  }
}

// Retirement Age Page
class RetirementAgePage extends StatefulWidget {
  final String country;
  final String occupation;
  final VoidCallback onBack;
  final VoidCallback onGoToMenu;

  const RetirementAgePage({
    Key? key,
    required this.country,
    required this.occupation,
    required this.onBack,
    required this.onGoToMenu,
  }) : super(key: key);

  @override
  State<RetirementAgePage> createState() => _RetirementAgePageState();
}

class _RetirementAgePageState extends State<RetirementAgePage> {
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
                          'Statistics',
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
                  
                  // Category title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Average Retirement Age',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // General Workforce Trends
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'General Workforce Trends:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The average retirement age across all professions in the U.S. is approximately 62 years.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Science and Engineering Fields
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Science and Engineering Fields:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Research indicates that the mean age of scientists and engineers has been rising, with projections suggesting an increase of 2.3 years from the 2008 level of 45.6 years.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Software Engineering
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Software Engineering:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Observations within the software engineering community suggest that retirement often occurs between the late 50s and mid-60s.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0A1033),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
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
                          backgroundColor: Colors.white,
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
}

// Chart Painters
class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) * 0.4;
    
    // Define colors for pie segments
    final colors = [
      const Color(0xFF4285F4), // Blue
      const Color(0xFF34A853), // Green
      const Color(0xFFFBBC05), // Yellow
      const Color(0xFFEA4335), // Red
      const Color(0xFF673AB7), // Purple
    ];
    
    // Define pie segments in radians
    final segments = [
      0.25, // 25%
      0.20, // 20%
      0.30, // 30%
      0.15, // 15%
      0.10, // 10%
    ];
    
    // Draw pie chart
    double startAngle = 0;
    for (int i = 0; i < segments.length; i++) {
      final sweepAngle = segments[i] * 2 * pi;
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      
      startAngle += sweepAngle;
    }
    
    // Draw center circle 
    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius * 0.5, centerPaint);
    
    // Draw age labels
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    final labels = [
      'Age 18-25 years',
      'Age 26-35 years',
      'Age 36-45 years',
      'Age 46-55 years',
      'Age 55+ years',
    ];
    
    // Draw 1
    double legendY = size.height * 0.7;
    const double legendX = 20;
    const double legendSpacing = 20;
    
    for (int i = 0; i < labels.length; i++) {
      // Draw color box
      final boxPaint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      
      canvas.drawRect(
        Rect.fromLTWH(legendX, legendY, 10, 10),
        boxPaint,
      );
      
      // Draw label text
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 10,
        ),
      );
      
      textPainter.layout();
      textPainter.paint(canvas, Offset(legendX + 15, legendY));
      
      legendY += legendSpacing;
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final chartHeight = height * 0.7;
    final chartBottom = height * 0.8;
    
    // Define bar data
    final barData = [
      0.3, // 30%
      0.7, // 70%
      0.5, // 50%
      0.6, // 60%
      0.4, // 40%
    ];
    
    // Define colors
    final barColor = const Color(0xFF4285F4); // Blue
    
    // Draw axes
    final axesPaint = Paint()
      ..color = const Color(0xFF0A1033)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    // X-axis
    canvas.drawLine(
      Offset(20, chartBottom),
      Offset(width - 20, chartBottom),
      axesPaint,
    );
    
    // Y-axis
    canvas.drawLine(
      Offset(20, chartBottom),
      Offset(20, 20),
      axesPaint,
    );
    
    // Draw bars
    final barWidth = (width - 60) / barData.length;
    final barSpacing = 10.0;
    
    for (int i = 0; i < barData.length; i++) {
      final barHeight = chartHeight * barData[i];
      final barLeft = 30 + (i * (barWidth + barSpacing));
      
      final barPaint = Paint()
        ..color = barColor
        ..style = PaintingStyle.fill;
      
      canvas.drawRect(
        Rect.fromLTWH(barLeft, chartBottom - barHeight, barWidth - barSpacing, barHeight),
        barPaint,
      );
    }
    
    // Draw age labels
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    final labels = [
      '18-25',
      '26-35',
      '36-45',
      '46-55',
      '55+',
    ];
    
    for (int i = 0; i < labels.length; i++) {
      final barLeft = 30 + (i * (barWidth + barSpacing));
      
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          color: Color(0xFF0A1033),
          fontSize: 10,
        ),
      );
      
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(barLeft + (barWidth - barSpacing - textPainter.width) / 2, chartBottom + 5),
      );
    }
    
    // Draw legend
    final legendY = height * 0.9;
    
    // Employed
    final employedBoxPaint = Paint()
      ..color = barColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(width * 0.3, legendY, 10, 10),
      employedBoxPaint,
    );
    
    textPainter.text = const TextSpan(
      text: 'employed',
      style: TextStyle(
        color: Color(0xFF0A1033),
        fontSize: 10,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(canvas, Offset(width * 0.3 + 15, legendY));
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GenderBarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final chartHeight = height * 0.7;
    final chartBottom = height * 0.8;
    
    // Define bar data
    final malePercentage = 0.65; // 65%
    final femalePercentage = 0.35; // 35%
    
    // Define colors
    final maleColor = const Color(0xFF4285F4); // Blue
    final femaleColor = const Color(0xFF34A853); // Green
    
    // Draw axes
    final axesPaint = Paint()
      ..color = const Color(0xFF0A1033)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    // X-axis
    canvas.drawLine(
      Offset(20, chartBottom),
      Offset(width - 20, chartBottom),
      axesPaint,
    );
    
    // Y-axis
    canvas.drawLine(
      Offset(20, chartBottom),
      Offset(20, 20),
      axesPaint,
    );
    
    // Draw bars
    final barWidth = (width - 80) / 2;
    
    // Male bar
    final malePaint = Paint()
      ..color = maleColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(
        50,
        chartBottom - (chartHeight * malePercentage),
        barWidth,
        chartHeight * malePercentage,
      ),
      malePaint,
    );
    
    // Female bar
    final femalePaint = Paint()
      ..color = femaleColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(
        50 + barWidth + 20,
        chartBottom - (chartHeight * femalePercentage),
        barWidth,
        chartHeight * femalePercentage,
      ),
      femalePaint,
    );
    
    // Draw percentages
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    
    // Male percentage
    textPainter.text = TextSpan(
      text: '${(malePercentage * 100).toInt()}%',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        50 + (barWidth - textPainter.width) / 2,
        chartBottom - (chartHeight * malePercentage) + 10,
      ),
    );
    
    // Female percentage
    textPainter.text = TextSpan(
      text: '${(femalePercentage * 100).toInt()}%',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        50 + barWidth + 20 + (barWidth - textPainter.width) / 2,
        chartBottom - (chartHeight * femalePercentage) + 10,
      ),
    );
    
    // Draw legend
    final legendY = height * 0.9;
    
    // Male
    final maleBoxPaint = Paint()
      ..color = maleColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(width * 0.3, legendY, 10, 10),
      maleBoxPaint,
    );
    
    textPainter.text = const TextSpan(
      text: 'male',
      style: TextStyle(
        color: Color(0xFF0A1033),
        fontSize: 10,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(canvas, Offset(width * 0.3 + 15, legendY));
    
    // Female
    final femaleBoxPaint = Paint()
      ..color = femaleColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(
      Rect.fromLTWH(width * 0.6, legendY, 10, 10),
      femaleBoxPaint,
    );
    
    textPainter.text = const TextSpan(
      text: 'female',
      style: TextStyle(
        color: Color(0xFF0A1033),
        fontSize: 10,
      ),
    );
    
    textPainter.layout();
    textPainter.paint(canvas, Offset(width * 0.6 + 15, legendY));
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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