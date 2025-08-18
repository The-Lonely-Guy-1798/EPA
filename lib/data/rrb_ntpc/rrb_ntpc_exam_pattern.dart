// lib/data/rrb_ntpc/rrb_ntpc_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
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

/// A class to define the structure for a full tier of an exam pattern.
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

/// The actual exam pattern data for the RRB NTPC exam.
final List<ExamPatternTier> rrbNtpcExamPattern = [
  ExamPatternTier(
    tierTitle: '1st Stage Computer Based Test (CBT)',
    patternRows: [
      ExamPatternRow(subject: 'Mathematics', questions: '30', marks: '30'),
      ExamPatternRow(subject: 'General Intelligence and Reasoning', questions: '30', marks: '30'),
      ExamPatternRow(subject: 'General Awareness', questions: '40', marks: '40'),
    ],
    totalMarks: '100',
    totalDuration: '90 Minutes',
    description: 'This stage is of a screening nature. There is a negative marking of 1/3rd for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: '2nd Stage Computer Based Test (CBT)',
    patternRows: [
      ExamPatternRow(subject: 'Mathematics', questions: '35', marks: '35'),
      ExamPatternRow(subject: 'General Intelligence and Reasoning', questions: '35', marks: '35'),
      ExamPatternRow(subject: 'General Awareness', questions: '50', marks: '50'),
    ],
    totalMarks: '120',
    totalDuration: '90 Minutes',
    description: 'Separate 2nd Stage CBT shall be taken for each of the 7th CPC Level posts. There is a negative marking of 1/3rd for each wrong answer.',
  ),
   ExamPatternTier(
    tierTitle: 'Typing Skill Test / CBAT',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: '-',
    description: 'Based on the performance in 2nd Stage CBT, candidates will be called for a Typing Skill Test (for posts like Junior Clerk cum Typist) or Computer Based Aptitude Test (CBAT) (for posts like Station Master).',
  ),
];
