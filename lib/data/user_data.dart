class UserData {
  static final List<Map<String, String>> registeredUsers = [];

  static void addUser(String name, String email) {
    if (name.trim().isNotEmpty && !registeredUsers.any((u) => u['email'] == email || u['name'] == name)) {
      registeredUsers.add({
        'name': name,
        'email': email,
        'nisn': '005${DateTime.now().millisecond.toString().padLeft(7, '0')}',
      });
    }
  }
}
