// lib/data/indian_navy_sailor/indian_navy_sailor_exam_pattern.dart

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

/// The actual exam pattern data for the Indian Navy Sailor exam.
final List<ExamPatternTier> indianNavySailorExamPattern = [
  ExamPatternTier(
    tierTitle: 'Written Exam (SSR - Senior Secondary Recruit)',
    patternRows: [
      ExamPatternRow(subject: 'English', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Science', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'General Awareness', questions: '25', marks: '25'),
    ],
    totalMarks: '100',
    totalDuration: '60 Minutes',
    description: 'The question paper will be bilingual (Hindi & English) and objective type. There is a penalty of 0.25 marks for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Written Exam (MR - Matric Recruit)',
    patternRows: [
      ExamPatternRow(subject: 'Science & Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'General Awareness', questions: '25', marks: '25'),
    ],
    totalMarks: '50',
    totalDuration: '30 Minutes',
    description: 'The question paper will be bilingual (Hindi & English) and objective type. There is a penalty of 0.25 marks for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Physical Fitness Test (PFT)',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: '-',
    description: 'Candidates who pass the written exam will undergo a PFT, which includes a 1.6 Km run, 20 squat ups (Uthak Baithak) and 10 Push-ups. This is qualifying in nature.',
  ),
];
