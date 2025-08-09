import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'dart:async'; // Required for the Timer class

class QuizScreen extends StatefulWidget {
  final String examName;
  final String quizName;
  final List<Question> questions;

  const QuizScreen({
    super.key,
    required this.examName,
    required this.quizName,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  bool _quizFinished = false;
  bool _answerSelected = false;
  int? _selectedOptionIndex;

  // Timer variables
  late Timer _timer;
  late int _totalQuizTimeInSeconds;
  late int _warningTimeInSeconds;

  @override
  void initState() {
    super.initState();
    // Calculate total time: number of questions * 40 seconds
    _totalQuizTimeInSeconds = widget.questions.length * 40;
    // Calculate the warning time based on the new rules
    _warningTimeInSeconds = _calculateWarningTime(_totalQuizTimeInSeconds);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  // Helper function to calculate the warning time based on the new conditions
  int _calculateWarningTime(int totalTime) {
    const int fiveMinutes = 300; // 5 minutes in seconds
    final int twentyPercentOfTime = (totalTime / 20).round();

    if (twentyPercentOfTime > fiveMinutes) {
      // Round up to the nearest integer minute
      return (twentyPercentOfTime / 60).ceil() * 60;
    } else {
      // Always use 5 minutes if 1/20th of the time is less than or equal to 5 minutes
      return fiveMinutes;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_totalQuizTimeInSeconds == 0) {
          // Time is up, finish the quiz
          setState(() {
            _quizFinished = true;
          });
          _timer.cancel();
        } else {
          setState(() {
            _totalQuizTimeInSeconds--;
          });
        }
      },
    );
  }

  void _checkAnswer(int selectedIndex) {
    if (!_answerSelected) {
      setState(() {
        _selectedOptionIndex = selectedIndex;
        _answerSelected = true;
        if (selectedIndex == widget.questions[_currentQuestionIndex].correctAnswerIndex) {
          _correctAnswers++;
        }
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
        _answerSelected = false;
      });
    } else {
      // If there are no more questions, finish the quiz
      _timer.cancel();
      setState(() {
        _quizFinished = true;
      });
    }
  }

  // Helper function to format the time into hh:mm:ss
  String _formatTime(int seconds) {
    final int hours = (seconds / 3600).truncate();
    final int minutes = ((seconds % 3600) / 60).truncate();
    final int remainingSeconds = seconds % 60;

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (remainingSeconds).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Finished'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You scored $_correctAnswers out of ${widget.questions.length}!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = widget.questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizName),
        actions: [
          // Display the global timer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _formatTime(_totalQuizTimeInSeconds),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _totalQuizTimeInSeconds <= _warningTimeInSeconds ? Colors.red : null,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question text
            Text(
              'Question ${ _currentQuestionIndex + 1 }/${widget.questions.length}:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              currentQuestion.questionText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),

            // Options list
            ...currentQuestion.options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              return OptionTile(
                option: option,
                index: index,
                selectedOptionIndex: _selectedOptionIndex,
                correctAnswerIndex: currentQuestion.correctAnswerIndex,
                answerSelected: _answerSelected,
                onTap: () => _checkAnswer(index),
              );
            }),
            const SizedBox(height: 24),

            // Explanation Section
            if (_answerSelected)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.lightBlue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explanation:',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentQuestion.explanation,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if (_answerSelected) const SizedBox(height: 24),

            // Next Question Button
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_answerSelected)
                    ElevatedButton(
                      onPressed: () {
                        // Handle next question or finish quiz
                        _nextQuestion();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Text(
                        (_currentQuestionIndex == widget.questions.length - 1)
                            ? 'Finish Quiz'
                            : 'Next Question',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for displaying options
class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.index,
    required this.selectedOptionIndex,
    required this.correctAnswerIndex,
    required this.answerSelected,
    required this.onTap,
  });

  final String option;
  final int index;
  final int? selectedOptionIndex;
  final int correctAnswerIndex;
  final bool answerSelected;
  final VoidCallback onTap;

  Color _getTileColor() {
    if (!answerSelected) {
      return Colors.white;
    }
    if (selectedOptionIndex == index) {
      return index == correctAnswerIndex ? Colors.green.shade100 : Colors.red.shade100;
    } else if (index == correctAnswerIndex) {
      return Colors.green.shade100;
    }
    return Colors.white;
  }

  Color _getTextColor() {
    if (selectedOptionIndex != null &&
        (index == selectedOptionIndex || index == correctAnswerIndex)) {
      return Colors.black;
    }
    return Colors.black54;
  }

  IconData? _getIcon() {
    if (selectedOptionIndex == null) {
      return null;
    }
    if (index == selectedOptionIndex) {
      return index == correctAnswerIndex ? Icons.check_circle : Icons.cancel;
    } else if (index == correctAnswerIndex) {
      return Icons.check_circle_outline;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: _getTileColor(),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(
            color: _getTextColor(),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(_getIcon()),
        onTap: answerSelected ? null : onTap,
      ),
    );
  }
}
