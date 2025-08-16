import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import the HomeScreen
import 'package:exam_prep_adda/utils/app_theme.dart'; // Import the app theme for the background

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
  }

  // A method to check the internet connection and navigate
  Future<void> _checkInternetAndNavigate() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
      });
    } else {
      setState(() {
        _isConnected = true;
      });
      // Wait for 3 seconds before navigating to the home screen
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD), // Light Bluish
              Color(0xFFFFF8E1), // Creamish
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo with curved corners and shadow
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.asset(
                      'assets/Splash Logo.png', // Make sure this path is correct
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '10,000+ questions. Zero cost!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0D47A1), // Darker blue for better contrast
                    ),
                  ),
                ),
                if (!_isConnected) ...[
                  const SizedBox(height: 32),
                  const Text(
                    'No internet connection.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _checkInternetAndNavigate,
                    child: const Text('Try Again'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
