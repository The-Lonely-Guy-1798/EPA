// lib/data/rrb_group_d/rrb_group_d_exam_pattern.dart

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

/// The actual exam pattern data for the RRB Group D exam.
final List<ExamPatternTier> rrbGroupDExamPattern = [
  ExamPatternTier(
    tierTitle: 'Computer Based Test (CBT)',
    patternRows: [
      ExamPatternRow(subject: 'General Science', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'General Intelligence & Reasoning', questions: '30', marks: '30'),
      ExamPatternRow(subject: 'General Awareness & Current Affairs', questions: '20', marks: '20'),
    ],
    totalMarks: '100',
    totalDuration: '90 Minutes',
    description: 'The test consists of objective type questions. There is a negative marking of 1/3rd for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Physical Efficiency Test (PET)',
    patternRows: [],
    totalMarks: 'Qualifying',
    totalDuration: '-',
    description: 'Candidates who qualify the CBT will be called for a PET. This stage is mandatory and is qualifying in nature.',
  ),
   ExamPatternTier(
    tierTitle: 'Document Verification and Medical Examination',
    patternRows: [],
    totalMarks: '-',
    totalDuration: '-',
    description: 'Based on the performance in CBT and subject to qualifying in PET, candidates will be called for Document Verification and Medical Examination.',
  ),
];
