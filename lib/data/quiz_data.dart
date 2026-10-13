import '../models/question.dart';

class QuizData {
  // Map of module title -> list of exactly 10 questions each
  static final Map<String, List<Question>> modules = {
    'Flutter Basics: Introduction': [
      Question(
        questionText: 'Apa bahasa pemrograman utama yang digunakan untuk membangun aplikasi Flutter?',
        options: ['Java', 'Python', 'Dart', 'C++'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Widget apakah yang digunakan untuk membuat struktur tata letak dasar Material Design di Flutter?',
        options: ['Container', 'Scaffold', 'SizedBox', 'Column'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Apa fungsi dari fungsi main() pada program Dart/Flutter?',
        options: ['Menampilkan UI', 'Titik awal eksekusi program', 'Mengatur navigasi', 'Menyimpan state'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'File konfigurasi utama untuk dependensi dan aset pada proyek Flutter adalah?',
        options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'AndroidManifest.xml'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Manakah widget yang bersifat stateless (tidak memiliki state internal)?',
        options: ['StatelessWidget', 'StatefulWidget', 'State', 'ChangeNotifier'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Perintah terminal apa yang digunakan untuk membuat proyek baru Flutter?',
        options: ['flutter run', 'flutter create', 'flutter build', 'flutter pub get'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara menambahkan jarak vertikal antar widget di dalam Column?',
        options: ['Padding', 'SizedBox(height: ...)', 'Margin', 'Spacer saja'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Apa nama mesin rendering berperforma tinggi yang digunakan oleh Flutter?',
        options: ['WebKit', 'Skia / Impeller', 'Gecko', 'V8 Engine'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Perintah apa yang digunakan untuk mengunduh dependensi package di pubspec.yaml?',
        options: ['flutter upgrade', 'flutter clean', 'flutter pub get', 'flutter test'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Widget mana yang digunakan untuk menampilkan teks statis di Flutter?',
        options: ['TextField', 'Text', 'Label', 'StringView'],
        correctOptionIndex: 1,
      ),
    ],
    'State Management & Provider': [
      Question(
        questionText: 'Apa tujuan utama dari State Management di Flutter?',
        options: ['Mengubah warna AppBar', 'Mengelola dan menyinkronkan data antar widget', 'Mempercepat kompilasi', 'Mengurangi ukuran APK'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Package populer apa yang sering digunakan untuk state management berbasis InheritedWidget?',
        options: ['Http', 'Provider', 'SQFlite', 'Shared Preferences'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Metode apa yang digunakan untuk memperbarui state di dalam StatefulWidget?',
        options: ['refreshState()', 'update()', 'setState()', 'rebuild()'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Kelas apa yang biasa diperluas (extends) saat membuat ChangeNotifier untuk Provider?',
        options: ['StatelessWidget', 'ChangeNotifier', 'StreamController', 'FutureBuilder'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Fungsi mana yang digunakan untuk membaca (mendengarkan) perubahan data dari Provider tanpa rebuild?',
        options: ['Provider.of<T>(context)', 'context.read<T>()', 'context.watch<T>()', 'Consumer<T>()'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget apa yang direkomendasikan untuk membungkus bagian kecil UI yang ingin dirender ulang oleh Provider?',
        options: ['Container', 'Consumer', 'SizedBox', 'Expanded'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Apa kepanjangan dari immutability dalam konteks state Flutter?',
        options: ['Nilai data dapat diubah kapan saja', 'Nilai data tidak dapat diubah setelah dibuat', 'State bersifat global', 'Data disimpan di cloud'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Metode apa di ChangeNotifier yang memberitahu para listener untuk memperbarui UI?',
        options: ['refresh()', 'notifyListeners()', 'updateUI()', 'setState()'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Manakah yang BUKAN merupakan pendekatan state management di Flutter?',
        options: ['Bloc / Cubit', 'Provider', 'SQLite Query', 'Redux'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Kapan constructor dispose() dipanggil pada State object?',
        options: ['Saat widget pertama kali dibuat', 'Saat widget dihapus secara permanen dari tree', 'Saat tombol ditekan', 'Saat rotasi layar'],
        correctOptionIndex: 1,
      ),
    ],
    'Widgets & Layouts in Flutter': [
      Question(
        questionText: 'Widget apakah yang digunakan untuk menyusun anak-anaknya secara horizontal?',
        options: ['Column', 'Row', 'Stack', 'ListView'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget apa yang digunakan untuk menumpuk widget satu di atas yang lain?',
        options: ['Row', 'Column', 'Stack', 'GridView'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Properti apa pada Row/Column yang mengatur tata letak sepanjang sumbu utama (main axis)?',
        options: ['crossAxisAlignment', 'mainAxisAlignment', 'alignment', 'padding'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget mana yang memaksa anak (child) untuk mengisi ruang kosong yang tersisa di dalam Flex?',
        options: ['Container', 'Expanded', 'SizedBox', 'Padding'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara membuat daftar item grid 2 dimensi di Flutter?',
        options: ['ListView.builder', 'GridView.builder', 'Column with Expanded', 'StackView'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget apa yang digunakan untuk memberikan jarak di sekitar widget lain?',
        options: ['Margin', 'Padding', 'Spacing', 'Border'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Apa kegunaan dari SingleChildScrollView?',
        options: ['Membuat animasi', 'Membuat tampilan dapat di-scroll saat konten melebihi layar', 'Mengatur navigasi', 'Menyimpan data lokal'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget apa yang paling efisien untuk menampilkan daftar item dalam jumlah ribuan atau tak terbatas?',
        options: ['Column', 'ListView', 'ListView.builder', 'Row'],
        correctOptionIndex: 2,
      ),
      Question(
        questionText: 'Properti apa pada Stack yang digunakan untuk memposisikan widget secara bebas di dalamnya?',
        options: ['Align', 'Positioned', 'Center', 'Padding'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Widget apa yang digunakan untuk membuat kotak kosong dengan ukuran lebar dan tinggi tetap?',
        options: ['Container', 'SizedBox', 'BlankBox', 'EmptyWidget'],
        correctOptionIndex: 1,
      ),
    ],
    'Advanced Routing & Navigation': [
      Question(
        questionText: 'Kelas apa di Flutter yang bertanggung jawab mengelola tumpukan (stack) halaman/route?',
        options: ['RouterManager', 'Navigator', 'PageController', 'StackView'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara berpindah ke halaman baru menggunakan pendekatan imperatif standar?',
        options: ['Navigator.jumpTo()', 'Navigator.push()', 'Navigator.open()', 'Navigator.next()'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara menutup halaman saat ini dan kembali ke halaman sebelumnya?',
        options: ['Navigator.close()', 'Navigator.pop()', 'Navigator.back()', 'Navigator.remove()'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara mengirim data (argumen) ke halaman tujuan saat melakukan push?',
        options: ['Melalui constructor halaman tujuan', 'Melalui GlobalKey', 'Melalui setState', 'Tidak bisa mengirim data'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Apa nama pendekatan navigasi modern berbasis deklaratif di Flutter?',
        options: ['Navigator 1.0', 'Navigator 2.0 (Router API)', 'DeepRoute', 'StackRouter'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Metode apa yang digunakan untuk menghapus semua halaman sebelumnya dan menggantinya dengan halaman baru?',
        options: ['Navigator.pushReplacement()', 'Navigator.pushAndRemoveUntil()', 'Navigator.reset()', 'Navigator.clear()'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Apa fungsi dari onGenerateRoute pada MaterialApp?',
        options: ['Mengatur tema gelap/terang', 'Menangani named route dinamis dengan argumen', 'Menjalankan unit test', 'Mengonfigurasi database'],
        correctOptionIndex: 1,
      ),
      Question(
        questionText: 'Bagaimana cara mengembalikan nilai (result) dari halaman yang ditutup ke halaman sebelumnya?',
        options: ['Navigator.pop(context, resultValue)', 'Navigator.return(resultValue)', 'setResult(resultValue)', 'result.save()'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Apa yang dimaksud dengan Named Routes di Flutter?',
        options: ['Rute yang diberi nama string unik (misal: \'/home\')', 'Rute berdasarkan nama file', 'Rute otomatis dari sistem operasi', 'Rute berbasis angka ID'],
        correctOptionIndex: 0,
      ),
      Question(
        questionText: 'Manakah widget yang secara otomatis menambahkan tombol back (panah kembali) jika ada route sebelumnya?',
        options: ['Scaffold', 'AppBar', 'Container', 'Navigator'],
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

  static final List<Question> questions = modules['Flutter Basics: Introduction']!;
}
