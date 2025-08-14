// lib/data/ibps_rrb/ibps_rrb_exam_pattern.dart

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

final List<ExamPatternTier> ibpsRrbExamPattern = [
  ExamPatternTier(
    tierTitle: 'RRB Office Assistant & Officer Scale I (Preliminary Exam)',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning', questions: '40', marks: '40'),
      ExamPatternRow(
        subject: 'Numerical Ability / Quantitative Aptitude',
        questions: '40',
        marks: '40',
      ),
    ],
    totalMarks: '80',
    totalDuration: 'Composite time of 45 Minutes',
    description: 'This is a qualifying stage for the Main Exam.',
  ),
  ExamPatternTier(
    tierTitle: 'RRB Office Assistant (Main Exam)',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning', questions: '40', marks: '50'),
      ExamPatternRow(
        subject: 'Computer Knowledge',
        questions: '40',
        marks: '20',
      ),
      ExamPatternRow(
        subject: 'General Awareness',
        questions: '40',
        marks: '40',
      ),
      ExamPatternRow(subject: 'English / Hindi', questions: '40', marks: '40'),
      ExamPatternRow(
        subject: 'Numerical Ability',
        questions: '40',
        marks: '50',
      ),
    ],
    totalMarks: '200',
    totalDuration: 'Composite time of 2 Hours',
    description: 'Candidates can opt for either English or Hindi Language.',
  ),
  ExamPatternTier(
    tierTitle: 'RRB Officer Scale I (Main Exam)',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning', questions: '40', marks: '50'),
      ExamPatternRow(
        subject: 'Computer Knowledge',
        questions: '40',
        marks: '20',
      ),
      ExamPatternRow(
        subject: 'General Awareness',
        questions: '40',
        marks: '40',
      ),
      ExamPatternRow(subject: 'English / Hindi', questions: '40', marks: '40'),
      ExamPatternRow(
        subject: 'Quantitative Aptitude',
        questions: '40',
        marks: '50',
      ),
    ],
    totalMarks: '200',
    totalDuration: 'Composite time of 2 Hours',
    description: 'Candidates qualifying will be called for an interview.',
  ),
];
