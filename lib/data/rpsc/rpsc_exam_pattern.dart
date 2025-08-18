// lib/data/rpsc/rpsc_exam_pattern.dart

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

final List<ExamPatternTier> rpscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Knowledge & General Science', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '200',
    description: 'The paper is objective type and serves as a screening test.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: General Studies-I', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper II: General Studies-II', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper III: General Studies-III', marks: '200', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper IV: General Hindi & English', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '800',
    description: 'All papers are descriptive/analytical.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '100',
    description: 'Candidates qualifying the Main exam will be called for a personality and viva-voce examination.',
  ),
];
