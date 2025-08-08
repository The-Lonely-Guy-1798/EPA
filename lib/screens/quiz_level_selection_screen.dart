import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/quiz_screen.dart'; // Import the new QuizScreen

// Placeholder for quiz data files.
// You'll need to create these files.
import 'package:exam_prep_adda/data/ib_acio/quizzes/ib_acio_quiz_1.dart'; // Example quiz file

class QuizLevelSelectionScreen extends StatelessWidget {
  final String examName;
  final Map<int, String> quizzes;

  const QuizLevelSelectionScreen({
    super.key,
    required this.examName,
    required this.quizzes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$examName Quizzes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDifficultySection(
                context, 'Very Easy', Colors.green, 1, 5),
            _buildDifficultySection(context, 'Easy', Colors.lightGreen, 6, 10),
            _buildDifficultySection(context, 'Medium', Colors.yellow, 11, 15),
            _buildDifficultySection(context, 'Hard', Colors.orange, 16, 20),
            _buildDifficultySection(
                context, 'Very Hard', Colors.red, 21, 25),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultySection(BuildContext context, String title,
      Color color, int start, int end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            '$title Quizzes',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemCount: end - start + 1,
          itemBuilder: (context, index) {
            final quizNumber = start + index;
            // Get the list of questions for the specific quiz.
            // You will need to add a switch statement here to load the correct
            // quiz data file based on the examName and quizNumber.
            // This is a placeholder for now.
            List<Question> quizQuestions = [];
            if (examName == 'IB-ACIO' && quizNumber == 1) {
              quizQuestions = ibAcioQuiz1Questions;
            }

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      examName: examName,
                      quizName: quizzes[quizNumber] ?? 'Quiz $quizNumber',
                      questions: quizQuestions,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: color,
                child: Center(
                  child: Text(
                    '$quizNumber',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
