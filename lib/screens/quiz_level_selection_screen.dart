import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/quiz_screen.dart'; // Import the new QuizScreen
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

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
        flexibleSpace: const Align(
          alignment: Alignment.bottomCenter,
          child: BannerAdPlaceholder(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Select a Quiz Level:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // The list of items will now be a ListView.builder to allow for
            // a dynamic number of items including ads.
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizzes.length + (quizzes.length ~/ 5),
              itemBuilder: (context, index) {
                // Check if an ad should be placed here (after every 5 levels)
                if ((index + 1) % 6 == 0) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: NativeAdPlaceholder(),
                  );
                }

                // Adjust the index to get the correct quiz number from the map
                // The quiz numbers are 1-based, and we need to account for the ads
                int quizNumber = index + 1 - (index ~/ 6);
                
                // Get the quiz questions for the current quiz number
                final List<Question> quizQuestions;
                switch (quizNumber) {
                  case 1:
                    quizQuestions = ibAcioQuiz1Questions;
                    break;
                  // Add more cases for other quiz files here
                  default:
                    quizQuestions = [];
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
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
                      color: Theme.of(context).colorScheme.primary.withAlpha((255 * 0.8).round()),
                      child: Center(
                        child: Text(
                          '$quizNumber',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Spacing before the native ad
            const SizedBox(height: 24),
            // A SizedBox is used here to provide a final gap and padding at the bottom of the screen.
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
