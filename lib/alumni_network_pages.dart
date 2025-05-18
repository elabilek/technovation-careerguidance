// alumni_network_pages.dart
import 'package:flutter/material.dart';
import 'wave_painter.dart';


//for all alumni network pages
class AlumniNetworkBase extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget content;
  final VoidCallback onBack;
  final String? occupationName;

  const AlumniNetworkBase({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.content,
    required this.onBack,
    this.occupationName,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A1033), // Dark navy text
                              ),
                            ),
                            if (subtitle.isNotEmpty)
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF0A1033),
                                ),
                              ),
                          ],
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
                  
                  // Occupation name display if provided
                  if (occupationName != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5EED5), // Lighter beige
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        occupationName!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 20),
                  
                  // Main content
                  Expanded(
                    child: content,
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

// Main Alumni Network Page
class AlumniNetworkPage extends StatefulWidget {
  final VoidCallback onBack;
  
  const AlumniNetworkPage({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<AlumniNetworkPage> createState() => _AlumniNetworkPageState();
}

class _AlumniNetworkPageState extends State<AlumniNetworkPage> {
  final TextEditingController _occupationController = TextEditingController();
  
  @override
  void dispose() {
    _occupationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AlumniNetworkBase(
      title: 'Alumni Network',
      onBack: widget.onBack,
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
              hintText: 'Enter an occupation...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 30),
          
          // Option buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOptionButton(
                'Group Video Sessions with Professionals',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupVideoSessionsPage(
                        onBack: widget.onBack,
                        occupationName: _occupationController.text.isEmpty 
                            ? 'Electrical Engineering' 
                            : _occupationController.text,
                      ),
                    ),
                  );
                },
                width: MediaQuery.of(context).size.width * 0.42,
                height: 100,
              ),
              _buildOptionButton(
                'Past Sessions with Professionals',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PastSessionsPage(
                        onBack: widget.onBack,
                        occupationName: _occupationController.text.isEmpty 
                            ? 'Electrical Engineering' 
                            : _occupationController.text,
                      ),
                    ),
                  );
                },
                width: MediaQuery.of(context).size.width * 0.42,
                height: 100,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: _buildOptionButton(
              'Career Forum',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CareerForumPage(
                      onBack: widget.onBack,
                      occupationName: _occupationController.text.isEmpty 
                          ? 'Electrical Engineering' 
                          : _occupationController.text,
                    ),
                  ),
                );
              },
              width: MediaQuery.of(context).size.width * 0.4,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildOptionButton(String text, {required VoidCallback onPressed, required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB86CA3), // Purple color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// Group Video Sessions Page
class GroupVideoSessionsPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const GroupVideoSessionsPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AlumniNetworkBase(
      title: 'Alumni Network',
      subtitle: 'Group Video Sessions with Professionals',
      onBack: onBack,
      occupationName: occupationName,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Session:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // Join video session logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB86CA3).withOpacity(0.8),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text('Click to join'),
          ),
          const SizedBox(height: 10),
          
          // Video preview
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFB86CA3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFB86CA3),
                width: 2,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/video_placeholder.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.videocam_off,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildVideoParticipant(),
                          const SizedBox(width: 50),
                          _buildVideoParticipant(),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          
          const Spacer(),
          
          // Next sessions info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Next Sessions:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1033),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Tuesday 8 April 14:30 GMT+3\nThursday 10 April 20:00 GMT+3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0A1033),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  
  Widget _buildVideoParticipant() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

// Past Sessions Page
class PastSessionsPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const PastSessionsPage({
    Key? key,
    required this.onBack,
    required this.occupationName,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AlumniNetworkBase(
      title: 'Alumni Network',
      subtitle: 'Past Sessions with Professionals',
      onBack: onBack,
      occupationName: occupationName,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Past Sessions by Month:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0A1033),
            ),
          ),
          const SizedBox(height: 10),
          
          // Grid of past sessions
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSessionsRow(context, 3),
                  const SizedBox(height: 15),
                  _buildSessionsRow(context, 3),
                  const SizedBox(height: 15),
                  _buildSessionsRow(context, 2),
                ],
              ),
            ),
          ),
          
          // Pagination dots
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB86CA3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        (i + 1).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '...',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB86CA3),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSessionsRow(BuildContext context, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        count,
        (index) => _buildSessionThumbnail(context),
      ),
    );
  }
  
  Widget _buildSessionThumbnail(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width - 60) / 3;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFB86CA3).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          9,
          (index) => Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Icon(
              Icons.person,
              size: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

// Career Forum Page
class CareerForumPage extends StatelessWidget {
  final VoidCallback onBack;
  final String occupationName;
  
  const CareerForumPage({
    Key? key,
    required this.onBack,
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
                          'Career Forum',
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
                      occupationName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0A1033),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Topic and ask button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Topic: Electrical Engineering/Circuits',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0A1033),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Ask question logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB86CA3), // Purple color
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text('Ask questions!'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Conversations header
                  const Text(
                    'Conversations',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0A1033),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Forum conversations
                  Expanded(
                    child: ListView(
                      children: [
                        _buildForumPost(
                          'CONSULTANT',
                          'How to become an electrical engineer?',
                          'March 4, 2025',
                          Colors.orange,
                        ),
                        _buildForumPost(
                          'NEWBIE',
                          'I am stuck with these GND cables. HELP!!!',
                          'March 5, 2025',
                          Colors.green,
                        ),
                        _buildForumPost(
                          'STUDENT',
                          'Guys, which resistors should I use for this circuit?',
                          'March 6, 2025',
                          Colors.blue,
                        ),
                        _buildForumPost(
                          'ENGINEER',
                          'How can I turn this parallel circuit into a short?',
                          'March 7, 2025',
                          Colors.purple,
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
  
  Widget _buildForumPost(String userType, String question, String date, Color avatarColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EED5).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userType,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1033),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0A1033),
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
