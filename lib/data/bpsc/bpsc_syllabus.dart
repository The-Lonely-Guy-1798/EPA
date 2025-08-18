// lib/data/bpsc/bpsc_syllabus.dart

/// A data structure to hold the syllabus for the BPSC exam.
final Map<String, Map<String, List<String>>> bpcSyllabus = {
  'Preliminary Exam': {
    'General Studies': [
      'General Science',
      'Events of national and international importance',
      'History of Bihar and Indian History',
      'Geography (mainly Geography of Bihar)',
      'Indian Polity and Economy',
      'Changes in the economy of Bihar post-independence',
      'Indian National Movement and the Role of Bihar',
      'General Mental Ability',
    ],
  },
  'Main Exam': {
    'General Hindi (Qualifying)': [
      'Essay',
      'Grammar',
      'Syntax',
      'Summarisation',
    ],
    'General Studies Paper-I': [
      'Modern History of India and Indian culture',
      'Current events of national and international importance',
      'Statistical analysis, graphs and diagrams',
    ],
    'General Studies Paper-II': [
      'Indian Polity',
      'Indian economy and Geography of India',
      'The role and impact of science and technology in the development of India',
    ],
    'Essay': [
      'Essays on multiple topics, often related to Bihar-specific issues, philosophy, and current affairs.',
    ],
    'Optional Paper': [
      'Candidate has to choose one optional subject from a list of 34 subjects.',
    ],
  },
};
