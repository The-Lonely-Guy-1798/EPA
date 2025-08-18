// lib/data/ssc_stenographer/ssc_stenographer_exam_pattern.dart

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

final List<ExamPatternTier> sscStenographerExamPattern = [
  ExamPatternTier(
    tierTitle: 'Computer Based Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Intelligence & Reasoning', questions: '50', marks: '50'),
      ExamPatternRow(subject: 'General Awareness', questions: '50', marks: '50'),
      ExamPatternRow(subject: 'English Language & Comprehension', questions: '100', marks: '100'),
    ],
    totalMarks: '200',
    totalDuration: '2 Hours',
    description: 'Negative marking of 0.25 marks for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Skill Test in Stenography',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: 'Varies',
    description: 'Candidates who qualify the CBE will undergo a skill test. They will be given one dictation for 10 minutes in English or Hindi at a speed of 100 w.p.m. for Stenographer Grade ‘C’ and 80 w.p.m. for Stenographer Grade ‘D’.',
  ),
];
