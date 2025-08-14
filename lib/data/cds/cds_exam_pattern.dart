// lib/data/cds/cds_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
class ExamPatternRow {
  final String subject;
  final String marks;
  final String duration;

  ExamPatternRow({
    required this.subject,
    required this.marks,
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

/// The actual exam pattern data for the CDS exam.
final List<ExamPatternTier> cdsExamPattern = [
  ExamPatternTier(
    tierTitle:
        'For Indian Military Academy, Indian Naval Academy & Air Force Academy',
    patternRows: [
      ExamPatternRow(subject: 'English', marks: '100', duration: '2 Hours'),
      ExamPatternRow(
        subject: 'General Knowledge',
        marks: '100',
        duration: '2 Hours',
      ),
      ExamPatternRow(
        subject: 'Elementary Mathematics',
        marks: '100',
        duration: '2 Hours',
      ),
    ],
    totalMarks: '300',
    description:
        'Note: The papers are of objective type. There is a penalty for wrong answers.',
  ),
  ExamPatternTier(
    tierTitle: 'For Officers’ Training Academy',
    patternRows: [
      ExamPatternRow(subject: 'English', marks: '100', duration: '2 Hours'),
      ExamPatternRow(
        subject: 'General Knowledge',
        marks: '100',
        duration: '2 Hours',
      ),
    ],
    totalMarks: '200',
    description:
        'Note: The papers are of objective type. There is a penalty for wrong answers.',
  ),
];
