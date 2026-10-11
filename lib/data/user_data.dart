class UserData {
  static final List<Map<String, String>> registeredUsers = [];
  static final List<Map<String, dynamic>> quizHistory = [];

  static void addUser(String name, String email) {
    if (name.trim().isNotEmpty && !registeredUsers.any((u) => u['email'] == email || u['name'] == name)) {
      registeredUsers.add({
        'name': name,
        'email': email,
      });
    }
  }

  static void addQuizResult(String name, int score) {
    // Avoid duplicates for same user immediate retries if desired, or keep all history
    quizHistory.insert(0, {
      'name': name.isNotEmpty ? name : 'Siswa',
      'score': score,
      'date': 'Baru saja',
    });
  }
}
