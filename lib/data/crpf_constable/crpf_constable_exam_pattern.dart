// lib/data/crpf_constable/crpf_constable_exam_pattern.dart

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

/// The actual exam pattern data for the CRPF Constable exam.
final List<ExamPatternTier> crpfConstableExamPattern = [
  ExamPatternTier(
    tierTitle: 'Phase-I: Computer Based Test (CBT)',
    patternRows: [
      ExamPatternRow(subject: 'General Intelligence & Reasoning', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'General Knowledge & Awareness', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Elementary Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'English/Hindi', questions: '25', marks: '25'),
    ],
    totalMarks: '100',
    totalDuration: '90 Minutes',
    description: 'The test consists of objective type questions. There is a negative marking of 0.25 marks for each wrong answer.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-II: Physical Standard Test (PST) & Physical Efficiency Test (PET)',
    patternRows: [],
    totalMarks: '-',
    totalDuration: '-',
    description: 'This phase is qualifying in nature and includes height/chest measurements and a race.',
  ),
    ExamPatternTier(
    tierTitle: 'Phase-III: Document Verification & Medical Examination',
    patternRows: [],
    totalMarks: '-',
    totalDuration: '-',
    description: 'Candidates who clear the previous stages will undergo document verification followed by a Detailed Medical Examination (DME).',
  ),
];
