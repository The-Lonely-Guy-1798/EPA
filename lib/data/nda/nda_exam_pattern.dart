// lib/data/nda/nda_exam_pattern.dart

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

/// The actual exam pattern data for the NDA exam.
final List<ExamPatternTier> ndaExamPattern = [
  ExamPatternTier(
    tierTitle: 'Written Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper I: Mathematics', marks: '300', duration: '2.5 Hours'),
      ExamPatternRow(subject: 'Paper II: General Ability Test (GAT)', marks: '600', duration: '2.5 Hours'),
    ],
    totalMarks: '900',
    description: 'The papers consist of objective type questions only. There is a penalty for wrong answers.',
  ),
  ExamPatternTier(
    tierTitle: 'SSB Interview',
    patternRows: [],
    totalMarks: '900',
    description: 'Candidates who qualify the written exam will undergo a two-stage selection process at a Services Selection Board (SSB). This includes an Officer Intelligence Rating (OIR) test, Picture Perception & Description Test (PP&DT), and a series of psychological tests, group tasks, and a personal interview.',
  ),
];
