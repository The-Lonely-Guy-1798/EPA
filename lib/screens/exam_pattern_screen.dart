import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

// Placeholder screen for the Exam Pattern
class ExamPatternScreen extends StatelessWidget {
  final String examName;

  const ExamPatternScreen({super.key, required this.examName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$examName Exam Pattern'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // This is where the actual exam pattern content would go.
              const Text('Content for the Exam Pattern will be displayed here.'),
              const SizedBox(height: 16),
              const NativeAdPlaceholder(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
