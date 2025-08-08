import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
// Removed: import 'package:exam_prep_adda/screens/level_selection_screen.dart'; // Unused import

class QuizScreen extends StatefulWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final List<Question> allQuestions; // Added to pass the full list of questions

  const QuizScreen({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.allQuestions, // Required in constructor
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
                      Text(
                        widget.question.questionText,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      ...widget.question.options.asMap().entries.map((entry) {
                        final optionIndex = entry.key;
                        final optionText = entry.value;
                        return RadioListTile<int>(
                          title: Text(optionText),
                          value: optionIndex,
                          groupValue: _selectedOptionIndex,
                          // Allow changing option if not correct or not yet checked
                          onChanged: (_answerChecked && _isCorrect)
                              ? null // Disable if already correctly answered
                              : (int? value) {
                                  setState(() {
                                    _selectedOptionIndex = value;
                                    _answerChecked = false; // Reset checked state on new selection
                                    _isCorrect = false; // Reset correctness
                                  });
                                },
                          // Highlight correct/incorrect answers after checking
                          activeColor: _answerChecked
                              ? (optionIndex == widget.question.correctAnswerIndex
                                  ? Colors.green // Correct option
                                  : (optionIndex == _selectedOptionIndex ? Colors.red : Theme.of(context).colorScheme.primary)) // Incorrect selected option
                              : Theme.of(context).colorScheme.primary,
                          tileColor: _answerChecked && optionIndex == _selectedOptionIndex
                              ? (_selectedOptionIndex == widget.question.correctAnswerIndex
                                  ? Colors.green.withAlpha((0.1 * 255).round()) // Use withAlpha for opacity
                                  : Colors.red.withAlpha((0.1 * 255).round())) // Use withAlpha for opacity
                              : null,
                        );
                      }), // Removed .toList()
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _selectedOptionIndex != null && !_isCorrect // Only allow check if an option is selected and not already correct
                      ? () {
                          setState(() {
                            _answerChecked = true; // Mark answer as checked
                            _isCorrect = (_selectedOptionIndex == widget.question.correctAnswerIndex);
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Check Answer'),
                ),
              ),
              if (_answerChecked) // Show feedback if answer has been checked
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isCorrect
                            ? 'Correct! 🎉'
                            : 'Incorrect. Please try again.', // Simplified message for wrong answer
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (_isCorrect) // Only show explanation if answer is correct
                        Text(
                          'Explanation: ${widget.question.explanation}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isCorrect && widget.questionNumber < widget.totalQuestions)
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to the next question
                                Navigator.pushReplacement( // Use pushReplacement to avoid stacking
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreen(
                                      question: widget.allQuestions[widget.questionNumber], // Next question
                                      questionNumber: widget.questionNumber + 1,
                                      totalQuestions: widget.totalQuestions,
                                      allQuestions: widget.allQuestions,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text('Next Question'),
                            ),
                          if (_isCorrect && widget.questionNumber == widget.totalQuestions)
                            ElevatedButton(
                              onPressed: () {
                                // If it's the last question and correct, go back to level selection
                                // Pop back to the LevelSelectionScreen.
                                // Find the LevelSelectionScreen in the navigation stack and pop until it.
                                // Note: If LevelSelectionScreen doesn't have a named route, this might not work as expected.
                                // A simpler pop might be needed if you're not using named routes consistently.
                                Navigator.popUntil(context, (route) => route.isFirst); // Pop to the very first route
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text('Finish Quiz'),
                            ),
                          if (!_isCorrect) // If wrong, only show "Back to Questions"
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Go back to the level selection screen
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text('Back to Questions'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
