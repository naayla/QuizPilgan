import 'package:flutter/material.dart';
import 'custom_button.dart';

class QuizCard extends StatelessWidget {
  final String questionText;
  final List<String> options;
  final int? selectedOption;
  final ValueChanged<int> onOptionSelected;

  const QuizCard({
    Key? key,
    required this.questionText,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Teks Pertanyaan
            Text(
              questionText,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),

            // Daftar Pilihan Jawaban
            ...List.generate(options.length, (index) {
              return OptionButton(
                text: options[index],
                isSelected: selectedOption == index,
                onPressed: () => onOptionSelected(index),
              );
            }),
          ],
        ),
      ),
    );
  }
}