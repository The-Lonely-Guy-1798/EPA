// lib/screens/topic_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:exam_prep_adda/data/ib_acio/ib_acio_study_material_data.dart'; // Import your data model
import 'package:exam_prep_adda/utils/app_theme.dart'; // Import the app theme for the background
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import for ad placeholders

class TopicDetailScreen extends StatelessWidget {
  final StudyTopic topic;

  const TopicDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                topic.content,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      height: 1.5, // Improved line spacing for readability
                    ),
              ),
              const SizedBox(height: 32),
              const NativeAdPlaceholder(), // Ad at the bottom
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
