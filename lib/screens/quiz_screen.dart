import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/quiz_card.dart'; // Import quiz_card yang baru dibuat
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final question = QuizData.questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis: Pertanyaan ${_currentIndex + 1}/${QuizData.questions.length}'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (_currentIndex + 1) / QuizData.questions.length,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),

                  // Menggunakan QuizCard di sini
                  Expanded(
                    child: SingleChildScrollView(
                      child: QuizCard(
                        questionText: question.questionText,
                        options: question.options,
                        selectedOption: _selectedOption,
                        onOptionSelected: (index) {
                          setState(() {
                            _selectedOption = index;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _selectedOption == null
                        ? null
                        : () {
                      if (_selectedOption == question.correctOptionIndex) {
                        _score += 25; // Akumulasi skor
                      }

                      if (_currentIndex < QuizData.questions.length - 1) {
                        setState(() {
                          _currentIndex++;
                          _selectedOption = null;
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              userName: widget.userName,
                              score: _score,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      _currentIndex == QuizData.questions.length - 1 ? 'Selesai' : 'Selanjutnya',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}