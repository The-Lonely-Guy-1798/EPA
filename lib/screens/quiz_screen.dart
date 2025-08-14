import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:exam_prep_adda/screens/quiz_analysis_screen.dart'; // Import the new analysis screen
import 'dart:async'; // Required for the Timer class
import 'dart:math'; // Required for the ceil function
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets
import 'package:exam_prep_adda/services/progress_service.dart'; // Import the progress service

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
    _userAnswers.addAll(List<int?>.filled(widget.questions.length, null));
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
    if (totalTime <= 600) {
      return 60; // For quizzes up to 10 minutes, warning at 1 minute
    } else {
      return 180; // For quizzes longer than 10 minutes, warning at 3 minutes
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
    // Only allow the user to select an answer if they haven't already
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
      _handleFinishAttempt();
    }
  }

  /// Skips the current question and moves to the next one.
  void _skipQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _handleFinishAttempt();
    }
  }

  /// Jumps to a specific question index.
  void _jumpToQuestion(int questionIndex) {
    if (questionIndex >= 0 && questionIndex < widget.questions.length) {
      setState(() {
        _currentQuestionIndex = questionIndex;
      });
    }
  }

  /// Checks for skipped questions before finishing the quiz.
  void _handleFinishAttempt() {
    final skippedQuestionIndexes = <int>[];
    for (int i = 0; i < _userAnswers.length; i++) {
      if (_userAnswers[i] == null) {
        skippedQuestionIndexes.add(i);
      }
    }

    if (skippedQuestionIndexes.isNotEmpty && mounted) {
      _showSkippedQuestionsDialog(skippedQuestionIndexes);
    } else {
      _finishQuiz();
    }
  }

  /// Shows a dialog to the user if they have skipped questions.
  void _showSkippedQuestionsDialog(List<int> skippedIndexes) {
    final skippedQuestionNumbers = skippedIndexes.map((i) => i + 1).toList();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Skipped Questions'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('You have skipped the following questions:'),
                const SizedBox(height: 8),
                Text(
                  skippedQuestionNumbers.join(', '),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Do you want to go back or finish the quiz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
                _jumpToQuestion(skippedIndexes.first);
              },
            ),
            ElevatedButton(
              child: const Text('Finish Anyway'),
              onPressed: () {
                Navigator.of(context).pop();
                _finishQuiz();
              },
            ),
          ],
        );
      },
    );
  }

  /// This method is called when the quiz ends.
  /// It calculates the score and saves it to the device using ProgressService.
  void _finishQuiz() {
    _timer.cancel();
    _saveQuizResult(); // Save the score
    if (mounted) {
      setState(() {
        _quizFinished = true;
      });
    }
  }

  /// Calculates the final score and uses the ProgressService to save it locally.
  Future<void> _saveQuizResult() async {
    int correctAnswers = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (_userAnswers[i] == widget.questions[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }
    final totalQuestions = widget.questions.length;
    if (totalQuestions > 0) {
      final scorePercentage = (correctAnswers / totalQuestions) * 100;
      // Use the service to save the score
      await ProgressService.saveQuizScore(
        widget.examName,
        widget.quizName,
        scorePercentage,
      );
      // Also, mark this quiz as completed
      await ProgressService.saveCompletionStatus(
        widget.examName,
        widget.quizName,
      );
    }
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
    int notAttempted = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (_userAnswers[i] == null) {
        notAttempted++;
      } else if (_userAnswers[i] == widget.questions[i].correctAnswerIndex) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    }

    final totalQuestions = widget.questions.length;
    final scorePercentage = totalQuestions > 0
        ? (correctAnswers / totalQuestions) * 100
        : 0.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Practice Set Complete!',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: AnimatedPieChart(
                    correctAnswers: correctAnswers,
                    incorrectAnswers: incorrectAnswers,
                    totalQuestions: totalQuestions,
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
                const SizedBox(height: 24),
                // Display quiz statistics
                _buildQuizStats(correctAnswers, incorrectAnswers, notAttempted),
                const SizedBox(height: 24),
                // Native Ad Placeholder at the very bottom
                const NativeAdPlaceholder(),
                // A SizedBox is used here to provide a final gap and padding at the bottom of the screen.
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizStats(int correct, int incorrect, int notAttempted) {
    final totalQuestions = widget.questions.length;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
          children: [
            TableRow(
              children: [
                const Text(
                  'Correctly Attempted:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$correct/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  'Wrongly Attempted:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$incorrect/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Text(
                  'Not Attempted:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$notAttempted/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                  color: _timeLeft <= _warningTimeInSeconds
                      ? Colors.red
                      : Colors.black,
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
                );
              }),
              const SizedBox(height: 24),
              // Row for Skip and Next buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: _skipQuestion,
                    child: const Text('Skip'),
                  ),
                  ElevatedButton(
                    onPressed: _userAnswers[_currentQuestionIndex] != null
                        ? _nextQuestion
                        : null,
                    child: Text(
                      _currentQuestionIndex == widget.questions.length - 1
                          ? 'Finish'
                          : 'Next',
                    ),
                  ),
                ],
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

// Helper widget for displaying options without revealing correctness
class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.index,
    required this.selectedOptionIndex,
    required this.onTap,
  });

  final String option;
  final int index;
  final int? selectedOptionIndex;
  final VoidCallback onTap;

  Color _getTileColor(BuildContext context) {
    // Only show a color change for the selected option, no red or green
    return selectedOptionIndex == index
        ? Theme.of(context).colorScheme.primary.withAlpha((255 * 0.5).round())
        : Colors.white;
  }

  Color _getTextColor() {
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: _getTileColor(context),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(color: _getTextColor(), fontWeight: FontWeight.w500),
        ),
        leading: selectedOptionIndex == index
            ? Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}

