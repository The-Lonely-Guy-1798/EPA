import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/level_selection_screen.dart';
import 'package:exam_prep_adda/screens/quiz_level_selection_screen.dart'; // Import the new quiz level selection screen
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets
import 'package:exam_prep_adda/screens/exam_syllabus_screen.dart'; // Import the new Syllabus Screen
import 'package:exam_prep_adda/screens/exam_pattern_screen.dart'; // Import the new Exam Pattern Screen

// Import all your subject-specific question data files
import 'package:exam_prep_adda/data/ib_acio/current_affairs_questions.dart';
import 'package:exam_prep_adda/data/ib_acio/general_studies_questions.dart';
import 'package:exam_prep_adda/data/ib_acio/numerical_aptitude_questions.dart';
import 'package:exam_prep_adda/data/ib_acio/reasoning_logical_aptitude_questions.dart';
import 'package:exam_prep_adda/data/ib_acio/english_questions.dart';

// You would also import files for other exams similarly:
// import 'package:exam_prep_adda/data/bank_clerk/reasoning_ability_questions.dart';
// import 'package:exam_prep_adda/data/bank_clerk/quantitative_aptitude_questions.dart';
// ... and so on for all exams and their subjects

// Define a class to represent a single question
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  const Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class ExamDetailScreen extends StatelessWidget {
  final String examName;

  const ExamDetailScreen({super.key, required this.examName});

  // A map to hold all practice questions for a given exam, grouped by topic.
  Map<String, List<Question>> getTopicsWithQuestions(String examName) {
    // This is a placeholder. You would have a switch or if-else to
    // return the correct map based on the examName.
    if (examName == 'IB-ACIO') {
      return {
        'Current Affairs': ibAcioCurrentAffairsQuestions,
        'General Studies': ibAcioGeneralStudiesQuestions,
        'Numerical Aptitude': ibAcioNumericalAptitudeQuestions,
        'Reasoning & Logical Aptitude': ibAcioReasoningLogicalAptitudeQuestions,
        'English': ibAcioEnglishQuestions,
      };
    }
    return {}; // Return an empty map for other exams
  }

  // Placeholder for quiz data. You would fetch this based on the exam.
  final Map<int, String> ibAcioQuizzes = const {
    1: 'Practice Set 1',
    2: 'Practice Set 2',
    3: 'Practice Set 3',
    4: 'Practice Set 4',
    5: 'Practice Set 5',
    6: 'Practice Set 6',
    7: 'Practice Set 7',
    8: 'Practice Set 8',
    9: 'Practice Set 9',
    10: 'Practice Set 10',
    11: 'Practice Set 11',
    12: 'Practice Set 12',
    13: 'Practice Set 13',
    14: 'Practice Set 14',
    15: 'Practice Set 15',
    
  };

  @override
  Widget build(BuildContext context) {
    final topicsWithQuestions = getTopicsWithQuestions(examName);
    final Map<int, String> quizzesForExam = examName == 'IB-ACIO' ? ibAcioQuizzes : {};

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$examName Details',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exam Header Section
            Text(
              'Start your $examName preparation!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // New buttons for Syllabus and Exam Pattern
            Row(
              children: [
                Expanded(
                  child: ExamInfoCard(
                    title: 'Exam Syllabus',
                    icon: Icons.assignment,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SyllabusScreen(examName: examName),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ExamInfoCard(
                    title: 'Exam Pattern',
                    icon: Icons.list_alt,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamPatternScreen(examName: examName),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Banner Ad Placeholder
            const BannerAdPlaceholder(),
            const SizedBox(height: 16),

            // Practice Questions Expandable Bar
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading: const Icon(Icons.question_answer,
                    color: Colors.deepPurple),
                title: const Text(
                  'Practice Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: topicsWithQuestions.keys.map((topic) {
                  return ListTile(
                    title: Text(topic),
                    onTap: () {
                      final List<Question> questions =
                          topicsWithQuestions[topic]!;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelSelectionScreen(
                            examName: examName,
                            topicName: topic,
                            questions: questions,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Quizzes Expandable Bar (New)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text(
                  'Practice Set',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text('Start Your Final Practice'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizLevelSelectionScreen(
                            examName: examName,
                            quizzes: quizzesForExam,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Native Ad Placeholder
            const NativeAdPlaceholder(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Reusable card widget for the new buttons
class ExamInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ExamInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
