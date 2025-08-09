// lib/main.dart
import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart';
import 'package:exam_prep_adda/utils/app_theme.dart'; // Import the new theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Prep App',
      // Apply the new custom theme here
      theme: AppTheme.lightTheme,
      // You can also define a dark theme here if you want to support it
      // darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
