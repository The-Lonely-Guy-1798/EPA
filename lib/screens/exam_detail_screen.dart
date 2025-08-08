import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/level_selection_screen.dart'; // Import the new level selection screen

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
// It's good practice to put this in a shared 'models' folder if many files use it.
// For now, keeping it here as per previous context.
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex; // Index of the correct option in the options list
  final String explanation; // Explanation for the answer

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class ExamDetailScreen extends StatelessWidget {
  final String examName;

  const ExamDetailScreen({super.key, required this.examName});

  // Define practice questions for each exam and topic by referencing imported lists
  static final Map<String, Map<String, List<Question>>> examQuestions = {
    'IB-ACIO': {
      'Current Affairs': ibAcioCurrentAffairsQuestions, // Reference the imported list
      'General Studies': ibAcioGeneralStudiesQuestions, // Reference the imported list
      'Numerical Aptitude': ibAcioNumericalAptitudeQuestions,
      'Reasoning Logical Aptitude': ibAcioReasoningLogicalAptitudeQuestions,
      'English': ibAcioEnglishQuestions,
    },
    // Add other exams and their subjects here, referencing their imported lists
    'Bank-Clerk': {
      // Example for Bank-Clerk, assuming you've created and imported these files:
      // 'Reasoning Ability': bankClerkReasoningAbilityQuestions,
      // 'Quantitative Aptitude': bankClerkQuantitativeAptitudeQuestions,
      // 'English Language': bankClerkEnglishLanguageQuestions,
      // 'General Awareness': bankClerkGeneralAwarenessQuestions,
      // 'Computer Knowledge': bankClerkComputerKnowledgeQuestions,
    },
    // ... add other exams
  };

  @override
  Widget build(BuildContext context) {
    // Get the topics (subjects) for the current exam, or an empty map if not found
    final Map<String, List<Question>> topicsWithQuestions = examQuestions[examName] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(
          examName, // Display the exam name in the app bar
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the $examName Exam Page!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'Here you can find detailed information, study materials, and practice quizzes for this exam.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            // Practice Questions Expandable Bar
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading: const Icon(Icons.question_answer, color: Colors.deepPurple),
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
                      // Get the list of questions for the selected topic
                      final List<Question> questions = topicsWithQuestions[topic]!;
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
          ],
        ),
      ),
    );
  }
}
