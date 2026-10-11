import 'package:flutter/material.dart';
import '../data/user_data.dart';

class QuizHistoryScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const QuizHistoryScreen({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF315B8C),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text('Riwayat Kuis & Skor Siswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Daftar Riwayat Pengerjaan Kuis',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      backgroundColor: isDark ? Colors.blue.shade900.withValues(alpha: 0.4) : Colors.blue.shade50,
                      label: Text('${UserData.quizHistory.length} Riwayat', style: TextStyle(color: isDark ? Colors.blue.shade200 : const Color(0xFF315B8C), fontWeight: FontWeight.bold)),
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
                  child: UserData.quizHistory.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: Text(
                              'Belum ada siswa yang menyelesaikan kuis.',
                              style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey, fontSize: 15),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: UserData.quizHistory.length,
                          itemBuilder: (context, index) {
                            final history = UserData.quizHistory[index];
                            final int score = history['score'] ?? 0;
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xFF315B8C),
                                    child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                  title: Text(history['name'] ?? 'Siswa', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                                  subtitle: Text('Waktu pengerjaan: ${history['date']}', style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey)),
                                  trailing: Chip(
                                    backgroundColor: score >= 75 ? Colors.green.shade100 : Colors.orange.shade100,
                                    label: Text('Skor: $score', style: TextStyle(color: score >= 75 ? Colors.green.shade800 : Colors.orange.shade800, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                if (index < UserData.quizHistory.length - 1) Divider(height: 1, color: isDark ? Colors.grey.shade800 : Colors.grey.shade200),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
