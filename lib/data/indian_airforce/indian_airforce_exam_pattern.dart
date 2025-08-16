// lib/data/indian_airforce/indian_airforce_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
class ExamPatternRow {
  final String subject;
  final String marks;
  final String questions;

  ExamPatternRow({
    required this.subject,
    required this.marks,
    required this.questions,
  });
}

/// A class to define the structure for a full tier of an exam pattern.
class ExamPatternTier {
  final String tierTitle;
  final List<ExamPatternRow> patternRows;
  final String totalMarks;
  final String totalDuration;
  final String description;

  ExamPatternTier({
    required this.tierTitle,
    required this.patternRows,
    required this.totalMarks,
    required this.totalDuration,
    this.description = '',
  });
}

/// The actual exam pattern data for the Indian Air Force Group X & Y exam.
final List<ExamPatternTier> indianAirforceExamPattern = [
  ExamPatternTier(
    tierTitle: 'Phase-I: Online Test (Group X)',
    patternRows: [
      ExamPatternRow(subject: 'English', questions: '20', marks: '20'),
      ExamPatternRow(subject: 'Physics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Mathematics', questions: '25', marks: '25'),
    ],
    totalMarks: '70',
    totalDuration: '60 Minutes',
    description: 'Marking Scheme: +1 for a correct answer, 0 for unattempted, -0.25 for a wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-I: Online Test (Group Y)',
    patternRows: [
      ExamPatternRow(subject: 'English', questions: '20', marks: '20'),
      ExamPatternRow(subject: 'Reasoning & General Awareness (RAGA)', questions: '30', marks: '30'),
    ],
    totalMarks: '50',
    totalDuration: '45 Minutes',
    description: 'Marking Scheme: +1 for a correct answer, 0 for unattempted, -0.25 for a wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-I: Online Test (Group X & Y)',
    patternRows: [
      ExamPatternRow(subject: 'English', questions: '20', marks: '20'),
      ExamPatternRow(subject: 'Physics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Reasoning & General Awareness (RAGA)', questions: '30', marks: '30'),
    ],
    totalMarks: '100',
    totalDuration: '85 Minutes',
    description: 'This is a single combined test for candidates applying for both groups.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-II: Physical Fitness Test (PFT) & Medicals',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: '-',
    description: 'Candidates who clear Phase-I will be called for PFT, which includes a 1.6 km run, push-ups, sit-ups, and squats. This is followed by a medical examination.',
  ),
];
