// lib/data/gate/gate_exam_pattern.dart

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

/// The actual exam pattern data for the GATE exam.
final List<ExamPatternTier> gateExamPattern = [
  ExamPatternTier(
    tierTitle: 'GATE (Graduate Aptitude Test in Engineering)',
    patternRows: [
      ExamPatternRow(subject: 'General Aptitude', marks: '15', questions: '10'),
      ExamPatternRow(
        subject: 'Engineering Mathematics',
        marks: '13-15',
        questions: 'Varies',
      ),
      ExamPatternRow(
        subject: 'Core Engineering Discipline',
        marks: '70-72',
        questions: 'Varies',
      ),
    ],
    totalMarks: '100',
    totalDuration: '3 Hours',
    description:
        'The exam consists of MCQs, MSQs (Multiple Select Questions), and NATs (Numerical Answer Type). Negative marking applies only to MCQs (-1/3 for 1-mark questions, -2/3 for 2-mark questions).',
  ),
];
