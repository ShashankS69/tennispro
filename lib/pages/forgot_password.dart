import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/tennis.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.2)),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B6B3D).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _emailPhoneController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Email or Phone Number',
                          hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Times New Roman'),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B6B3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Send Code',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B6B3D).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _codeController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Enter Code',
                          hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Times New Roman'),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B6B3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontFamily: 'Times New Roman',
                          ),
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

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }
}
