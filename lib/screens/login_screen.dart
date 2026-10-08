import 'package:flutter/material.dart';
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
    return AuthCard(
      title: 'Masuk (Login)',
      subtitle: 'Silakan masuk untuk mulai mengerjakan kuis.',
      icon: Icons.lock_outline,
      formContent: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email / Username',
                labelStyle: const TextStyle(color: Color(0xFF1976D2)),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1976D2)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Email tidak boleh kosong!' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Color(0xFF1976D2)),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF1976D2)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Password tidak boleh kosong!' : (v.length < 6 ? 'Password minimal 6 karakter!' : null),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
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
                child: const Text('MASUK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomAction: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
            ),
          );
        },
        child: const Text('Belum punya akun? Daftar di sini', style: TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.w600)),
      ),
    );
  }
}
