import '../models/question.dart';

class QuizData {
  static final Map<String, List<Question>> modules = {
    'Modul 1: Flutter Dasar': [
      Question(
        questionText: 'Apa bahasa pemrograman yang digunakan untuk Flutter?',
        options: ['Java', 'Python', 'Dart', 'C++'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Widget apakah untuk membuat struktur tata letak dasar di Flutter?',
        options: ['Container', 'Scaffold', 'SizedBox', 'Column'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Fungsi utama main() pada program Dart adalah?',
        options: ['Menampilkan UI', 'Titik awal eksekusi program', 'Mengatur navigasi', 'Menyimpan state'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'File konfigurasi dependensi dan aset utama di Flutter adalah?',
        options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'AndroidManifest.xml'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget yang tidak memiliki state internal disebut?',
        options: ['StatelessWidget', 'StatefulWidget', 'State', 'ChangeNotifier'],
        correctOptionIndex: 0,
      ),
    ],
    'Modul 2: State & Navigation': [
      Question(
        questionText: 'Metode apa untuk memperbarui state di StatefulWidget?',
        options: ['updateState()', 'refresh()', 'setState()', 'modifyState()'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Kelas apa untuk berpindah halaman di Flutter menggunakan Navigator?',
        options: ['Navigator.push()', 'Navigator.jump()', 'Navigator.open()', 'Navigator.go()'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Package populer untuk state management di Flutter adalah?',
        options: ['Http', 'Provider', 'SQFlite', 'Shared Preferences'],
        correctOptionIndex: 1,
      ),
    ],
  };

  static void addModule(String title, List<Question> questions) {
    modules[title] = questions;
  }

  static void removeModule(String title) {
    modules.remove(title);
  }

  static final List<Question> questions = modules['Modul 1: Flutter Dasar']!;
}
