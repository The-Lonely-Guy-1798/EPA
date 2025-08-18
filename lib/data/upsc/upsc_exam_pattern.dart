// lib/data/upsc/upsc_exam_pattern.dart

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

/// The actual exam pattern data for the UPSC Civil Services exam.
final List<ExamPatternTier> upscExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination (Objective Type)',
    patternRows: [
      ExamPatternRow(subject: 'General Studies Paper-I', marks: '200', duration: '2 Hours'),
      ExamPatternRow(subject: 'General Studies Paper-II (CSAT)', marks: '200', duration: '2 Hours'),
    ],
    totalMarks: '400',
    description: 'Paper-II (CSAT) is a qualifying paper with minimum qualifying marks fixed at 33%. Negative marking of 1/3rd for wrong answers.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Written & Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Paper A: Indian Language', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper B: English', marks: '300', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper I: Essay', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper II: GS-I', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper III: GS-II', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper IV: GS-III', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper V: GS-IV', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VI: Optional-I', marks: '250', duration: '3 Hours'),
      ExamPatternRow(subject: 'Paper VII: Optional-II', marks: '250', duration: '3 Hours'),
    ],
    totalMarks: '1750 (for merit)',
    description: 'Papers A & B are qualifying. Marks from Paper I to VII are counted for the final merit ranking.',
  ),
   ExamPatternTier(
    tierTitle: 'Personality Test (Interview)',
    patternRows: [],
    totalMarks: '275',
    description: 'Candidates who qualify the Main exam will be called for a personality test/interview. Final ranking is based on the total marks from the Main Exam and Interview (out of 2025).',
  ),
];
