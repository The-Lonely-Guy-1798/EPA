// lib/data/isro/isro_exam_pattern.dart

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

final List<ExamPatternTier> isroExamPattern = [
  ExamPatternTier(
    tierTitle: 'ISRO Scientist/Engineer Written Test',
    patternRows: [
      ExamPatternRow(subject: 'Core Engineering Discipline', questions: '80', marks: '240'),
    ],
    totalMarks: '240',
    totalDuration: '90 Minutes',
    description: 'The test consists of objective type questions. Each question carries 3 marks. There is a negative marking of 1 mark for each wrong answer. Candidates who clear the written test will be called for an interview.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '100',
    totalDuration: '-',
    description: 'The final selection is based on a 50-50 weightage of the written test score and the interview score.',
  ),
];
