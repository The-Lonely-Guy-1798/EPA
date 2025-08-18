// lib/data/ib_acio/quizzes/ib_acio_quiz_1.dart

import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

/// A class to hold a named section of a quiz.
/// Each section contains a title and a list of questions.
class QuizSection {
  final String sectionName;
  final List<Question> questions;

  const QuizSection({required this.sectionName, required this.questions});
}

/// The new data structure for the IB-ACIO Practice Set 1.
/// It's now a list of `QuizSection` objects, where each object represents a
/// different subject area in the exam.
final List<QuizSection> ibAcioQuiz1Sections = [
  const QuizSection(
    sectionName: 'Current Affairs',
    questions: [
      Question(
        questionText: 'Which country hosted the 2025 G20 Summit?',
        options: ['India', 'Brazil', 'South Africa', 'Italy'],
        correctAnswerIndex: 1,
        explanation:
            'Brazil hosted the G20 Summit in 2025, focusing on global economic cooperation.',
      ),
      Question(
        questionText: 'What major environmental treaty was signed in early 2025?',
        options: [
          'Paris Agreement II',
          'Global Plastics Treaty',
          'Amazon Rainforest Accord',
          'Arctic Preservation Act'
        ],
        correctAnswerIndex: 1,
        explanation:
            'The Global Plastics Treaty was a significant international agreement signed in 2025 to combat plastic pollution.',
      ),
    ],
  ),
  const QuizSection(
    sectionName: 'General Studies',
    questions: [
      Question(
        questionText: 'The Indus Valley Civilization was known for its:',
        options: [
          'Iron tools',
          'Advanced urban planning',
          'Nomadic lifestyle',
          'Pyramid construction'
        ],
        correctAnswerIndex: 1,
        explanation:
            'The Indus Valley Civilization is famous for its well-planned cities and sophisticated drainage systems.',
      ),
      Question(
        questionText: 'What is the primary function of chlorophyll in plants?',
        options: [
          'Respiration',
          'Transpiration',
          'Photosynthesis',
          'Absorption of water'
        ],
        correctAnswerIndex: 2,
        explanation:
            'Chlorophyll is the green pigment in plants that absorbs sunlight for photosynthesis.',
      ),
    ],
  ),
  const QuizSection(
    sectionName: 'Numerical Aptitude',
    questions: [
      Question(
        questionText:
            'If a train travels 120 km in 2 hours, what is its speed?',
        options: ['50 km/h', '60 km/h', '70 km/h', '80 km/h'],
        correctAnswerIndex: 1,
        explanation: 'Speed = Distance / Time. Speed = 120 km / 2 hours = 60 km/h.',
      ),
    ],
  ),
  const QuizSection(
    sectionName: 'Reasoning',
    questions: [
      Question(
        questionText:
            'Which number comes next in the series: 2, 5, 10, 17, __?',
        options: ['24', '25', '26', '27'],
        correctAnswerIndex: 2,
        explanation:
            'The pattern is n^2 + 1. (1^2+1=2, 2^2+1=5, 3^2+1=10, 4^2+1=17). The next number is 5^2+1=26.',
      ),
    ],
  ),
  const QuizSection(
    sectionName: 'English',
    questions: [
      Question(
        questionText: 'What is the synonym for "ephemeral"?',
        options: ['Permanent', 'Long-lasting', 'Temporary', 'Beautiful'],
        correctAnswerIndex: 2,
        explanation:
            'Ephemeral means lasting for a very short time, so "temporary" is the correct synonym.',
      ),
    ],
  ),
];
