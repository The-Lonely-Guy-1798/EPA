// lib/data/mppsc/mppsc_exam_pattern.dart

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

final List<ExamPatternTier> mppscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Studies-I', marks: '200', duration: '2 Hours'),
      ExamPatternRow(subject: 'General Studies-II (Aptitude)', marks: '200', duration: '2 Hours'),
    ],
    totalMarks: '400',
    description: 'Both papers are objective. Paper-II is qualifying in nature.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: GS-I', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper II: GS-II', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper III: GS-III', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper IV: GS-IV', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper V: General Hindi', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VI: Hindi Essay', marks: '100', duration: '2 Hours'),
    ],
    totalMarks: '1400',
    description: 'All papers are mandatory and descriptive.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '175',
    description: 'Candidates qualifying the Main exam will be called for an interview.',
  ),
];
