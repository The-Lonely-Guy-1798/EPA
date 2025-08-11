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
    // Calculate the number of ads to be shown. We'll show one ad every 5 quiz cards.
    final int numberOfAds = quizzes.length ~/ 5;
    // Calculate the total number of items in the grid, including quizzes and ads.
    final int totalItems = quizzes.length + numberOfAds;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$examName Practice Sets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerAdPlaceholder(),
            const SizedBox(height: 24),
            const Text(
              'Select the Practice Set you want to Attempt:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // The list of items is now a GridView.builder to show cards
            GridView.builder(
              shrinkWrap: true, // Use this with SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
              itemCount: totalItems,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                // Determine if this index should be an ad placeholder.
                // We place an ad every 6th item (index 5, 11, etc.)
                if ((index + 1) % 6 == 0) {
                  return const NativeAdPlaceholder();
                } else {
                  // This is a quiz card position.
                  // Calculate the actual quiz number, adjusting for the ads.
                  // For example, at index 5, there has been one ad, so the
                  // quiz number should be 5.
                  final int quizNumber = index + 1 - (index ~/ 6);
                  
                  // This is a placeholder for a list of questions.
                  // You should replace this with a dynamic method to load the correct quiz.
                  final List<Question> quizQuestions;
                  switch (quizNumber) {
                    case 1:
                      quizQuestions = ibAcioQuiz1Questions;
                      break;
                    default:
                      quizQuestions = [];
                  }
                  
                  // Build the quiz card
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
                      color: Theme.of(context).colorScheme.primary.withAlpha(200),
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
                  );
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
