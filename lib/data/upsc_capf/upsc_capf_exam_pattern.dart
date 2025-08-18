// lib/data/upsc_capf/upsc_capf_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
class ExamPatternRow {
  final String subject;
  final String marks;
  final String duration;

  ExamPatternRow({
    required this.subject,
    required this.marks,
    required this.duration,
  });
}

/// A class to define the structure for a full tier of an exam pattern.
class ExamPatternTier {
  final String tierTitle;
  final List<ExamPatternRow> patternRows;
  final String totalMarks;
  final String description;

  ExamPatternTier({
    required this.tierTitle,
    required this.patternRows,
    required this.totalMarks,
    this.description = '',
  });
}

/// The actual exam pattern data for the UPSC CAPF exam.
final List<ExamPatternTier> upscCapfExamPattern = [
  ExamPatternTier(
    tierTitle: 'Written Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: General Ability and Intelligence', marks: '250', duration: '2 Hours'),
      ExamPatternRow(subject: 'Paper II: General Studies, Essay & Comprehension', marks: '200', duration: '3 Hours'),
    ],
    totalMarks: '450',
    description: 'Paper I is an objective (MCQ) test. Paper II is descriptive. There is a penalty for wrong answers in Paper I.',
  ),
  ExamPatternTier(
    tierTitle: 'Physical Standards/Physical Efficiency Tests and Medical Standards Tests',
    patternRows: [],
    totalMarks: 'Qualifying',
    description: 'Candidates who qualify the written exam will be called for PST/PET. This stage is qualifying in nature.',
  ),
  ExamPatternTier(
    tierTitle: 'Interview/Personality Test',
    patternRows: [],
    totalMarks: '150',
    description: 'Candidates who are declared qualified in the Medical Standards Tests, will be called for an Interview/Personality Test.',
  ),
];
