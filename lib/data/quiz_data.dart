import '../models/question.dart';

class QuizData {
  static final List<Question> questions = [
    Question(
      questionText: 'Widget apakah yang digunakan untuk membuat tampilan yang dapat di-scroll di Flutter?',
      options: ['Container', 'ListView', 'Column', 'SizedBox'],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'Apa bahasa pemrograman yang digunakan untuk pengembangan aplikasi Flutter?',
      options: ['Java', 'Python', 'Dart', 'C++'],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: 'Widget yang tidak memiliki state internal (bersifat statis) disebut?',
      options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'ProxyWidget'],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'Fungsi utama dari pubspec.yaml pada proyek Flutter adalah?',
      options: [
        'Mengatur navigasi halaman',
        'Menyimpan konfigurasi dan dependensi aset/package',
        'Menjalankan unit test',
        'Mengkompilasi kode ke native binary'
      ],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'Manakah yang merupakan widget layout dasar untuk menyusun widget secara vertikal?',
      options: ['Row', 'Column', 'Stack', 'GridView'],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'Metode apa yang digunakan untuk memperbarui state pada StatefulWidget di Flutter?',
      options: ['updateState()', 'refresh()', 'setState()', 'modifyState()'],
      correctOptionIndex: 2,
    ),
  ];
}
