
import 'package:flutter/material.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black54,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/tennis.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(color: Colors.black.withOpacity(0.3)),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    // Title (already in AppBar)
                    // Password fields
                    _PasswordField(
                      hint: 'Enter New Password',
                    ),
                    const SizedBox(height: 24),
                    _PasswordField(
                      hint: 'Confirm Password',
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4B5A2A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String hint;
  const _PasswordField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x664B5A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black87),
      ),
      child: TextField(
        obscureText: true,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ),
    );
  }
}
