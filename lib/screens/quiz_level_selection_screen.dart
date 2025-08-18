import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/quiz_screen.dart'; // Import the new QuizScreen
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets
import 'package:exam_prep_adda/services/progress_service.dart'; // Import the progress service

// Import the new section-based quiz data file.
import 'package:exam_prep_adda/data/ib_acio/quizzes/ib_acio_quiz_1.dart';

class QuizLevelSelectionScreen extends StatefulWidget {
  final String examName;
  final Map<int, String> quizzes;

  const QuizLevelSelectionScreen({
    super.key,
    required this.examName,
    required this.quizzes,
  });

  @override
  State<QuizLevelSelectionScreen> createState() =>
      _QuizLevelSelectionScreenState();
}

class _QuizLevelSelectionScreenState extends State<QuizLevelSelectionScreen> {
  // Maps to store the completion status and scores for each quiz
  final Map<String, bool> _completionStatus = {};
  final Map<String, double?> _quizScores = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  /// Fetches the completion status and scores for all quizzes from local storage.
  Future<void> _loadProgress() async {
    for (final quizEntry in widget.quizzes.entries) {
      final quizName = quizEntry.value;
      final isCompleted =
          await ProgressService.isCompleted(widget.examName, quizName);
      final score =
          await ProgressService.getQuizScore(widget.examName, quizName);

      if (mounted) {
        setState(() {
          _completionStatus[quizName] = isCompleted;
          _quizScores[quizName] = score;
        });
      }
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the number of ads to be shown. We'll show one ad every 5 quiz cards.
    final int numberOfAds = widget.quizzes.length ~/ 5;
    // Calculate the total number of items in the grid, including quizzes and ads.
    final int totalItems = widget.quizzes.length + numberOfAds;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.examName} Practice Sets'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable internal scrolling
                    itemCount: totalItems,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                        final int quizNumber = index + 1 - (index ~/ 6);
                        final quizName =
                            widget.quizzes[quizNumber] ?? 'Quiz $quizNumber';
                        final bool isCompleted =
                            _completionStatus[quizName] ?? false;
                        final double? score = _quizScores[quizName];

                        // This is a placeholder for a list of questions.
                        // *** MODIFIED: Load the sectioned data instead of a flat list ***
                        final List<QuizSection> quizSections;
                        switch (quizNumber) {
                          case 1:
                            quizSections = ibAcioQuiz1Sections;
                            break;
                          default:
                            quizSections = [];
                        }

                        // Build the quiz card
                        return Opacity(
                          opacity: isCompleted ? 0.7 : 1.0,
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizScreen(
                                    examName: widget.examName,
                                    quizName: quizName,
                                    // *** MODIFIED: Pass the 'sections' parameter ***
                                    sections: quizSections,
                                  ),
                                ),
                              );
                              // Reload progress after returning from the quiz screen
                              _loadProgress();
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: isCompleted
                                  ? Colors.grey.shade400
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withAlpha(200),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    '$quizNumber',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  if (isCompleted)
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green.shade800,
                                        size: 24,
                                      ),
                                    ),
                                  if (score != null)
                                    Positioned(
                                      bottom: 8,
                                      child: Text(
                                        'Score: ${score.toStringAsFixed(1)}%',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
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
