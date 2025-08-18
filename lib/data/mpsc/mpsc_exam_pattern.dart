// lib/data/mpsc/mpsc_exam_pattern.dart

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

final List<ExamPatternTier> mpscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Studies Paper-I', marks: '200', duration: '2 Hours'),
      ExamPatternRow(subject: 'General Studies Paper-II (CSAT)', marks: '200', duration: '2 Hours'),
    ],
    totalMarks: '400',
    description: 'Both papers are objective. Paper-II is qualifying in nature.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive - New Pattern)',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: Marathi', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper II: English', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper III: GS-I', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper IV: GS-II', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper V: GS-III', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VI: GS-IV', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VII: Optional Paper-I', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VIII: Optional Paper-II', marks: '250', duration: '3 hours'),
    ],
    totalMarks: '1750 (for merit)',
    description: 'Language papers are qualifying. The pattern is similar to UPSC Mains.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '275',
    description: 'The final stage for candidates who clear the Main Examination.',
  ),
];
