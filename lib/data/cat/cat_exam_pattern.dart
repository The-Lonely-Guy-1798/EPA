// lib/data/cat/cat_exam_pattern.dart

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

/// The actual exam pattern data for the CAT exam.
final List<ExamPatternTier> catExamPattern = [
  ExamPatternTier(
    tierTitle: 'CAT (Common Admission Test)',
    patternRows: [
      ExamPatternRow(
        subject: 'Verbal Ability & Reading Comprehension (VARC)',
        marks: '72',
        questions: '24',
      ),
      ExamPatternRow(
        subject: 'Data Interpretation & Logical Reasoning (DILR)',
        marks: '60',
        questions: '20',
      ),
      ExamPatternRow(
        subject: 'Quantitative Ability (QA)',
        marks: '66',
        questions: '22',
      ),
    ],
    totalMarks: '198',
    totalDuration: '120 Minutes (40 mins per section)',
    description:
        'Note: Each correct answer carries 3 marks. There is a negative marking of 1 mark for each wrong MCQ answer. No negative marking for non-MCQs.',
  ),
];
