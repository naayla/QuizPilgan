import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';
import '../widgets/auth_card.dart';
import '../data/user_data.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const LoginScreen({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AuthCard(
      appBarTitle: 'Aplikasi Quiz',
      title: 'Login',
      subtitle: 'Silakan masuk untuk mulai mengerjakan kuis.',
      icon: Icons.lock_outline,
      formContent: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                labelText: 'Email / Username',
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
                    UserData.addUser(_emailController.text.trim(), _emailController.text.trim());
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(
                          userName: _emailController.text.trim(),
                          toggleTheme: widget.toggleTheme,
                          isDarkMode: widget.isDarkMode,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomAction: RichText(
        text: TextSpan(
          text: 'Belum punya akun? ',
          style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey.shade700, fontSize: 14),
          children: [
            TextSpan(
              text: ' Daftar di sini',
              style: const TextStyle(
                color: Color(0xFF315B8C),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
                    ),
                  );
                  if (result != null && result is Map<String, String>) {
                    setState(() {
                      _emailController.text = result['email'] ?? '';
                      _passwordController.text = result['password'] ?? '';
                    });
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
