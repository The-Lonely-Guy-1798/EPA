import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/quiz_analysis_screen.dart'; // Import the new analysis screen
import 'dart:async'; // Required for the Timer class
import 'dart:math'; // Required for the ceil function

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
  bool _quizFinished = false;
  // Use a list to store the selected option for each question. null means not answered.
  final List<int?> _userAnswers = [];

  // Timer variables
  late Timer _timer;
  late int _totalQuizTimeInSeconds;
  late int _warningTimeInSeconds;
  int _timeLeft = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the user answers list with null values
    for (var i = 0; i < widget.questions.length; i++) {
      _userAnswers.add(null);
    }
    // Calculate total time: number of questions * 40 seconds
    _totalQuizTimeInSeconds = widget.questions.length * 40;
    // Calculate the warning time based on the new rules
    _warningTimeInSeconds = _calculateWarningTime(_totalQuizTimeInSeconds);
    _timeLeft = _totalQuizTimeInSeconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // New method to calculate warning time
  int _calculateWarningTime(int totalTime) {
    if (totalTime <= 180) {
      return 60; // For quizzes up to 3 minutes, warning at 1 minute
    } else {
      return 180; // For quizzes longer than 3 minutes, warning at 3 minutes
    }
  }

  // Method to start the quiz timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer.cancel();
        _finishQuiz();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _checkAnswer(int selectedIndex) {
    if (_userAnswers[_currentQuestionIndex] == null) {
      setState(() {
        _userAnswers[_currentQuestionIndex] = selectedIndex;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    _timer.cancel();
    setState(() {
      _quizFinished = true;
    });
  }

  void _goToAnalysisScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizAnalysisScreen(
          examName: widget.examName,
          quizName: widget.quizName,
          questions: widget.questions,
          userAnswers: _userAnswers,
        ),
      ),
    );
  }

  Widget _buildQuizFinishedView() {
    int correctAnswers = 0;
    int incorrectAnswers = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (_userAnswers[i] == null) {
        // do nothing
      } else if (_userAnswers[i] == widget.questions[i].correctAnswerIndex) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    }

    final totalQuestions = widget.questions.length;
    final scorePercentage = (correctAnswers / totalQuestions) * 100;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quiz Complete!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 200,
              width: 200,
              child: CustomPaint(
                painter: PieChartPainter(
                  correctAnswers: correctAnswers,
                  incorrectAnswers: incorrectAnswers,
                  totalQuestions: totalQuestions,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your Score: ${scorePercentage.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _goToAnalysisScreen,
              child: const Text('View Analysis'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return _buildQuizFinishedView();
    }

    final currentQuestion = widget.questions[_currentQuestionIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Chip(
              label: Text(
                _formatTime(_timeLeft),
                style: TextStyle(
                  color: _timeLeft <= _warningTimeInSeconds ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: _timeLeft <= _warningTimeInSeconds
                  ? Colors.red.shade100
                  : Colors.grey.shade200,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentQuestion.questionText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...currentQuestion.options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return OptionTile(
                  option: option,
                  index: index,
                  selectedOptionIndex: _userAnswers[_currentQuestionIndex],
                  onTap: () => _checkAnswer(index),
                  answerSelected: _userAnswers[_currentQuestionIndex] != null,
                  correctAnswerIndex: currentQuestion.correctAnswerIndex,
                );
              }),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _userAnswers[_currentQuestionIndex] != null
                      ? _nextQuestion
                      : null,
                  child: Text(
                    _currentQuestionIndex == widget.questions.length - 1
                        ? 'Finish Quiz'
                        : 'Next Question',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for displaying options with feedback
class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.index,
    required this.selectedOptionIndex,
    required this.onTap,
    required this.answerSelected,
    required this.correctAnswerIndex,
  });

  final String option;
  final int index;
  final int? selectedOptionIndex;
  final VoidCallback onTap;
  final bool answerSelected;
  final int correctAnswerIndex;

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
        leading: Icon(
          _getIcon(),
          color: _getIcon() == Icons.check_circle ? Colors.green : Colors.red,
        ),
        onTap: onTap,
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalQuestions;

  PieChartPainter({
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalQuestions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final correctSweepAngle = (2 * pi * correctAnswers) / totalQuestions;
    final incorrectSweepAngle = (2 * pi * incorrectAnswers) / totalQuestions;

    final correctPaint = Paint()..color = Colors.green;
    final incorrectPaint = Paint()..color = Colors.red;
    final notAttemptedPaint = Paint()..color = Colors.grey;

    double startAngle = -pi / 2;

    // Draw correct answers slice
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      correctSweepAngle,
      true,
      correctPaint,
    );
    startAngle += correctSweepAngle;

    // Draw incorrect answers slice
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      incorrectSweepAngle,
      true,
      incorrectPaint,
    );
    startAngle += incorrectSweepAngle;

    // Draw not attempted slice
    final notAttemptedAnswers = totalQuestions - correctAnswers - incorrectAnswers;
    if (notAttemptedAnswers > 0) {
      final notAttemptedSweepAngle = (2 * pi * notAttemptedAnswers) / totalQuestions;
      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        startAngle,
        notAttemptedSweepAngle,
        true,
        notAttemptedPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
