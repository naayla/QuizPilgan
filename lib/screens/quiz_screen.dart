import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../data/user_data.dart';
import '../data/quiz_state.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  final String? moduleTitle;

  const QuizScreen({super.key, required this.userName, this.moduleTitle});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizStateController _state = QuizStateController();
  late List<Question> _questions;

  @override
  void initState() {
    super.initState();
    _questions = QuizData.modules[widget.moduleTitle] ?? QuizData.questions;
    if (_state.currentUser != widget.userName) {
      _state.reset();
      _state.currentUser = widget.userName;
    }
  }

  void _finishExam() {
    int score = 0;
    int pointsPerQ = 100 ~/ _questions.length;

    for (int i = 0; i < _questions.length; i++) {
      if (_state.selectedAnswers[i] == _questions[i].correctOptionIndex) {
        score += pointsPerQ;
      }
    }

    UserData.addQuizResult(widget.userName, score);
    _state.reset();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userName: widget.userName,
          score: score,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_state.currentIndex];
    final totalQ = _questions.length;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    int answeredCount = _state.selectedAnswers.length;
    int doubtfulCount = _state.doubtfulQuestions.length;
    int unattemptedCount = totalQ - answeredCount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF315B8C),
        elevation: 2,
        foregroundColor: Colors.white,
        title: Text(widget.moduleTitle ?? 'Quiz', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          // Logout button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, size: 14),
            label: const Text('Logout', style: TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top breadcrumb bar
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.blue.shade900.withValues(alpha: 0.4) : Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('📘 Materi', style: TextStyle(color: isDark ? Colors.blue.shade200 : const Color(0xFF315B8C), fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    const SizedBox(width: 12),
                    Text('Soal ${_state.currentIndex + 1}/$totalQ', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.grey.shade400 : Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),

                // Question Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Type Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.green.shade900.withValues(alpha: 0.4) : Colors.green.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('💡 Pilihan Ganda', style: TextStyle(color: isDark ? Colors.green.shade200 : Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                        const SizedBox(height: 12),
                        // Question Text
                        Text(
                          question.questionText,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : const Color(0xFF2D3748), height: 1.4),
                        ),
                        const SizedBox(height: 20),
                        // Options list with A, B, C, D badges
                        ...List.generate(question.options.length, (optIndex) {
                          bool isSelected = _state.selectedAnswers[_state.currentIndex] == optIndex;
                          String optLetter = String.fromCharCode(65 + optIndex); // A, B, C, D

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _state.selectedAnswers[_state.currentIndex] = optIndex;
                                });
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (isDark ? Colors.blue.shade900.withValues(alpha: 0.4) : Colors.blue.shade50)
                                      : (isDark ? const Color(0xFF2C2C2C) : Colors.grey.shade50),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF315B8C) : (isDark ? Colors.grey.shade700 : Colors.grey.shade300),
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSelected ? const Color(0xFF315B8C) : (isDark ? Colors.grey.shade700 : Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        optLetter,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        question.options[optIndex],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Navigation Action Buttons Bar
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _state.currentIndex > 0
                          ? () {
                              setState(() {
                                _state.currentIndex--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.arrow_back, size: 16),
                      label: const Text('Sebelumnya'),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_state.doubtfulQuestions.contains(_state.currentIndex)) {
                            _state.doubtfulQuestions.remove(_state.currentIndex);
                          } else {
                            _state.doubtfulQuestions.add(_state.currentIndex);
                          }
                        });
                      },
                      icon: const Icon(Icons.help_outline, size: 16),
                      label: Text(_state.doubtfulQuestions.contains(_state.currentIndex) ? 'Batalkan Ragu' : 'Ragu-ragu'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF315B8C),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _state.currentIndex < totalQ - 1
                          ? () {
                              setState(() {
                                _state.currentIndex++;
                              });
                            }
                          : null,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Berikutnya'),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _finishExam,
                      icon: const Icon(Icons.check, size: 16),
                      label: const Text('Selesai Ujian'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Navigasi Soal Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Navigasi Soal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDark ? Colors.white : Colors.black87)),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: totalQ,
                          itemBuilder: (context, index) {
                            bool isCurrent = (index == _state.currentIndex);
                            bool isAnswered = _state.selectedAnswers.containsKey(index);
                            bool isDoubtful = _state.doubtfulQuestions.contains(index);

                            Color boxColor = isDark ? Colors.grey.shade800 : Colors.grey.shade200;
                            Color textColor = isDark ? Colors.white70 : Colors.black87;

                            if (isDoubtful) {
                              boxColor = Colors.amber.shade400;
                              textColor = Colors.white;
                            } else if (isAnswered) {
                              boxColor = const Color(0xFF315B8C);
                              textColor = Colors.white;
                            }

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _state.currentIndex = index;
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: boxColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: isCurrent ? Border.all(color: isDark ? Colors.white : Colors.black, width: 2) : null,
                                ),
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Legend
                        Wrap(
                          spacing: 16,
                          runSpacing: 8,
                          children: [
                            _buildLegendItem(const Color(0xFF315B8C), 'Sudah dijawab', isDark),
                            _buildLegendItem(Colors.amber.shade400, 'Ragu-ragu', isDark),
                            _buildLegendItem(isDark ? Colors.grey.shade800 : Colors.grey.shade200, 'Belum dijawab', isDark, textColor: isDark ? Colors.white70 : Colors.black87),
                          ],
                        ),
                        Divider(height: 32, color: isDark ? Colors.grey.shade800 : Colors.grey.shade300),
                        // Statistik
                        Text('Statistik', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDark ? Colors.white : Colors.black87)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dijawab:', style: TextStyle(color: isDark ? Colors.grey.shade300 : Colors.black87)),
                            Text('$answeredCount', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ragu-ragu:', style: TextStyle(color: isDark ? Colors.grey.shade300 : Colors.black87)),
                            Text('$doubtfulCount', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Belum:', style: TextStyle(color: isDark ? Colors.grey.shade300 : Colors.black87)),
                            Text('$unattemptedCount', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, bool isDark, {Color textColor = Colors.white}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade300 : Colors.black87)),
      ],
    );
  }
}
