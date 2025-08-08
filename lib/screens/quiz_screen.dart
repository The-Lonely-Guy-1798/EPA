import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

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
      setState(() {
        _quizFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.quizName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Finished!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Your score: $_correctAnswers / ${widget.questions.length}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Go to Home Screen'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = widget.questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.quizName} - Question ${_currentQuestionIndex + 1}/${widget.questions.length}'),
      ),
      body: SingleChildScrollView(
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
                child: Text(
                  currentQuestion.questionText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(currentQuestion.options.length, (index) {
              return OptionTile(
                option: currentQuestion.options[index],
                index: index,
                selectedOptionIndex: _selectedOptionIndex,
                correctAnswerIndex: currentQuestion.correctAnswerIndex,
                onTap: _answerSelected ? null : () => _checkAnswer(index),
              );
            }),
            const SizedBox(height: 24),
            if (_answerSelected)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(
                    _currentQuestionIndex < widget.questions.length - 1
                        ? 'Next Question'
                        : 'Finish Quiz'),
              ),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String option;
  final int index;
  final int? selectedOptionIndex;
  final int correctAnswerIndex;
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.option,
    required this.index,
    required this.selectedOptionIndex,
    required this.correctAnswerIndex,
    required this.onTap,
  });

  Color _getTileColor() {
    if (selectedOptionIndex == null) {
      return Colors.white;
    }
    if (index == selectedOptionIndex) {
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
        leading: _getIcon() != null
            ? Icon(
                _getIcon(),
                color: index == correctAnswerIndex ? Colors.green : Colors.red,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
