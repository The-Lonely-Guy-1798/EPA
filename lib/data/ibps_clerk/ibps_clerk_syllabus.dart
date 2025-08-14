// lib/data/ibps_clerk/ibps_clerk_syllabus.dart

/// A data structure to hold the syllabus for the IBPS Clerk exam, organized by exam stage.
final Map<String, Map<String, List<String>>> ibpsClerkSyllabus = {
  'Preliminary Exam': {
    'Reasoning': [
      'Puzzles (Seating Arrangement, Linear, Circular)',
      'Syllogism',
      'Inequality',
      'Blood Relations',
      'Coding-Decoding',
      'Direction Sense',
      'Order and Ranking',
      'Alphanumeric Series',
    ],
    'English Language': [
      'Reading Comprehension',
      'Cloze Test',
      'Error Spotting / Sentence Improvement',
      'Fill in the Blanks',
      'Para Jumbles',
      'Vocabulary (Synonyms, Antonyms)',
    ],
    'Numerical Ability': [
      'Data Interpretation (Bar, Line, Pie, Tabular)',
      'Simplification & Approximation',
      'Number Series',
      'Quadratic Equations',
      'Arithmetic Problems (Percentage, Profit & Loss, Time & Work, etc.)',
    ],
  },
  'Main Exam': {
    'Reasoning Ability & Computer Aptitude': [
      'Advanced Puzzles and Seating Arrangement',
      'Logical Reasoning (Statement & Assumption, Inference)',
      'Input-Output',
      'Data Sufficiency',
      'Basics of Computer Hardware & Software',
      'Operating Systems',
      'MS Office',
      'Internet & Networking',
    ],
    'English Language': [
      'Advanced Reading Comprehension',
      'Vocabulary based questions',
      'Grammar in depth',
      'Sentence Rearrangement',
      'Fillers (Double/Multiple)',
    ],
    'Quantitative Aptitude': [
      'Advanced Data Interpretation',
      'Data Sufficiency',
      'Quantity Based Problems',
      'Advanced Arithmetic Problems',
    ],
    'General / Financial Awareness': [
      'Current Affairs (last 6 months)',
      'Banking and Insurance Awareness',
      'Financial Awareness (Budgets, Economic Survey)',
      'Static GK (Important Days, Capitals, Currencies, etc.)',
      'Government Schemes',
    ],
  },
};
