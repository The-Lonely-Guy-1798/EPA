// lib/data/ib_acio/quizzes/ib_acio_quiz_1.dart

import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

// This is a sample quiz with 5 questions.
// You will need to create separate files for each of the 25 quizzes.
final List<Question> ibAcioQuiz1Questions = [
  const Question(
    questionText: 'What is the capital of France?',
    options: ['London', 'Berlin', 'Paris', 'Madrid'],
    correctAnswerIndex: 2,
    explanation: 'The capital of France is Paris.',
  ),
  const Question(
    questionText: 'Which planet is known as the "Red Planet"?',
    options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
    correctAnswerIndex: 1,
    explanation: 'Mars is often called the "Red Planet" due to its reddish appearance.',
  ),
  const Question(
    questionText: 'What is the largest ocean on Earth?',
    options: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
    correctAnswerIndex: 3,
    explanation: 'The Pacific Ocean is the largest and deepest of the world\'s five oceans.',
  ),
  const Question(
    questionText: 'Who wrote the play "Hamlet"?',
    options: ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
    correctAnswerIndex: 1,
    explanation: 'William Shakespeare, an English playwright, wrote "Hamlet".',
  ),
  const Question(
    questionText: 'What is the chemical symbol for gold?',
    options: ['Au', 'Ag', 'Fe', 'Cu'],
    correctAnswerIndex: 0,
    explanation: 'The chemical symbol for gold is Au, from the Latin word for gold, "aurum".',
  ),
];
