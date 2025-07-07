import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/match_tracking.dart';
import 'pages/user_profile.dart';
import 'pages/settings.dart';
import 'pages/friends.dart';
import 'pages/result.dart';
import 'pages/password_change.dart';
import 'pages/signup.dart';
import 'pages/forgot_password.dart';

void main() {
  runApp(const TennisProApp());
}

class TennisProApp extends StatelessWidget {
  const TennisProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/match': (context) => const MatchTrackingScreen(),
        '/result': (context) => const ResultScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/change_password': (context) => const PasswordChangeScreen(),
        '/friends': (context) => const FriendsScreen(),
      },
    );
  }
}

// No placeholder screens needed since all screens are now imported from separate files
