// main.dart
import 'package:flutter/material.dart';
import 'menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Guidance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB86CA3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB86CA3),
          primary: const Color(0xFFB86CA3),
          secondary: const Color(0xFF2D3A6A),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const WelcomePage(),
      routes: {
        '/menu': (context) => const MenuPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Auto-navigate to menu page after a short delay (splash screen effect)
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8DFC0), // Beige/cream background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFB86CA3),
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(
                Icons.work_outline,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // App name
            const Text(
              'Career Guidance',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A1033),
              ),
            ),
            const SizedBox(height: 10),
            // App tagline
            const Text(
              'Plan your future with confidence',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0A1033),
              ),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB86CA3)),
            ),
          ],
        ),
      ),
    );
  }
}

// Simple settings page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8DFC0),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFFB86CA3),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingItem(
            'Account',
            'Manage your profile and account settings',
            Icons.person,
            onTap: () {},
          ),
          _buildSettingItem(
            'Notifications',
            'Configure app notifications',
            Icons.notifications,
            onTap: () {},
          ),
          _buildSettingItem(
            'Appearance',
            'Customize app appearance',
            Icons.color_lens,
            onTap: () {},
          ),
          _buildSettingItem(
            'Privacy',
            'Manage your privacy settings',
            Icons.privacy_tip,
            onTap: () {},
          ),
          _buildSettingItem(
            'Help & Support',
            'Get help or contact support',
            Icons.help,
            onTap: () {},
          ),
          _buildSettingItem(
            'About',
            'Learn more about the app',
            Icons.info,
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Log out functionality would go here
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D3A6A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, IconData icon, {required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFB86CA3)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A1033),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: const Color(0xFF0A1033).withOpacity(0.7),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}