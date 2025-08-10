import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

class PracticeQuestionsScreen extends StatefulWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final List<Question> allQuestions; // Added to pass the full list of questions

  const PracticeQuestionsScreen({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.allQuestions, // Required in constructor
  });

  @override
  State<PracticeQuestionsScreen> createState() => _PracticeQuestionsScreenState();
}

class _PracticeQuestionsScreenState extends State<PracticeQuestionsScreen> {
  int? _selectedOptionIndex; // To store the user's selected option
  bool _answerChecked = false; // To control when feedback is shown
  bool _isCorrect = false; // To track if the selected answer is correct

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${widget.questionNumber}/${widget.totalQuestions}'),
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView to make the screen scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question.questionText,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              ...widget.question.options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: _answerChecked
                          ? (index == widget.question.correctAnswerIndex)
                              ? Colors.green.withAlpha((255 * 0.8).round()) // Correct answer with alpha
                              : (_selectedOptionIndex == index)
                                  ? Colors.red.withAlpha((255 * 0.8).round()) // Wrongly selected answer with alpha
                                  : Theme.of(context).cardColor // Default color after checking
                          : _selectedOptionIndex == index
                              ? Theme.of(context).colorScheme.primary.withAlpha((255 * 0.5).round()) // Selected but not checked with alpha
                              : Theme.of(context).cardColor, // Default color
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _selectedOptionIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha((255 * 0.2).round()),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        if (!_answerChecked) {
                          setState(() {
                            _selectedOptionIndex = index;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              '${String.fromCharCode(65 + index)}. ', // A, B, C, D
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _answerChecked
                                    ? Colors.white
                                    : Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: _answerChecked
                                      ? Colors.white
                                      : Theme.of(context).textTheme.bodyLarge?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              // Check Answer Button
              if (!_answerChecked)
                Center(
                  child: ElevatedButton(
                    onPressed: _selectedOptionIndex != null
                        ? () {
                            setState(() {
                              _answerChecked = true;
                              _isCorrect = _selectedOptionIndex == widget.question.correctAnswerIndex;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Check Answer'),
                  ),
                ),

              // Feedback and Navigation
              if (_answerChecked)
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
                              color: _isCorrect ? Colors.green : Colors.red,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _isCorrect ? 'Correct!' : 'Incorrect.',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: _isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Explanation:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.question.explanation,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Find the index of the current question
                                final currentIndex = widget.allQuestions.indexOf(widget.question);
                                // Check if there's a next question
                                if (currentIndex < widget.allQuestions.length - 1) {
                                  final nextQuestion = widget.allQuestions[currentIndex + 1];
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PracticeQuestionsScreen(
                                        question: nextQuestion,
                                        questionNumber: currentIndex + 2,
                                        totalQuestions: widget.totalQuestions,
                                        allQuestions: widget.allQuestions,
                                      ),
                                    ),
                                  );
                                } else {
                                  // If there are no more questions, go back to the level selection screen
                                  Navigator.pop(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: Text(
                                (widget.questionNumber == widget.totalQuestions)
                                    ? 'Finish Practice'
                                    : 'Next Question',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              // Spacing before the native ad
              const SizedBox(height: 24),
              // Native Ad Placeholder at the very bottom
              const NativeAdPlaceholder(),
              // A SizedBox is used here to provide a final gap and padding at the bottom of the screen.
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
