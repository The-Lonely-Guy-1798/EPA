// lib/utils/app_gradients.dart
import 'package:flutter/material.dart';

// This file defines a collection of reusable, vibrant gradients for the app.
// Using static properties makes them easily accessible from anywhere in your app.
class AppGradients {
  AppGradients._(); // Prevents instantiation of this class

  /// A primary gradient that can be used for app bars, buttons, or card backgrounds.
  /// It transitions from a deep, rich purple to a slightly lighter, vibrant purple.
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF673AB7), // Deep Purple
      Color(0xFF7E57C2), // Lighter Purple
    ],
  );

  /// A secondary gradient for buttons or accents, providing a warm, energetic feel.
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFB300), // Amber
      Color(0xFFFFD54F), // Light Amber
    ],
  );

  /// A cool, calm gradient for backgrounds or informational cards.
  static const LinearGradient coolGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4DB6AC), // Teal
      Color(0xFF80CBC4), // Light Teal
    ],
  );

  /// A subtle, clean gradient, useful for card backgrounds or dividers.
  static const LinearGradient subtleGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFE0E0E0), // Light Grey
      Color(0xFFF5F5F5), // White-ish Grey
    ],
  );
}
