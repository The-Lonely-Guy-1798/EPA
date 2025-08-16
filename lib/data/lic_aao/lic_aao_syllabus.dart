// lib/data/lic_aao/lic_aao_syllabus.dart

/// A data structure to hold the syllabus for the LIC AAO exam.
final Map<String, Map<String, List<String>>> licAaoSyllabus = {
  'Preliminary Exam': {
    'Reasoning Ability': [
      'Puzzles (Seating Arrangements, Floor, Box)',
      'Inequalities (Coded and Direct)',
      'Syllogism',
      'Input-Output',
      'Blood Relations',
      'Order and Ranking',
      'Alphanumeric Series',
      'Distance and Direction',
      'Verbal Reasoning',
    ],
    'Quantitative Aptitude': [
      'Data Interpretation (Bar, Line, Pie, Tabular, Caselet)',
      'Number Series',
      'Simplification and Approximation',
      'Quadratic Equations',
      'Data Sufficiency',
      'Arithmetic Problems (Ratio, Percentage, Profit & Loss, Time & Work, etc.)',
    ],
    'English Language': [
      'Reading Comprehension',
      'Cloze Test',
      'Fillers (Single, Double)',
      'Error Spotting & Sentence Correction',
      'Para Jumbles',
      'Vocabulary (Synonyms, Antonyms, Idioms)',
      'Sentence Connectors',
    ],
  },
  'Main Exam': {
    'Reasoning Ability': [
      'Advanced Puzzles and Seating Arrangements',
      'Critical Reasoning (Statement, Assumption, Inference, Conclusion)',
      'Machine Input-Output',
      'Advanced Syllogism',
      'Data Sufficiency',
    ],
    'General Knowledge & Current Affairs': [
      'National and International Current Affairs (last 6 months)',
      'History, Geography, Civics',
      'Indian Economy and Financial System',
      'Awards and Honors',
      'Sports News',
      'Important Days',
    ],
    'Data Analysis & Interpretation': [
      'Advanced Data Interpretation Sets',
      'Quantity Based Problems (Q1, Q2)',
      'Data Sufficiency',
      'Probability, Permutation, and Combination',
      'Advanced Arithmetic Topics',
    ],
    'Insurance and Financial Market Awareness': [
      'Insurance History and Principles',
      'Types of Insurance (Life, General)',
      'Insurance Terms and Abbreviations',
      'Regulatory Bodies (IRDAI)',
      'Financial Markets (Capital Market, Money Market)',
      'Banking Awareness and Terminology',
    ],
    'English Language (Letter Writing & Essay)': [
      'Formal Letter Writing',
      'Essay on current social, economic, or insurance-related topics',
    ],
  },
};
