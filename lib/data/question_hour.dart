// lib/data/question_hour.dart
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class
import 'package:intl/intl.dart';

// A map to hold hourly questions, keyed by date 'yyyy-MM-dd' and then by the hour.
// This structure allows for unique questions for each hour of each day.
final Map<String, Map<int, Question>> hourlyQuestionsPerDate = {
  // Example for August 18, 2025
  '2025-08-18': {
    6: const Question(
      questionText: 'What is the capital of Australia?',
      options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      correctAnswerIndex: 2,
      explanation:
          'Canberra is the capital city of Australia, although Sydney and Melbourne are larger cities.',
    ),
    7: const Question(
      questionText: 'Which element has the chemical symbol "O"?',
      options: ['Oxygen', 'Gold', 'Osmium', 'Zinc'],
      correctAnswerIndex: 0,
      explanation:
          'The chemical symbol for Oxygen is "O". The symbol for Gold is "Au".',
    ),
    8: const Question(
      questionText: 'Who painted the Mona Lisa?',
      options: [
        'Vincent van Gogh',
        'Pablo Picasso',
        'Leonardo da Vinci',
        'Claude Monet'
      ],
      correctAnswerIndex: 2,
      explanation:
          'The Mona Lisa was painted by the Italian artist Leonardo da Vinci.',
    ),
    9: const Question(
      questionText: 'What is the smallest prime number?',
      options: ['0', '1', '2', '3'],
      correctAnswerIndex: 2,
      explanation:
          'A prime number is a number greater than 1 that has only two divisors: 1 and itself. 2 is the smallest and only even prime number.',
    ),
    10: const Question(
      questionText: 'How many continents are there in the world?',
      options: ['5', '6', '7', '8'],
      correctAnswerIndex: 2,
      explanation:
          'There are seven continents in the world: Asia, Africa, North America, South America, Antarctica, Europe, and Australia.',
    ),
    11: const Question(
      questionText: 'What is the hardest natural substance on Earth?',
      options: ['Gold', 'Iron', 'Diamond', 'Platinum'],
      correctAnswerIndex: 2,
      explanation:
          'Diamond is the hardest known natural substance, rating 10 on the Mohs scale of hardness.',
    ),
    12: const Question(
      questionText: 'Which country is known as the Land of the Rising Sun?',
      options: ['China', 'Japan', 'Thailand', 'South Korea'],
      correctAnswerIndex: 1,
      explanation:
          'Japan is called "Nihon" or "Nippon" in Japanese, which means "the sun\'s origin," so it is often translated as the Land of the Rising Sun.',
    ),
    13: const Question(
      questionText: 'What is the main ingredient in guacamole?',
      options: ['Tomato', 'Avocado', 'Onion', 'Lime'],
      correctAnswerIndex: 1,
      explanation:
          'The primary ingredient for guacamole is ripe avocados, which give it its creamy texture and flavor.',
    ),
    14: const Question(
      questionText: 'How many sides does a hexagon have?',
      options: ['5', '6', '7', '8'],
      correctAnswerIndex: 1,
      explanation: 'A hexagon is a polygon with six sides and six angles.',
    ),
    15: const Question(
      questionText: 'What is the largest ocean on Earth?',
      options: [
        'Atlantic Ocean',
        'Indian Ocean',
        'Arctic Ocean',
        'Pacific Ocean'
      ],
      correctAnswerIndex: 3,
      explanation:
          'The Pacific Ocean is the largest and deepest of the world\'s five oceans.',
    ),
    16: const Question(
      questionText: 'In which year did World War II end?',
      options: ['1942', '1945', '1948', '1950'],
      correctAnswerIndex: 1,
      explanation:
          'World War II officially ended in 1945 after the surrender of the Axis powers.',
    ),
    17: const Question(
      questionText: 'What is the currency of the United Kingdom?',
      options: ['Euro', 'Dollar', 'Pound Sterling', 'Yen'],
      correctAnswerIndex: 2,
      explanation:
          'The official currency of the United Kingdom is the Pound Sterling (£).',
    ),
    18: const Question(
      questionText: 'Who wrote the famous play "Romeo and Juliet"?',
      options: [
        'Charles Dickens',
        'William Shakespeare',
        'Jane Austen',
        'George Orwell'
      ],
      correctAnswerIndex: 1,
      explanation:
          '"Romeo and Juliet" is a famous tragedy written by William Shakespeare.',
    ),
    19: const Question(
      questionText: 'What is the boiling point of water at sea level?',
      options: ['90°C', '100°C', '110°C', '120°C'],
      correctAnswerIndex: 1,
      explanation:
          'At standard atmospheric pressure (sea level), water boils at 100 degrees Celsius (212 degrees Fahrenheit).',
    ),
    20: const Question(
      questionText: 'Which is the longest river in the world?',
      options: ['Amazon River', 'Nile River', 'Yangtze River', 'Mississippi River'],
      correctAnswerIndex: 1,
      explanation:
          'The Nile River in Africa is traditionally considered the longest river in the world.',
    ),
    21: const Question(
      questionText: 'What is the main gas found in the air we breathe?',
      options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Argon'],
      correctAnswerIndex: 2,
      explanation:
          'Earth\'s atmosphere is composed of about 78% nitrogen, making it the most abundant gas.',
    ),
    22: const Question(
      questionText: 'How many bones are in the adult human body?',
      options: ['206', '208', '210', '212'],
      correctAnswerIndex: 0,
      explanation:
          'The adult human skeleton is composed of 206 bones.',
    ),
    23: const Question(
      questionText: 'Which festival is known as the festival of lights?',
      options: ['Holi', 'Diwali', 'Eid', 'Christmas'],
      correctAnswerIndex: 1,
      explanation:
          'Diwali, a major Hindu festival, is known as the festival of lights because people light up their houses with lamps and candles.',
    ),
    0: const Question( // For 12:00 AM Midnight
      questionText: 'What is the largest desert in the world?',
      options: ['Sahara Desert', 'Arabian Desert', 'Gobi Desert', 'Antarctic Polar Desert'],
      correctAnswerIndex: 3,
      explanation: 'The largest desert in the world is the Antarctic Polar Desert. The Sahara is the largest hot desert.',
    ),
  },
  // You can add questions for other dates here, e.g., '2025-08-19': { ... }
};

/// A helper function to get the current question of the hour.
Question? getQuestionOfTheHour() {
  final now = DateTime.now();
  final String today = DateFormat('yyyy-MM-dd').format(now);
  final int currentHour = now.hour;
  int questionKey;

  // Determine which hour's question to show.
  // From midnight (hour 0) to 5:59 AM, show the question for hour 0.
  if (currentHour >= 0 && currentHour < 6) {
    questionKey = 0;
  } else {
    // From 6 AM onwards, show the question for the current hour.
    questionKey = currentHour;
  }

  // Check if there are questions for today and for the specific hour.
  if (hourlyQuestionsPerDate.containsKey(today) &&
      hourlyQuestionsPerDate[today]!.containsKey(questionKey)) {
    return hourlyQuestionsPerDate[today]![questionKey];
  }

  // Return null if no question is available for the current date and time.
  return null;
}
