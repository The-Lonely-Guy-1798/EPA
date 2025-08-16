// lib/data/bsf_constable/bsf_constable_exam_pattern.dart

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

/// The actual exam pattern data for the BSF Constable exam.
final List<ExamPatternTier> bsfConstableExamPattern = [
  ExamPatternTier(
    tierTitle: 'Phase-I: Written Examination',
    patternRows: [
      ExamPatternRow(subject: 'General Awareness / GK', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Knowledge of Elementary Mathematics', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Analytical Aptitude & Ability to Observe Patterns', questions: '25', marks: '25'),
      ExamPatternRow(subject: 'Basic Knowledge of English/Hindi', questions: '25', marks: '25'),
    ],
    totalMarks: '100',
    totalDuration: '2 Hours',
    description: 'The written test is an OMR-based objective type exam. Qualifying marks are 35% for General/EWS and 33% for SC/ST/OBC.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-II: Physical Standard Test (PST) & Physical Efficiency Test (PET)',
    patternRows: [],
    totalMarks: '-',
    totalDuration: '-',
    description: 'Candidates who qualify the written exam will undergo PST (height, chest, weight measurements) and PET (race, long jump, high jump). This phase is qualifying in nature.',
  ),
    ExamPatternTier(
    tierTitle: 'Phase-III: Documentation, Trade Test & Medical Examination',
    patternRows: [],
    totalMarks: '-',
    totalDuration: '-',
    description: 'Candidates clearing PST/PET will undergo document verification and a trade test relevant to their chosen trade. The final stage is a Detailed Medical Examination (DME).',
  ),
];
