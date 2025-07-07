import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.home, color: Colors.black),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
              child: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Icon(Icons.person, color: Colors.green.shade900),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/assets/tennis.png', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.3)),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      'Player Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/match');
                        },
                        child: const Text(
                          'Start Match',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Player History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _historyCard(
                      context,
                      date: '19 May 2025',
                      player1: 'Player 1',
                      player2: 'Player 2',
                      score1: 15,
                      score2: 0,
                      badge1: 'P',
                      badge2: 'S',
                    ),
                    const SizedBox(height: 16),
                    _historyCard(
                      context,
                      date: '2 June 2025',
                      player1: 'Player 1',
                      player2: 'Player 2',
                      score1: 10,
                      score2: 25,
                      badge1: 'N',
                      badge2: 'R',
                    ),
                    const SizedBox(height: 16),
                    _historyCard(
                      context,
                      date: '12 June 2025',
                      player1: 'Player 1',
                      player2: 'Player 2',
                      score1: 5,
                      score2: 0,
                      badge1: 'R',
                      badge2: 'K',
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

Widget _historyCard(
  BuildContext context, {
  required String date,
  required String player1,
  required String player2,
  required int score1,
  required int score2,
  required String badge1,
  required String badge2,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
    margin: const EdgeInsets.symmetric(horizontal: 0),
    decoration: BoxDecoration(
      color: Colors.brown.shade200.withOpacity(0.4),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black26),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/result');
          },
          child: Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white70,
              decorationThickness: 2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _badgeCircle(badge1),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                player1,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Text(
              '$score1',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _badgeCircle(badge2),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                player2,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Text(
              '$score2',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _badgeCircle(String letter) {
  return Container(
    width: 28,
    height: 28,
    decoration: const BoxDecoration(
      color: Colors.lightGreen,
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    child: Text(
      letter,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
