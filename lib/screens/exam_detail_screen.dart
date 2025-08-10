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
    1: 'Very Easy Quiz 1',
    2: 'Very Easy Quiz 2',
    3: 'Very Easy Quiz 3',
    4: 'Very Easy Quiz 4',
    5: 'Very Easy Quiz 5',
    6: 'Easy Quiz 1',
    7: 'Easy Quiz 2',
    8: 'Easy Quiz 3',
    9: 'Easy Quiz 4',
    10: 'Easy Quiz 5',
    11: 'Medium Quiz 1',
    12: 'Medium Quiz 2',
    13: 'Medium Quiz 3',
    14: 'Medium Quiz 4',
    15: 'Medium Quiz 5',
    16: 'Hard Quiz 1',
    17: 'Hard Quiz 2',
    18: 'Hard Quiz 3',
    19: 'Hard Quiz 4',
    20: 'Hard Quiz 5',
    21: 'Very Hard Quiz 1',
    22: 'Very Hard Quiz 2',
    23: 'Very Hard Quiz 3',
    24: 'Very Hard Quiz 4',
    25: 'Very Hard Quiz 5',
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
              'Welcome to the $examName preparation hub!',
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
                  'Quizzes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text('Start Quiz Challenge'),
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
