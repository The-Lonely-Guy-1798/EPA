import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Corrected import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Prep App',
      // Enable Material 3 for modern design elements
      theme: ThemeData(
        useMaterial3: true, // This should be here for Material 3
        // Define a vibrant color scheme for the app
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // A primary color for your app
          brightness: Brightness.light,
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          secondary: Colors.amber,
          onSecondary: Colors.black,
          // Corrected deprecated properties - replaced 'background' and 'onBackground'
          // with 'surface' and 'onSurface' directly, removing duplicates.
          surface: Colors.grey[100]!, // Light background for content areas
          onSurface: Colors.black87,
          error: Colors.red,
          onError: Colors.white,
        ),
        // Set the default font family for the entire app
        fontFamily: 'Inter',
        // Define app bar theme for consistent styling across all app bars
        appBarTheme: const AppBarTheme( // Added const here
          backgroundColor: Colors.deepPurple, // Consistent app bar background
          foregroundColor: Colors.white, // Consistent app bar text/icon color
          elevation: 4, // Add a subtle shadow to app bars
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // Define card theme for consistent styling of all cards
        cardTheme: CardThemeData( // Changed CardTheme to CardThemeData
          elevation: 6, // More pronounced shadow for cards
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // More rounded corners for cards
          ),
          surfaceTintColor: Colors.white, // Ensures cards are white even with Material 3
          color: Colors.white, // Explicitly set card background color
        ),
        // Define text theme for consistent typography
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
        // Visual density for adaptive platform density
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
