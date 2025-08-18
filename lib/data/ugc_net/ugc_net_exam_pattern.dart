// lib/data/ugc_net/ugc_net_exam_pattern.dart

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

/// The actual exam pattern data for the UGC NET exam.
final List<ExamPatternTier> ugcNetExamPattern = [
  ExamPatternTier(
    tierTitle: 'UGC NET Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: Teaching & Research Aptitude', questions: '50', marks: '100'),
      ExamPatternRow(subject: 'Paper II: Subject Specific Paper', questions: '100', marks: '200'),
    ],
    totalMarks: '300',
    totalDuration: '3 Hours (without any break)',
    description: 'The test consists of objective type, multiple-choice questions. There is no negative marking for incorrect answers.',
  ),
];
