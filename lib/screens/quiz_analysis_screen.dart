import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

class QuizAnalysisScreen extends StatelessWidget {
  final String examName;
  final String quizName;
  final List<Question> questions;
  final List<int?> userAnswers;

  const QuizAnalysisScreen({
    super.key,
    required this.examName,
    required this.quizName,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$quizName - Analysis'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswerIndex = userAnswers[index];
          final isCorrect = userAnswerIndex == question.correctAnswerIndex;

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 16.0),
            color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question text
                  Text(
                    'Question ${index + 1}: ${question.questionText}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? Colors.green.shade900 : Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // User's Answer
                  Text(
                    'Your Answer:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userAnswerIndex != null
                        ? question.options[userAnswerIndex]
                        : 'Not Attempted',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: userAnswerIndex == null
                          ? Colors.grey.shade600
                          : (isCorrect ? Colors.green.shade700 : Colors.red.shade700),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Correct Answer
                  if (userAnswerIndex != question.correctAnswerIndex)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Correct Answer:',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          question.options[question.correctAnswerIndex],
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),

                  // Explanation
                  Text(
                    'Explanation:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question.explanation,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
