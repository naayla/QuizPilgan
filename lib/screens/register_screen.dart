import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../widgets/auth_card.dart';
import '../data/user_data.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const RegisterScreen({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AuthCard(
      appBarTitle: 'Aplikasi Quiz',
      title: 'Register',
      subtitle: 'Daftar untuk mulai menjelajahi kuis.',
      icon: Icons.person_add_outlined,
      formContent: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                labelStyle: const TextStyle(color: Color(0xFF315B8C)),
                filled: true,
                fillColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.person, color: Color(0xFF315B8C)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Nama tidak boleh kosong!' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFF315B8C)),
                filled: true,
                fillColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.email, color: Color(0xFF315B8C)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Email tidak boleh kosong!' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Color(0xFF315B8C)),
                filled: true,
                fillColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF315B8C)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Password tidak boleh kosong!' : (v.length < 6 ? 'Password minimal 6 karakter!' : null),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                labelStyle: const TextStyle(color: Color(0xFF315B8C)),
                filled: true,
                fillColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF315B8C)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Konfirmasi password tidak boleh kosong!' : (v != _passwordController.text ? 'Password tidak sama!' : null),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315B8C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserData.addUser(_nameController.text.trim(), _emailController.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Register berhasil! Silakan masuk.')),
                    );
                    Navigator.pop(context, {
                      'email': _emailController.text.trim(),
                      'password': _passwordController.text.trim(),
                    });
                  }
                },
                child: const Text('Register', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomAction: RichText(
        text: TextSpan(
          text: 'Sudah punya akun? ',
          style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey.shade700, fontSize: 14),
          children: [
            TextSpan(
              text: ' Masuk di sini',
              style: const TextStyle(
                color: Color(0xFF315B8C),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}
