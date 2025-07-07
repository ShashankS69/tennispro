import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          Image.asset('lib/assets/tennis.png', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.2)),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Create Account',
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 0),
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
                                  controller: _firstNameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Times New Roman'),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              flex: 1,
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 0),
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
                                  controller: _lastNameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: 'Last Name',
                                    hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Times New Roman'),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
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
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Times New Roman',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        controller: _phoneController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Times New Roman',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Times New Roman',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
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
                          'Create Account',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        icon: Image.asset('lib/assets/gmail.png', height: 28),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B6B3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Sign Up With Gmail',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        icon: Image.asset('lib/assets/apple.png', height: 28),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B6B3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Sign Up With Apple',
                          style: TextStyle(
                            fontSize: 22,
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
