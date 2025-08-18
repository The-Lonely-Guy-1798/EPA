// lib/data/upsc_ese/upsc_ese_exam_pattern.dart

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

/// The actual exam pattern data for the UPSC ESE exam.
final List<ExamPatternTier> upscEseExamPattern = [
  ExamPatternTier(
    tierTitle: 'Stage-I: Preliminary Examination (Objective)',
    patternRows: [
      ExamPatternRow(subject: 'Paper-I: General Studies & Engineering Aptitude', marks: '200', duration: '2 Hours'),
      ExamPatternRow(subject: 'Paper-II: Engineering Discipline Specific', marks: '300', duration: '3 Hours'),
    ],
    totalMarks: '500',
    description: 'This stage is for screening and qualifying for the Main Examination. Negative marking applies.',
  ),
  ExamPatternTier(
    tierTitle: 'Stage-II: Main Examination (Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Paper-I: Engineering Discipline Specific', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper-II: Engineering Discipline Specific', marks: '300', duration: '3 Hours'),
    ],
    totalMarks: '600',
    description: 'Candidates who qualify the Preliminary Exam are eligible for the Main Examination.',
  ),
  ExamPatternTier(
    tierTitle: 'Stage-III: Personality Test (Interview)',
    patternRows: [],
    totalMarks: '200',
    description: 'Candidates who qualify the Main Examination will be called for a Personality Test. Final merit is based on marks from Stage-I, Stage-II, and the Interview.',
  ),
];
