// lib/data/jee_mains/jee_mains_exam_pattern.dart

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

/// The actual exam pattern data for the JEE Mains exam.
final List<ExamPatternTier> jeeMainsExamPattern = [
  ExamPatternTier(
    tierTitle: 'Paper 1: B.E./B.Tech',
    patternRows: [
      ExamPatternRow(subject: 'Physics', questions: '30 (20 MCQ + 10 Num)', marks: '100'),
      ExamPatternRow(subject: 'Chemistry', questions: '30 (20 MCQ + 10 Num)', marks: '100'),
      ExamPatternRow(subject: 'Mathematics', questions: '30 (20 MCQ + 10 Num)', marks: '100'),
    ],
    totalMarks: '300',
    totalDuration: '3 Hours',
    description: 'Marking Scheme: +4 for a correct answer, -1 for a wrong MCQ answer. No negative marking for Numerical Value questions.',
  ),
  ExamPatternTier(
    tierTitle: 'Paper 2A: B.Arch',
    patternRows: [
      ExamPatternRow(subject: 'Mathematics', questions: '30 (20 MCQ + 10 Num)', marks: '100'),
      ExamPatternRow(subject: 'Aptitude Test', questions: '50', marks: '200'),
      ExamPatternRow(subject: 'Drawing Test', questions: '2', marks: '100'),
    ],
    totalMarks: '400',
    totalDuration: '3 Hours',
    description: 'Marking Scheme for Math & Aptitude: +4 for correct, -1 for wrong MCQ. No negative marking for Numerical/Drawing.',
  ),
  ExamPatternTier(
    tierTitle: 'Paper 2B: B.Planning',
    patternRows: [
       ExamPatternRow(subject: 'Mathematics', questions: '30 (20 MCQ + 10 Num)', marks: '100'),
       ExamPatternRow(subject: 'Aptitude Test', questions: '50', marks: '200'),
       ExamPatternRow(subject: 'Planning Based Questions', questions: '25', marks: '100'),
    ],
    totalMarks: '400',
    totalDuration: '3 Hours',
    description: 'Marking Scheme for Math, Aptitude & Planning: +4 for correct, -1 for wrong MCQ. No negative marking for Numerical.',
  ),
];
