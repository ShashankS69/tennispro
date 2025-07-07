import 'package:flutter/material.dart';

class MatchTrackingScreen extends StatelessWidget {
  const MatchTrackingScreen({super.key});

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
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Match Tracking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade200.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black26),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '12th JUNE 2025',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _badgeCircle('O'),
                              const SizedBox(width: 8),
                              const Text(
                                'Player 1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _badgeCircle('S'),
                              const SizedBox(width: 8),
                              const Text(
                                'Player 2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _scoreBox('Player 1', '15'),
                        const SizedBox(width: 16),
                        _scoreBox('Player 2', '0'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown.shade200.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _tabButton('First serve', true),
                          _tabButton('Second serve', false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade200.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black26),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('66.45%', style: _statStyle),
                              Text('1st Serve %', style: _statStyle),
                              Text('0.00%', style: _statStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('100.00%', style: _statStyle),
                              Text('2nd Serve %', style: _statStyle),
                              Text('0.00%', style: _statStyle),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _statRow('Aces', '1', '0'),
                          _statRow('Double Faults', '0', '0'),
                          _statRow('Winners', '1', '1'),
                          _statRow('Unforced Errors', '0', '0'),
                          _statRow('Forced Errors', '1', '1'),
                        ],
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

Widget _scoreBox(String player, String score) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.brown.shade200.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          Text(
            player,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            score,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _tabButton(String label, bool selected) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? Colors.brown.shade400 : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

const TextStyle _statStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

Widget _statRow(String label, String p1, String p2) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(p1, style: _statStyle),
        Text(label, style: _statStyle),
        Text(p2, style: _statStyle),
      ],
    ),
  );
}
