// lib/data/ibps_clerk/ibps_clerk_exam_pattern.dart

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

final List<ExamPatternTier> ibpsClerkExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(
        subject: 'English Language',
        questions: '30',
        marks: '30',
        duration: '20 mins',
      ),
      ExamPatternRow(
        subject: 'Numerical Ability',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
      ExamPatternRow(
        subject: 'Reasoning Ability',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description:
        'Candidates have to qualify in each of the three tests by securing minimum cut-off marks.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination',
    patternRows: [
      ExamPatternRow(
        subject: 'General/ Financial Awareness',
        questions: '50',
        marks: '50',
        duration: '35 mins',
      ),
      ExamPatternRow(
        subject: 'General English',
        questions: '40',
        marks: '40',
        duration: '35 mins',
      ),
      ExamPatternRow(
        subject: 'Reasoning Ability & Computer Aptitude',
        questions: '50',
        marks: '60',
        duration: '45 mins',
      ),
      ExamPatternRow(
        subject: 'Quantitative Aptitude',
        questions: '50',
        marks: '50',
        duration: '45 mins',
      ),
    ],
    totalMarks: '200',
    totalDuration: '160 Minutes',
    description:
        'The tests are objective. There is a penalty for wrong answers (1/4th of the mark assigned to the question).',
  ),
];
