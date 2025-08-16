// lib/data/daily_questions.dart
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

// A map to hold daily questions, keyed by date in 'yyyy-MM-dd' format.
// This allows the app to pick a specific question for a specific day.
final Map<String, Question> dailyQuestions = {
  '2025-08-16': const Question(
    questionText: 'Which planet in our solar system is known as the "Morning Star" or "Evening Star"?',
    options: ['Mars', 'Venus', 'Jupiter', 'Mercury'],
    correctAnswerIndex: 1,
    explanation: 'Venus is often called the Morning Star or Evening Star because it is one of the brightest objects in the sky and is typically visible shortly before sunrise or after sunset.',
  ),
  '2025-08-17': const Question(
    questionText: 'What is the largest mammal in the world?',
    options: ['Elephant', 'Blue Whale', 'Giraffe', 'Great White Shark'],
    correctAnswerIndex: 1,
    explanation: 'The Blue Whale is the largest animal on Earth, both in terms of length and weight. It is a marine mammal.',
  ),
  '2025-08-18': const Question(
    questionText: 'In which year did the Titanic sink?',
    options: ['1905', '1912', '1918', '1923'],
    correctAnswerIndex: 1,
    explanation: 'The RMS Titanic sank in the early morning hours of April 15, 1912, in the North Atlantic Ocean after striking an iceberg.',
  ),
  // Add more questions for other dates here...
  '2025-08-21': const Question(
    questionText: 'What is the chemical symbol for water?',
    options: ['O2', 'H2O', 'CO2', 'NaCl'],
    correctAnswerIndex: 1,
    explanation: 'H2O is the chemical formula for water, indicating that one molecule of water is composed of two hydrogen (H) atoms and one oxygen (O) atom.',
  ),
};
