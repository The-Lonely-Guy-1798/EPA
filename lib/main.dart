import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/splash_screen.dart'; // Import the new splash screen
import 'package:exam_prep_adda/utils/app_theme.dart'; // Import the new theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Prep Hub',
      // Apply the new custom theme here
      theme: AppTheme.lightTheme,
      home: const SplashScreen(), // Set the splash screen as the initial route
    );
  }
}
