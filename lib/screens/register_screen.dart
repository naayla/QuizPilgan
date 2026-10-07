import 'package:flutter/material.dart';
import '../widgets/auth_card.dart';

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
    return AuthCard(
      title: 'Daftar Akun',
      subtitle: 'Daftar untuk mulai menjelajahi kuis.',
      icon: Icons.person_add_outlined,
      formContent: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                labelStyle: const TextStyle(color: Color(0xFF1976D2)),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.person, color: Color(0xFF1976D2)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Nama tidak boleh kosong!' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
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
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                labelStyle: const TextStyle(color: Color(0xFF1976D2)),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1976D2)),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Konfirmasi password tidak boleh kosong!' : (v != _passwordController.text ? 'Password tidak sama!' : null),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registrasi berhasil! Silakan masuk.')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('DAFTAR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomAction: TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Sudah punya akun? Masuk di sini', style: TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.w600)),
      ),
    );
  }
}
