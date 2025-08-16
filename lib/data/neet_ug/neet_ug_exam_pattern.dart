// lib/data/neet_ug/neet_ug_exam_pattern.dart

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

/// The actual exam pattern data for the NEET-UG exam.
final List<ExamPatternTier> neetUgExamPattern = [
  ExamPatternTier(
    tierTitle: 'NEET-UG Examination',
    patternRows: [
      ExamPatternRow(subject: 'Physics', questions: '45', marks: '180'),
      ExamPatternRow(subject: 'Chemistry', questions: '45', marks: '180'),
      ExamPatternRow(subject: 'Botany', questions: '45', marks: '180'),
      ExamPatternRow(subject: 'Zoology', questions: '45', marks: '180'),
    ],
    totalMarks: '720',
    totalDuration: '3 Hours',
    description: 'The test consists of objective type questions with 4 options. Marking Scheme: +4 for a correct answer, -1 for a wrong answer, and 0 for unattempted questions.',
  ),
];
