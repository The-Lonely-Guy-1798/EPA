// lib/data/gpsc/gpsc_exam_pattern.dart

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

final List<ExamPatternTier> gpscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Studies-I', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-II', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '400',
    description: 'Both papers are objective type.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Gujarati', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'English', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'Essay', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-I', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-II', marks: '150', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies-III', marks: '150', duration: '3 Hours'),
    ],
    totalMarks: '900',
    description: 'All papers are descriptive in nature.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '100',
    description: 'Candidates qualifying the Main exam will be called for an interview.',
  ),
];
