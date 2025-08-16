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
    scaffoldBackgroundColor: const Color(0xFFF8F5F1), // A warm off-white color
    // Define a custom color scheme based on the primary gradient colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6A1B9A), // A primary seed color
      brightness: Brightness.light,
      primary: const Color(0xFF673AB7),
      secondary: const Color(0xFFFFB300),
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    // Define a standard text theme.
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
      backgroundColor: Colors.transparent, // Make app bar transparent
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
      elevation: 4,
      shadowColor: const Color.fromARGB(38, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    // Define a custom theme for elevated buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 12.0)),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
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
      fillColor: Colors.white,
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
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(51, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
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

/// A reusable background widget with scattered study-related icons.
class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: StudyIconsPainter(),
          ),
        ),
        child,
      ],
    );
  }
}

/// A custom painter to draw faint, scattered study-related icons.
class StudyIconsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withAlpha(30) // Made icons darker
      ..style = PaintingStyle.fill;

    // List of icons with updated sizes, more random positions, and rotation
    final iconsToDraw = [
      {'icon': Icons.school_outlined, 'size': 80.0, 'offset': const Offset(0.1, 0.15), 'rotation': -0.2},
      {'icon': Icons.edit_note, 'size': 100.0, 'offset': const Offset(0.85, 0.05), 'rotation': 0.1},
      {'icon': Icons.book_outlined, 'size': 90.0, 'offset': const Offset(0.7, 0.35), 'rotation': -0.1},
      {'icon': Icons.calculate_outlined, 'size': 85.0, 'offset': const Offset(0.2, 0.45), 'rotation': 0.3},
      {'icon': Icons.lightbulb_outline, 'size': 70.0, 'offset': const Offset(0.9, 0.6), 'rotation': 0.2},
      {'icon': Icons.bar_chart_outlined, 'size': 110.0, 'offset': const Offset(0.05, 0.75), 'rotation': -0.3},
      {'icon': Icons.functions, 'size': 75.0, 'offset': const Offset(0.8, 0.85), 'rotation': 0.15},
      {'icon': Icons.percent_outlined, 'size': 80.0, 'offset': const Offset(0.45, 0.2), 'rotation': -0.1},
      {'icon': Icons.science_outlined, 'size': 95.0, 'offset': const Offset(0.5, 0.9), 'rotation': 0.25},
      {'icon': Icons.history_edu_outlined, 'size': 85.0, 'offset': const Offset(0.3, 0.05), 'rotation': 0.1},
    ];

    for (var iconData in iconsToDraw) {
      _drawIcon(
        canvas,
        iconData['icon'] as IconData,
        Offset(size.width * (iconData['offset'] as Offset).dx, size.height * (iconData['offset'] as Offset).dy),
        iconData['size'] as double,
        iconData['rotation'] as double,
        paint,
      );
    }
  }

  void _drawIcon(Canvas canvas, IconData icon, Offset offset, double size, double rotation, Paint paint) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        color: paint.color,
      ),
    );
    textPainter.layout();

    canvas.save(); // Save the canvas state before transforming
    // Translate to the center of where the icon should be
    canvas.translate(offset.dx + size / 2, offset.dy + size / 2);
    canvas.rotate(rotation); // Rotate the canvas
    // Paint the icon, offsetting it by half its size to center it on the new origin
    textPainter.paint(canvas, Offset(-size / 2, -size / 2));
    canvas.restore(); // Restore the canvas to its original state
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
