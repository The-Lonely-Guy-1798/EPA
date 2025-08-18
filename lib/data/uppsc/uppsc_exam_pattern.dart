// lib/data/uppsc/uppsc_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
class ExamPatternRow {
  final String subject;
  final String marks;
  final String questions;
  final String duration;

  ExamPatternRow({
    required this.subject,
    required this.marks,
    required this.questions,
    required this.duration,
  });
}

/// A class to define the structure for a full tier of an exam pattern.
class ExamPatternTier {
  final String tierTitle;
  final List<ExamPatternRow> patternRows;
  final String totalMarks;
  final String description;

  ExamPatternTier({
    required this.tierTitle,
    required this.patternRows,
    required this.totalMarks,
    this.description = '',
  });
}

/// The actual exam pattern data for the UPPSC exam.
final List<ExamPatternTier> uppscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: General Studies-I', questions: '150', marks: '200', duration: '2 Hours'),
      ExamPatternRow(subject: 'Paper II: General Studies-II (CSAT)', questions: '100', marks: '200', duration: '2 Hours'),
    ],
    totalMarks: '400',
    description: 'Paper-II is a qualifying paper with minimum qualifying marks fixed at 33%. Negative marking of 1/3rd for wrong answers.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Written)',
    patternRows: [
      ExamPatternRow(subject: 'General Hindi', questions: '-', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'Essay', questions: '-', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-I', questions: '-', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-II', questions: '-', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-III', questions: '-', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-IV', questions: '-', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '1100',
    description: 'The Main exam is descriptive in nature.',
  ),
   ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '100',
    description: 'Candidates who qualify the Main exam will be called for a personality test/interview.',
  ),
];
