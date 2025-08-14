// lib/data/ib_acio/ib_acio_exam_pattern.dart

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

/// The actual exam pattern data for the IB-ACIO exam.
final List<ExamPatternTier> ibAcioExamPattern = [
  ExamPatternTier(
    tierTitle: 'Tier-I (Objective Type)',
    patternRows: [
      ExamPatternRow(
        subject: 'General Awareness',
        marks: '20',
        questions: '20',
      ),
      ExamPatternRow(
        subject: 'Quantitative Aptitude',
        marks: '20',
        questions: '20',
      ),
      ExamPatternRow(
        subject: 'Logical/Analytical Ability',
        marks: '20',
        questions: '20',
      ),
      ExamPatternRow(subject: 'English Language', marks: '20', questions: '20'),
      ExamPatternRow(subject: 'General Studies', marks: '20', questions: '20'),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description:
        'Note: There is a negative marking of 1/4 mark for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Tier-II (Descriptive Type)',
    description:
        'This is a descriptive paper designed to test writing and comprehension skills.',
    patternRows: [
      ExamPatternRow(subject: 'Essay Writing', marks: '30', questions: '-'),
      ExamPatternRow(
        subject: 'English Comprehension & Précis Writing',
        marks: '20',
        questions: '-',
      ),
    ],
    totalMarks: '50',
    totalDuration: '1 Hour',
  ),
  ExamPatternTier(
    tierTitle: 'Tier-III',
    description:
        'This is the final interview stage for candidates who successfully clear Tier-I and Tier-II.',
    patternRows: [
      ExamPatternRow(subject: 'Interview', marks: '100', questions: '-'),
    ],
    totalMarks: '100',
    totalDuration: '-',
  ),
];
