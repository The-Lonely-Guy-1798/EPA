// lib/data/ssc_chsl/ssc_chsl_exam_pattern.dart

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

final List<ExamPatternTier> sscChslExamPattern = [
  ExamPatternTier(
    tierTitle: 'Tier-I (Objective Multiple Choice)',
    patternRows: [
      ExamPatternRow(subject: 'General Intelligence', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'General Awareness', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'Quantitative Aptitude', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'English Language', questions: '25', marks: '50'),
    ],
    totalMarks: '200',
    totalDuration: '60 Minutes',
    description: 'Negative marking of 0.50 for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Tier-II (Objective & Skill Test)',
    patternRows: [
      ExamPatternRow(subject: 'Session 1 (Math & Reasoning)', questions: '60', marks: '180'),
      ExamPatternRow(subject: 'Session 1 (English & GA)', questions: '60', marks: '180'),
      ExamPatternRow(subject: 'Session 2 (Computer Knowledge)', questions: '15', marks: '45'),
      ExamPatternRow(subject: 'Session 2 (Skill/Typing Test)', questions: '-', marks: 'Qualifying'),
    ],
    totalMarks: '405 + Qualifying',
    totalDuration: '2 Hours 15 Minutes for Session 1',
    description: 'Tier II consists of different sessions and modules. Negative marking applies.',
  ),
];
