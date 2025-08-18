// lib/data/sbi_po/sbi_po_exam_pattern.dart

class ExamPatternRow {
  final String subject;
  final String marks;
  final String questions;
  final String duration;

  ExamPatternRow({
    required this.subject,
    required this.marks,
    required this.questions,
    required this.duration,
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

final List<ExamPatternTier> sbiPoExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'English Language', questions: '30', marks: '30', duration: '20 mins'),
      ExamPatternRow(subject: 'Quantitative Aptitude', questions: '35', marks: '35', duration: '20 mins'),
      ExamPatternRow(subject: 'Reasoning Ability', questions: '35', marks: '35', duration: '20 mins'),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description: 'The test is objective. There is a penalty for wrong answers (1/4th mark deduction).',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Objective + Descriptive)',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning & Computer Aptitude', questions: '45', marks: '60', duration: '60 mins'),
      ExamPatternRow(subject: 'Data Analysis & Interpretation', questions: '35', marks: '60', duration: '45 mins'),
      ExamPatternRow(subject: 'General/ Economy/ Banking Awareness', questions: '40', marks: '40', duration: '35 mins'),
      ExamPatternRow(subject: 'English Language', questions: '35', marks: '40', duration: '40 mins'),
      ExamPatternRow(subject: 'Descriptive Test (Letter & Essay)', questions: '2', marks: '50', duration: '30 mins'),
    ],
    totalMarks: '250',
    totalDuration: '3 Hours 30 Minutes',
    description: 'The objective test has a penalty for wrong answers. The descriptive test is qualifying.',
  ),
  ExamPatternTier(
    tierTitle: 'Psychometric Test, Group Exercise & Interview',
    patternRows: [],
    totalMarks: '50 (20 for GE + 30 for Interview)',
    totalDuration: '-',
    description: 'The psychometric test is qualifying. The final merit list is based on marks from the Main Exam and the Group Exercise & Interview.',
  ),
];
