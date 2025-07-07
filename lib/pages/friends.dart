import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final List<Map<String, dynamic>> _friends = [
    {
      'name': 'Charles Leclerc',
      'winStreak': 5,
      'ntrp': 4.5,
      'utr': 6.0,
      'matchesTogether': 12,
    },
    {
      'name': 'Max Verstappen',
      'winStreak': 3,
      'ntrp': 4.8,
      'utr': 6.5,
      'matchesTogether': 5,
    },
  ];
  int _friendCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Friends',
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
                Navigator.of(
                  context,
                ).pushReplacementNamed('/profile'); // Fixed route name
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_friends.isEmpty) {
                              _friendCounter = 1;
                            }
                            _friends.add({
                              'name': 'Friend ${_friendCounter++}',
                              'winStreak': 0,
                              'ntrp': 4.0,
                              'utr': 5.0,
                              'matchesTogether': 0,
                            });
                          });
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text('Add Friend'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Friends...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._friends.asMap().entries.map(
                    (entry) => Column(
                      children: [
                        _friendCard(
                          name: entry.value['name'],
                          winStreak: entry.value['winStreak'],
                          ntrp: entry.value['ntrp'],
                          utr: entry.value['utr'],
                          matchesTogether: entry.value['matchesTogether'],
                          onDelete: () {
                            setState(() {
                              _friends.removeAt(entry.key);
                            });
                          },
                          onMessage: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => FriendChatScreen(
                                  friendName: entry.value['name'],
                                ), // Fixed class name
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B8B5D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.mail, color: Colors.white),
                      label: const Text(
                        'Invite Friends via Link',
                        style: TextStyle(
                          fontSize: 18,
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

Widget _friendCard({
  required String name,
  required int winStreak,
  required double ntrp,
  required double utr,
  required int matchesTogether,
  required VoidCallback onDelete,
  required VoidCallback onMessage,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
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
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Text('🏆', style: TextStyle(fontSize: 18)),
            Text(
              ' Win Streak: $winStreak',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        Text(
          'NTRP: $ntrp | UTR: $utr',
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          'Matches Together: $matchesTogether',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.check_box, size: 18),
                label: const Text('Challenge'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
                onPressed: onMessage,
                icon: const Icon(Icons.message, size: 18),
                label: const Text('Message'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            onPressed: onDelete,
            child: const Text('Delete Friend'),
          ),
        ),
      ],
    ),
  );
}

// Simple chat screen for messaging a friend
class FriendChatScreen extends StatefulWidget {
  final String friendName;
  const FriendChatScreen({Key? key, required this.friendName})
    : super(key: key);

  @override
  State<FriendChatScreen> createState() => _FriendChatScreenState();
}

class _FriendChatScreenState extends State<FriendChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Chat with ${widget.friendName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) => Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(_messages[index]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      setState(() {
                        _messages.add(_controller.text.trim());
                        _controller.clear();
                      });
                    }
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
