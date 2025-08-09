// lib/utils/app_theme.dart
import 'package:flutter/material.dart';

import 'app_gradients.dart';

// This file defines a custom Theme for the entire app,
// ensuring a consistent and enhanced UI/UX.
class AppTheme {
  AppTheme._(); // Prevents instantiation

  static ThemeData lightTheme = ThemeData(
    // Ensure Material 3 is enabled for the latest design system
    useMaterial3: true,
    // Define a custom color scheme based on the primary gradient colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6A1B9A), // A primary seed color
      brightness: Brightness.light,
      primary: const Color(0xFF673AB7),
      secondary: const Color(0xFFFFB300),
      surface: Colors.grey[50]!, // A very light surface color
      onSurface: Colors.black87,
    ),
    // Define a standard text theme. To use the 'Inter' font,
    // you must add the google_fonts package to your pubspec.yaml.
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
    // Define a consistent App Bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEFEBE9), // A light parchment color for the app bar
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color(0xFF212121),
      ),
    ),
    // Define a custom Card theme for rounded corners and elevation
    cardTheme: CardThemeData(
      elevation: 6,
      shadowColor: const Color.fromARGB(38, 0, 0, 0), // Corrected deprecated use of withOpacity
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    // Define a custom theme for elevated buttons with gradients and animations
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 12.0)),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        // Use a MaterialStateProperty to apply a gradient background
        // This is a common pattern for dynamic styling in Flutter
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          // You could add logic here for different states (e.g., pressed)
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey.shade400;
          }
          return const Color(0xFF673AB7); // Fallback color
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    ),
    // Define input decoration theme for text fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Color(0xFF673AB7), width: 2.0),
      ),
    ),
  );
}

// A helper widget to apply a gradient background to any child widget.
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.gradient = AppGradients.primaryGradient,
  });

  final Widget child;
  final VoidCallback onPressed;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(51, 0, 0, 0), // Corrected deprecated use of withOpacity
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make button transparent to show gradient
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
