// lib/data/ctet/ctet_exam_pattern.dart

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

/// The actual exam pattern data for the CTET exam.
final List<ExamPatternTier> ctetExamPattern = [
  ExamPatternTier(
    tierTitle: 'Paper I (for Classes I to V)',
    patternRows: [
      ExamPatternRow(
        subject: 'Child Development & Pedagogy',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(
        subject: 'Language I (compulsory)',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(
        subject: 'Language II (compulsory)',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(subject: 'Mathematics', marks: '30', questions: '30'),
      ExamPatternRow(
        subject: 'Environmental Studies',
        marks: '30',
        questions: '30',
      ),
    ],
    totalMarks: '150',
    totalDuration: '2.5 Hours',
    description:
        'Note: All questions are Multiple Choice Questions (MCQs). There is no negative marking.',
  ),
  ExamPatternTier(
    tierTitle: 'Paper II (for Classes VI to VIII)',
    patternRows: [
      ExamPatternRow(
        subject: 'Child Development & Pedagogy',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(
        subject: 'Language I (compulsory)',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(
        subject: 'Language II (compulsory)',
        marks: '30',
        questions: '30',
      ),
      ExamPatternRow(
        subject:
            'Mathematics and Science (for Mathematics and Science teacher)',
        marks: '60',
        questions: '60',
      ),
      ExamPatternRow(
        subject:
            'Social Studies/Social Science (for Social Studies/Social Science teacher)',
        marks: '60',
        questions: '60',
      ),
    ],
    totalMarks: '150',
    totalDuration: '2.5 Hours',
    description:
        'Note: All questions are Multiple Choice Questions (MCQs). There is no negative marking.',
  ),
];
