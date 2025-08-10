import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

// Placeholder screen for the Exam Syllabus
class SyllabusScreen extends StatelessWidget {
  final String examName;

  const SyllabusScreen({super.key, required this.examName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$examName Syllabus'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // This is where the actual exam syllabus content would go.
              Text('Content for the $examName Syllabus will go here.'),
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
