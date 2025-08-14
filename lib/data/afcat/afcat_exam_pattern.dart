// lib/data/afcat/afcat_exam_pattern.dart

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

/// The actual exam pattern data for the AFCAT exam.
final List<ExamPatternTier> afcatExamPattern = [
  ExamPatternTier(
    tierTitle: 'AFCAT (Air Force Common Admission Test)',
    patternRows: [
      ExamPatternRow(
        subject: 'General Awareness',
        marks: '75',
        questions: '25',
      ),
      ExamPatternRow(
        subject: 'Verbal Ability in English',
        marks: '75',
        questions: '25',
      ),
      ExamPatternRow(
        subject: 'Numerical Ability',
        marks: '54',
        questions: '18',
      ),
      ExamPatternRow(
        subject: 'Reasoning and Military Aptitude Test',
        marks: '96',
        questions: '32',
      ),
    ],
    totalMarks: '300',
    totalDuration: '2 Hours',
    description:
        'Note: Each question carries 3 marks. There is a negative marking of 1 mark for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'EKT (Engineering Knowledge Test)',
    description:
        'This test is only for candidates who apply for the technical branch.',
    patternRows: [
      ExamPatternRow(
        subject: 'Mechanical, Computer Science, and Electrical & Electronics',
        marks: '150',
        questions: '50',
      ),
    ],
    totalMarks: '150',
    totalDuration: '45 Minutes',
  ),
];
