// lib/data/bpsc/bpsc_exam_pattern.dart

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

final List<ExamPatternTier> bpscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Studies', marks: '150', duration: '2 Hours'),
    ],
    totalMarks: '150',
    description: 'This is an objective type screening test. There is negative marking.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'General Hindi', marks: '100', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies Paper-I', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'General Studies Paper-II', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Essay', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Optional Paper', marks: '100 (MCQ)', duration: '2 Hours'),
    ],
    totalMarks: '1100 (900 for merit)',
    description: 'General Hindi is qualifying in nature (30% marks required).',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '120',
    description: 'Candidates qualifying the Main exam will be called for a personality test.',
  ),
];
