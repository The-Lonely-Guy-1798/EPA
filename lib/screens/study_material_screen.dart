// lib/screens/study_material_screen.dart
import 'package:flutter/material.dart';
import 'package:exam_prep_adda/data/ib_acio/ib_acio_study_material_data.dart'; // Import your new data file
import 'package:exam_prep_adda/screens/topic_detail_screen.dart'; // Import the new topic detail screen
import 'package:exam_prep_adda/utils/app_theme.dart'; // Import the app theme for the background

class StudyMaterialScreen extends StatelessWidget {
  final String examName;
  final Map<String, List<StudyTopic>> studyMaterial;

  const StudyMaterialScreen({
    super.key,
    required this.examName,
    required this.studyMaterial,
  });

  @override
  Widget build(BuildContext context) {
    final subjects = studyMaterial.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$examName Study Material'),
      ),
      body: AppBackground(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            final topics = studyMaterial[subject]!;

            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading: const Icon(Icons.book, color: Colors.blueAccent),
                title: Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: topics.map((topic) {
                  return ListTile(
                    title: Text(topic.title),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopicDetailScreen(
                            topic: topic,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
