// lib/data/hpsc/hpsc_exam_pattern.dart

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

final List<ExamPatternTier> hpscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Studies', marks: '100', duration: '2 Hours'),
      ExamPatternRow(subject: 'CSAT', marks: '100', duration: '2 Hours'),
    ],
    totalMarks: '200',
    description: 'Both papers are objective. CSAT is qualifying with 33% marks required.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: English', marks: '100', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper II: Hindi', marks: '100', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper III: General Studies', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper IV: Optional Subject', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '600',
    description: 'All papers are conventional (essay) type.',
  ),
  ExamPatternTier(
    tierTitle: 'Personality Test (Viva-voce)',
    patternRows: [],
    totalMarks: '75',
    description: 'Candidates qualifying the Main exam will be called for an interview.',
  ),
];
