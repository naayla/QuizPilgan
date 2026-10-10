import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'login_screen.dart';
import '../data/user_data.dart';

class DashboardScreen extends StatefulWidget {
  final String userName;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const DashboardScreen({
    super.key,
    required this.userName,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentTab = 0; // 0: Dashboard, 1: Data Siswa

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2), // Matching Login/Register Blue header
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
                ),
              );
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Navigation Tabs
          Container(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildTabButton(0, Icons.dashboard, 'Dashboard', isDark),
                const SizedBox(width: 12),
                _buildTabButton(1, Icons.people, 'Data Siswa', isDark),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),

          // Main Tab Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: _buildCurrentTabContent(isDark),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, IconData icon, String label, bool isDark) {
    bool isSelected = (_currentTab == index);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF1976D2) : (isDark ? Colors.grey.shade800 : Colors.grey.shade200),
        foregroundColor: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
        elevation: isSelected ? 2 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        setState(() {
          _currentTab = index;
        });
      },
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _buildCurrentTabContent(bool isDark) {
    if (_currentTab == 0) {
      // Tab 0: Dashboard with Quick Actions and Recent Modules
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Quick Actions Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF1A202C)),
                ),
                const SizedBox(height: 4),
                Text('Common tasks and shortcuts', style: TextStyle(fontSize: 13, color: isDark ? Colors.grey.shade400 : Colors.grey)),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2), // Matching Blue
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(userName: widget.userName),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_arrow, size: 18),
                      label: const Text('Mulai Kuis Sekarang', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: BorderSide(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
                        foregroundColor: isDark ? Colors.white : Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentTab = 1; // Switch to Data Siswa
                        });
                      },
                      icon: const Icon(Icons.people, size: 18),
                      label: const Text('Lihat Data Siswa', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Recent Modules Section matching screenshot
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Modules',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF1A202C)),
                        ),
                        const SizedBox(height: 4),
                        Text('Your latest created quiz modules', style: TextStyle(fontSize: 13, color: isDark ? Colors.grey.shade400 : Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View all', style: TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildRecentModuleCard('Flutter Basics: Introduction', 'F', Colors.blue, isDark),
                _buildRecentModuleCard('State Management & Provider', 'S', Colors.indigo, isDark),
                _buildRecentModuleCard('Widgets & Layouts in Flutter', 'W', Colors.lightBlue, isDark),
                _buildRecentModuleCard('Advanced Routing & Navigation', 'A', Colors.cyan, isDark),
              ],
            ),
          ),
        ],
      );
    } else {
      // Tab 1: Data Siswa (Dynamic list of users who registered & logged in)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Data Siswa Peserta Ujian',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Chip(
                backgroundColor: isDark ? Colors.blue.shade900.withValues(alpha: 0.4) : Colors.blue.shade50,
                label: Text('${UserData.registeredUsers.length} Siswa Terdaftar', style: TextStyle(color: isDark ? Colors.blue.shade200 : const Color(0xFF1976D2), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10)],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: UserData.registeredUsers.length,
              itemBuilder: (context, index) {
                final user = UserData.registeredUsers[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF1976D2),
                        child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      title: Text(user['name'] ?? 'Siswa', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                      subtitle: Text('Email/Username: ${user['email']} • NISN: ${user['nisn']}', style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey)),
                      trailing: const Icon(Icons.check_circle, color: Colors.green, size: 18),
                    ),
                    if (index < UserData.registeredUsers.length - 1) Divider(height: 1, color: isDark ? Colors.grey.shade800 : Colors.grey.shade200),
                  ],
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildRecentModuleCard(String title, String initial, Color avatarColor, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey.shade800 : Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            child: Text(initial, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: isDark ? Colors.white : const Color(0xFF1A202C))),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 14),
                    SizedBox(width: 4),
                    Text('Published', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: BorderSide(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
              foregroundColor: isDark ? Colors.white : Colors.black87,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen(userName: widget.userName)),
              );
            },
            child: const Text('Start Quiz', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
