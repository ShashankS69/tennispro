import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 32,
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
          // Settings content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _settingsSection(
                    title: 'Account Setting',
                    children: [
                      const Text(
                        'Email: user@example.com',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('/change_password');
                              },
                              child: const Text('Change Password'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('/login');
                              },
                              child: const Text('LogOut'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _settingsSection(
                    title: 'Match Analysis Preferences',
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Focus Area:',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Serve',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _switchTile('Auto Highlights', true),
                      _switchTile('Real-time Tips', false),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _settingsSection(
                    title: 'Notifications',
                    children: [
                      _switchTile('Match Alerts', true),
                      _switchTile('Weekly Summary', false),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _settingsSection(
                    title: 'App Preferences',
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Light',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'English',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _switchTile('Metric Units', true),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _settingsSection(
                    title: 'Privacy & Data',
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Text('Export Match History'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: const Text('Confirm Delete Account', style: TextStyle(fontWeight: FontWeight.bold)),
                                      content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                            Navigator.of(context).pushReplacementNamed('/login');
                                          },
                                          child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Delete Account'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _switchTile('Share Stats with Coach', false),
                    ],
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

Widget _settingsSection({
  required String title,
  required List<Widget> children,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.4),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    ),
  );
}

Widget _switchTile(String label, bool value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: const TextStyle(color: Colors.white)),
      Switch(
        value: value,
        onChanged: (_) {},
        activeColor: Colors.green,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey[400],
      ),
    ],
  );
}
