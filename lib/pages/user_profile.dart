import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/assets/tennis.png', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.3)),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          // Profile Image
                          CircleAvatar(
                            radius: 56,
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(
                              Icons.person,
                              size: 64,
                              color: Colors.grey,
                            ),
                            // If you have the profile.png asset, uncomment the next line and comment the child above
                            // backgroundImage: AssetImage('lib/assets/profile.png'),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Test User 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade200.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.black26),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 12,
                              ),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Singles', style: _profileStatStyle),
                                      Text('Doubles', style: _profileStatStyle),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('1-2', style: _profileValueStyle),
                                      Text('0-1', style: _profileValueStyle),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('NTRP', style: _profileStatStyle),
                                      Text('UTR', style: _profileStatStyle),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('4.5', style: _profileValueStyle),
                                      Text('6', style: _profileValueStyle),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hitting Arm',
                                        style: _profileStatStyle,
                                      ),
                                      Text(
                                        'Backhand',
                                        style: _profileStatStyle,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Right', style: _profileValueStyle),
                                      Text(
                                        'One-Hand',
                                        style: _profileValueStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(
                                    color: Colors.white54,
                                    thickness: 1,
                                    height: 18,
                                  ),
                                  const Text(
                                    '⭐Streaks⭐',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Winning Streak 🏆',
                                        style: _profileStatStyle,
                                      ),
                                      Text('11', style: _profileValueStyle),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Leaderboard 🏅⭐',
                                        style: _profileStatStyle,
                                      ),
                                      Text(
                                        '112/360',
                                        style: _profileValueStyle,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ace Streak 🎯',
                                        style: _profileStatStyle,
                                      ),
                                      Text('3', style: _profileValueStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _ProfileNavIcon(
                                  icon: Icons.bar_chart,
                                  onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                                ),
                                _ProfileNavIcon(
                                  icon: Icons.group,
                                  onTap: () => Navigator.pushReplacementNamed(context, '/friends'),
                                ),
                                _ProfileNavIcon(
                                  icon: Icons.settings,
                                  onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _profileStatStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle _profileValueStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

class _ProfileNavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _ProfileNavIcon({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white.withOpacity(0.8),
        child: Icon(icon, color: Colors.black, size: 32),
      ),
    );
  }
}