// Animated pie chart widget
class AnimatedPieChart extends StatefulWidget {
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalQuestions;

  const AnimatedPieChart({
    super.key,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalQuestions,
  });

  @override
  State<AnimatedPieChart> createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: PieChart3DPainter(
            animationValue: _animation.value,
            correctAnswers: widget.correctAnswers,
            incorrectAnswers: widget.incorrectAnswers,
            totalQuestions: widget.totalQuestions,
          ),
        );
      },
    );
  }
}

// CustomPainter for a 3D-style pie chart with separation
class PieChart3DPainter extends CustomPainter {
  final double animationValue;
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalQuestions;

  PieChart3DPainter({
    required this.animationValue,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalQuestions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (totalQuestions == 0) return; // Avoid division by zero

    final correctPercentage = correctAnswers / totalQuestions;
    final incorrectPercentage = incorrectAnswers / totalQuestions;
    final notAttemptedPercentage =
        (totalQuestions - correctAnswers - incorrectAnswers) / totalQuestions;

    final correctSweepAngle = (2 * pi * correctPercentage);
    final incorrectSweepAngle = (2 * pi * incorrectPercentage);
    final notAttemptedSweepAngle = (2 * pi * notAttemptedPercentage);

    double currentStartAngle = -pi / 2;
    const double gapAngle = 0.04; // Small gap between slices

    final slices = <_SliceData>[];

    // Correct slice
    if (correctPercentage > 0) {
      slices.add(
        _SliceData(
          startAngle: currentStartAngle,
          sweepAngle: correctSweepAngle,
          color: Colors.green.shade600,
          sideColor: Colors.green.shade800,
          isExtruded: false,
        ),
      );
      currentStartAngle += correctSweepAngle;
    }

    // Incorrect slice - This one will be extruded
    if (incorrectPercentage > 0) {
      slices.add(
        _SliceData(
          startAngle: currentStartAngle,
          sweepAngle: incorrectSweepAngle,
          color: Colors.red.shade600,
          sideColor: Colors.red.shade800,
          isExtruded: true,
        ),
      );
      currentStartAngle += incorrectSweepAngle;
    }

    // Not attempted slice
    if (notAttemptedPercentage > 0) {
      slices.add(
        _SliceData(
          startAngle: currentStartAngle,
          sweepAngle: notAttemptedSweepAngle,
          color: Colors.grey.shade600,
          sideColor: Colors.grey.shade800,
          isExtruded: false,
        ),
      );
    }

    // Sort the slices by end angle to draw them in the correct order for a 3D effect.
    slices.sort(
      (a, b) =>
          (b.startAngle + b.sweepAngle).compareTo(a.startAngle + a.sweepAngle),
    );

    for (final slice in slices) {
      _drawSlice(
        canvas,
        size,
        slice.startAngle,
        slice.sweepAngle,
        slice.color,
        slice.sideColor,
        slice.isExtruded,
        gapAngle,
      );
    }
  }

  void _drawSlice(
    Canvas canvas,
    Size size,
    double startAngle,
    double sweepAngle,
    Color topColor,
    Color sideColor,
    bool isExtruded,
    double gapAngle,
  ) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    const tiltOffset = 15.0; // Adjust for tilt effect
    const extrusionOffset = 10.0; // Offset for the extruded slice

    // Apply animation and gap
    final animatedSweep = sweepAngle * animationValue;
    final animatedStart = startAngle;

    final centerOffset = isExtruded
        ? Offset(
            extrusionOffset * cos(animatedStart + animatedSweep / 2),
            extrusionOffset * sin(animatedStart + animatedSweep / 2),
          )
        : Offset.zero;

    // Draw the side/bottom part of the slice (for 3D effect)
    final sidePaint = Paint()..color = sideColor;
    final path = Path();
    path.moveTo(center.dx + centerOffset.dx, center.dy + centerOffset.dy);
    path.lineTo(
      center.dx + centerOffset.dx + radius * cos(animatedStart + gapAngle / 2),
      center.dy +
          centerOffset.dy +
          radius * sin(animatedStart + gapAngle / 2) +
          tiltOffset,
    );
    path.arcTo(
      Rect.fromCircle(
        center: Offset(
          center.dx + centerOffset.dx,
          center.dy + centerOffset.dy + tiltOffset,
        ),
        radius: radius,
      ),
      animatedStart + gapAngle / 2,
      animatedSweep - gapAngle,
      false,
    );
    path.lineTo(
      center.dx +
          centerOffset.dx +
          radius * cos(animatedStart + animatedSweep - gapAngle / 2),
      center.dy +
          centerOffset.dy +
          radius * sin(animatedStart + animatedSweep - gapAngle / 2) +
          tiltOffset,
    );
    path.lineTo(
      center.dx + centerOffset.dx,
      center.dy + centerOffset.dy + tiltOffset,
    );
    path.close();
    canvas.drawPath(path, sidePaint);

    // Draw the top part of the slice
    final topPaint = Paint()..color = topColor;
    canvas.drawArc(
      Rect.fromCircle(center: center + centerOffset, radius: radius),
      animatedStart + gapAngle / 2,
      animatedSweep - gapAngle,
      true,
      topPaint,
    );
  }

  @override
  bool shouldRepaint(covariant PieChart3DPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.correctAnswers != correctAnswers ||
        oldDelegate.incorrectAnswers != incorrectAnswers ||
        oldDelegate.totalQuestions != totalQuestions;
  }
}

// A helper class to hold slice data
class _SliceData {
  final double startAngle;
  final double sweepAngle;
  final Color color;
  final Color sideColor;
  final bool isExtruded;

  _SliceData({
    required this.startAngle,
    required this.sweepAngle,
    required this.color,
    required this.sideColor,
    required this.isExtruded,
  });
}
