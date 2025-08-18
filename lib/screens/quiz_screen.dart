import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart';
import 'package:exam_prep_adda/screens/quiz_analysis_screen.dart';
import 'dart:async';
import 'dart:math';
import 'package:exam_prep_adda/screens/home_screen.dart';
import 'package:exam_prep_adda/services/progress_service.dart';

// Import the new data structure from the quiz data file
import 'package:exam_prep_adda/data/ib_acio/quizzes/ib_acio_quiz_1.dart';

class QuizScreen extends StatefulWidget {
  final String examName;
  final String quizName;
  // The screen now accepts a list of QuizSection objects
  final List<QuizSection> sections;

  const QuizScreen({
    super.key,
    required this.examName,
    required this.quizName,
    required this.sections,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  // State variables
  late List<Question> _allQuestions;
  late List<int?> _userAnswers;
  int _currentGlobalQuestionIndex = 0;
  bool _quizFinished = false;

  // Timer variables
  late Timer _timer;
  late int _totalQuizTimeInSeconds;
  late int _warningTimeInSeconds;
  int _timeLeft = 0;

  @override
  void initState() {
    super.initState();
    // Initialize controllers and flatten data
    _tabController = TabController(length: widget.sections.length, vsync: this);
    _pageController = PageController();
    _allQuestions =
        widget.sections.expand((section) => section.questions).toList();
    _userAnswers = List<int?>.filled(_allQuestions.length, null);

    // Initialize timer
    _totalQuizTimeInSeconds = _allQuestions.length * 40;
    _warningTimeInSeconds = _calculateWarningTime(_totalQuizTimeInSeconds);
    _timeLeft = _totalQuizTimeInSeconds;
    _startTimer();

    // Add listeners to sync the page view (questions) and tab bar (sections)
    _pageController.addListener(_syncPageToTab);
    _tabController.addListener(_syncTabToPage);
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.removeListener(_syncPageToTab);
    _tabController.removeListener(_syncTabToPage);
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // --- Helper Methods for Section and Question Indexing ---

  /// Gets the section index for a given global question index.
  int _getSectionIndex(int globalIndex) {
    int count = 0;
    for (int i = 0; i < widget.sections.length; i++) {
      count += widget.sections[i].questions.length;
      if (globalIndex < count) {
        return i;
      }
    }
    return widget.sections.length - 1;
  }

  /// Gets the global index from a section and a question's index within that section.
  int _getGlobalIndex(int sectionIndex, int questionIndexInSection) {
    int globalIndex = 0;
    for (int i = 0; i < sectionIndex; i++) {
      globalIndex += widget.sections[i].questions.length;
    }
    return globalIndex + questionIndexInSection;
  }

  // --- Syncing Logic for UI Controllers ---

  /// Updates the TabBar when the user swipes between questions in the PageView.
  void _syncPageToTab() {
    final page = _pageController.page?.round() ?? 0;
    if (_currentGlobalQuestionIndex != page) {
      setState(() {
        _currentGlobalQuestionIndex = page;
        final newSectionIndex = _getSectionIndex(page);
        if (_tabController.index != newSectionIndex) {
          // Temporarily remove listener to prevent a feedback loop
          _tabController.removeListener(_syncTabToPage);
          _tabController.animateTo(newSectionIndex);
          _tabController.addListener(_syncTabToPage);
        }
      });
    }
  }

  /// Jumps the PageView to the first question of a section when a tab is tapped.
  void _syncTabToPage() {
    if (!_tabController.indexIsChanging) {
      final sectionIndex = _tabController.index;
      final firstQuestionOfSection = _getGlobalIndex(sectionIndex, 0);
      _pageController.jumpToPage(firstQuestionOfSection);
    }
  }

  // --- Core Quiz Logic (Timer, Answering, Navigation) ---

  int _calculateWarningTime(int totalTime) {
    return totalTime <= 600 ? 60 : 180;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
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

  void _selectAnswer(int selectedIndex) {
    setState(() {
      if (_userAnswers[_currentGlobalQuestionIndex] == selectedIndex) {
        _userAnswers[_currentGlobalQuestionIndex] = null; // Deselect
      } else {
        _userAnswers[_currentGlobalQuestionIndex] = selectedIndex; // Select
      }
    });
  }

  void _nextQuestion() {
    if (_currentGlobalQuestionIndex < _allQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _handleFinishAttempt();
    }
  }

  void _handleFinishAttempt() {
    final skippedIndexes = [
      for (int i = 0; i < _userAnswers.length; i++)
        if (_userAnswers[i] == null) i
    ];

    if (skippedIndexes.isNotEmpty && mounted) {
      _showSkippedQuestionsDialog(skippedIndexes);
    } else {
      _finishQuiz();
    }
  }

  void _showSkippedQuestionsDialog(List<int> skippedIndexes) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Skipped Questions'),
        content: Text(
            'You have skipped questions: ${skippedIndexes.map((i) => i + 1).join(', ')}. Do you want to finish anyway?'),
        actions: [
          TextButton(
            child: const Text('Go Back'),
            onPressed: () {
              Navigator.of(ctx).pop();
              _pageController.jumpToPage(skippedIndexes.first);
            },
          ),
          ElevatedButton(
            child: const Text('Finish'),
            onPressed: () {
              Navigator.of(ctx).pop();
              _finishQuiz();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _finishQuiz() async {
    _timer.cancel();
    // Calculate and save score
    int correctAnswers = 0;
    for (int i = 0; i < _allQuestions.length; i++) {
      if (_userAnswers[i] == _allQuestions[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }
    if (_allQuestions.isNotEmpty) {
      final score = (correctAnswers / _allQuestions.length) * 100;
      await ProgressService.saveQuizScore(
          widget.examName, widget.quizName, score);
      await ProgressService.saveCompletionStatus(
          widget.examName, widget.quizName);
    }

    if (mounted) setState(() => _quizFinished = true);
  }

  // --- UI Building Methods ---

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return _buildQuizFinishedView();
    }

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
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: widget.sections
              .map((section) => Tab(text: section.sectionName))
              .toList(),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _allQuestions.length,
        itemBuilder: (context, index) {
          final question = _allQuestions[index];
          return _buildQuestionView(question, index);
        },
      ),
    );
  }

  /// Builds the view for a single question.
  Widget _buildQuestionView(Question question, int globalIndex) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${globalIndex + 1}/${_allQuestions.length}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(question.questionText,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ),
          const SizedBox(height: 24),
          ...question.options.asMap().entries.map((entry) {
            return OptionTile(
              option: entry.value,
              index: entry.key,
              selectedOptionIndex: _userAnswers[globalIndex],
              onTap: () => _selectAnswer(entry.key),
            );
          }),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(
                  globalIndex == _allQuestions.length - 1
                      ? 'Finish'
                      : 'Save & Next',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const NativeAdPlaceholder(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Builds the final summary screen shown after the quiz is finished.
  Widget _buildQuizFinishedView() {
    int correct = 0;
    int incorrect = 0;
    for (int i = 0; i < _allQuestions.length; i++) {
      if (_userAnswers[i] == _allQuestions[i].correctAnswerIndex) {
        correct++;
      } else if (_userAnswers[i] != null) {
        incorrect++;
      }
    }
    final int notAttempted = _allQuestions.length - correct - incorrect;
    final score =
        _allQuestions.isNotEmpty ? (correct / _allQuestions.length) * 100 : 0.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Practice Set Complete!',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: 32),
              SizedBox(
                height: 200,
                width: 200,
                child: AnimatedPieChart(
                  correctAnswers: correct,
                  incorrectAnswers: incorrect,
                  totalQuestions: _allQuestions.length,
                ),
              ),
              const SizedBox(height: 16),
              Text('Your Score: ${score.toStringAsFixed(2)}%',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizAnalysisScreen(
                      examName: widget.examName,
                      quizName: widget.quizName,
                      questions: _allQuestions,
                      userAnswers: _userAnswers,
                    ),
                  ),
                ),
                child: const Text('View Analysis'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to Levels'),
              ),
              const SizedBox(height: 24),
              _buildQuizStats(correct, incorrect, notAttempted),
              const SizedBox(height: 16),
              _buildSectionalStats(), // Sectional stats table added here
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the statistics table for the quiz summary.
  Widget _buildQuizStats(int correct, int incorrect, int notAttempted) {
    final totalQuestions = _allQuestions.length;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                const Text(
                  'Correctly Attempted:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$correct/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$incorrect/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$notAttempted/$totalQuestions',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the section-wise statistics table for the quiz summary.
  Widget _buildSectionalStats() {
    List<TableRow> sectionRows = [];
    int globalIndexOffset = 0;

    // Add a header row for the sections table
    sectionRows.add(
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Section',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Score',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    // Calculate and build a row for each section
    for (var section in widget.sections) {
      int correctInSection = 0;
      for (int i = 0; i < section.questions.length; i++) {
        int currentGlobalIndex = globalIndexOffset + i;
        if (_userAnswers[currentGlobalIndex] ==
            section.questions[i].correctAnswerIndex) {
          correctInSection++;
        }
      }

      sectionRows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                section.sectionName,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '$correctInSection/${section.questions.length}',
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      );
      globalIndexOffset += section.questions.length;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1),
          },
          children: sectionRows,
        ),
      ),
    );
  }
}

// --- Helper Widgets (OptionTile, AnimatedPieChart, etc.) ---

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

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedOptionIndex == index;
    return Card(
      elevation: isSelected ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          width: 2,
        ),
      ),
      color: isSelected
          ? Theme.of(context).colorScheme.primary.withAlpha(50)
          : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title:
            Text(option, style: const TextStyle(fontWeight: FontWeight.w500)),
        leading: isSelected
            ? Icon(Icons.check_circle,
                color: Theme.of(context).colorScheme.primary)
            : Icon(Icons.circle_outlined, color: Colors.grey.shade400),
        onTap: onTap,
      ),
    );
  }
}

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
    if (totalQuestions == 0) return;

    final correctPercentage = correctAnswers / totalQuestions;
    final incorrectPercentage = incorrectAnswers / totalQuestions;
    final notAttemptedPercentage =
        (totalQuestions - correctAnswers - incorrectAnswers) / totalQuestions;

    final correctSweepAngle = (2 * pi * correctPercentage);
    final incorrectSweepAngle = (2 * pi * incorrectPercentage);
    final notAttemptedSweepAngle = (2 * pi * notAttemptedPercentage);

    double currentStartAngle = -pi / 2;
    const double gapAngle = 0.04;

    final slices = [
      if (correctPercentage > 0)
        _SliceData(
          startAngle: currentStartAngle,
          sweepAngle: correctSweepAngle,
          color: Colors.green.shade600,
        ),
      if (incorrectPercentage > 0)
        _SliceData(
          startAngle: currentStartAngle + correctSweepAngle,
          sweepAngle: incorrectSweepAngle,
          color: Colors.red.shade600,
        ),
      if (notAttemptedPercentage > 0)
        _SliceData(
          startAngle:
              currentStartAngle + correctSweepAngle + incorrectSweepAngle,
          sweepAngle: notAttemptedSweepAngle,
          color: Colors.grey.shade600,
        ),
    ];

    for (final slice in slices) {
      _drawSlice(
          canvas, size, slice.startAngle, slice.sweepAngle, slice.color, gapAngle);
    }
  }

  void _drawSlice(Canvas canvas, Size size, double startAngle,
      double sweepAngle, Color color, double gapAngle) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    const tiltOffset = 15.0;

    final animatedSweep = sweepAngle * animationValue;

    // Draw the side/bottom part
    final sidePaint = Paint()..color = color.withOpacity(0.7);
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(
          center.dx + radius * cos(startAngle + gapAngle / 2),
          center.dy +
              radius * sin(startAngle + gapAngle / 2) +
              tiltOffset)
      ..arcTo(
        Rect.fromCircle(
            center: Offset(center.dx, center.dy + tiltOffset),
            radius: radius),
        startAngle + gapAngle / 2,
        animatedSweep - gapAngle,
        false,
      )
      ..lineTo(
          center.dx + radius * cos(startAngle + animatedSweep - gapAngle / 2),
          center.dy +
              radius * sin(startAngle + animatedSweep - gapAngle / 2) +
              tiltOffset)
      ..lineTo(center.dx, center.dy + tiltOffset)
      ..close();
    canvas.drawPath(path, sidePaint);

    // Draw the top part
    final topPaint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + gapAngle / 2,
      animatedSweep - gapAngle,
      true,
      topPaint,
    );
  }

  @override
  bool shouldRepaint(covariant PieChart3DPainter oldDelegate) => true;
}

class _SliceData {
  final double startAngle;
  final double sweepAngle;
  final Color color;
  _SliceData(
      {required this.startAngle,
      required this.sweepAngle,
      required this.color});
}
