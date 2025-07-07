import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: null,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.home, color: Colors.black, size: 32),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/profile');
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.green, size: 32),
              ),
            ),
          ),
        ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    '12th JUNE 2025',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 320,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _ResultRow(label: 'Tournament', value: 'T001'),
                        _ResultRow(label: 'Match', value: 'M001'),
                        _ResultRow(label: 'Set', value: 'S001'),
                        _ResultRow(label: 'Game', value: 'G001'),
                        _ResultRow(label: 'Court', value: 'Hard'),
                        _ResultRow(label: 'Player', value: 'P001'),
                        _ResultRow(label: 'Opponent', value: 'P002'),
                        _ResultRow(label: 'Point Duration', value: '13,4'),
                        _ResultRow(label: 'Point Winner', value: 'P002'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 320,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x664B5A2A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black87),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Feedback',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Type Here',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.mic, color: Colors.white70),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B8B5D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  const _ResultRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
