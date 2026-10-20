import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  final String appBarTitle;
  final String title;
  final IconData icon;
  final Widget formContent;
  final Widget bottomAction;

  const AuthCard({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.icon,
    required this.formContent,
    required this.bottomAction,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF315B8C),
        elevation: 2,
        foregroundColor: Colors.white,
        title: Text(appBarTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF315B8C),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person_outline, size: 48, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.blue.shade300 : const Color(0xFF315B8C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    formContent,
                    const SizedBox(height: 16),
                    bottomAction,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
