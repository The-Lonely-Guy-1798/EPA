// lib/data/ssc_gd_constable/ssc_gd_constable_exam_pattern.dart

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

final List<ExamPatternTier> sscGdConstableExamPattern = [
  ExamPatternTier(
    tierTitle: 'Computer Based Examination (CBE)',
    patternRows: [
      ExamPatternRow(subject: 'General Intelligence & Reasoning', questions: '20', marks: '40'),
      ExamPatternRow(subject: 'General Knowledge & Awareness', questions: '20', marks: '40'),
      ExamPatternRow(subject: 'Elementary Mathematics', questions: '20', marks: '40'),
      ExamPatternRow(subject: 'English/Hindi', questions: '20', marks: '40'),
    ],
    totalMarks: '160',
    totalDuration: '60 Minutes',
    description: 'Negative marking of 0.50 marks for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Physical Efficiency Test (PET) & Physical Standard Test (PST)',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: '-',
    description: 'Based on performance in CBE, candidates are shortlisted for PET/PST.',
  ),
];
