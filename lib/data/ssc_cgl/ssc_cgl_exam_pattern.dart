// lib/data/ssc_cgl/ssc_cgl_exam_pattern.dart

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

final List<ExamPatternTier> sscCglExamPattern = [
  ExamPatternTier(
    tierTitle: 'Tier-I Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Intelligence & Reasoning', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'General Awareness', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'Quantitative Aptitude', questions: '25', marks: '50'),
      ExamPatternRow(subject: 'English Comprehension', questions: '25', marks: '50'),
    ],
    totalMarks: '200',
    totalDuration: '1 Hour',
    description: 'Tier-I is qualifying in nature. Negative marking of 0.50 for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Tier-II Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: Session I (Math, Reasoning)', questions: '60', marks: '180'),
      ExamPatternRow(subject: 'Paper I: Session II (English, GA)', questions: '70', marks: '210'),
      ExamPatternRow(subject: 'Paper I: Session III (Computer)', questions: '20', marks: '60'),
      ExamPatternRow(subject: 'Paper II: Statistics (for JSO)', questions: '100', marks: '200'),
      ExamPatternRow(subject: 'Paper III: General Studies (for AAO)', questions: '100', marks: '200'),
    ],
    totalMarks: 'Varies by post',
    totalDuration: '2 Hours 30 Mins for Paper I',
    description: 'Negative marking applies. Data Entry Skill Test is also part of Session III.',
  ),
];
