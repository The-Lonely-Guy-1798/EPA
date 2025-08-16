// lib/data/rbi_grade_b/rbi_grade_b_exam_pattern.dart

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

/// The actual exam pattern data for the RBI Grade B exam.
final List<ExamPatternTier> rbiGradeBExamPattern = [
  ExamPatternTier(
    tierTitle: 'Phase-I: Objective Test',
    patternRows: [
      ExamPatternRow(subject: 'General Awareness', questions: '80', marks: '80'),
      ExamPatternRow(subject: 'English Language', questions: '30', marks: '30'),
      ExamPatternRow(subject: 'Quantitative Aptitude', questions: '30', marks: '30'),
      ExamPatternRow(subject: 'Reasoning', questions: '60', marks: '60'),
    ],
    totalMarks: '200',
    totalDuration: '120 Minutes',
    description: 'There is a penalty for wrong answers (1/4th of the mark assigned). There are separate time limits for each section.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-II: Online Examination',
    patternRows: [
      ExamPatternRow(subject: 'Paper-I: Economic and Social Issues', questions: 'Objective + Descriptive', marks: '100'),
      ExamPatternRow(subject: 'Paper-II: English (Writing Skills)', questions: 'Descriptive', marks: '100'),
      ExamPatternRow(subject: 'Paper-III: Finance and Management', questions: 'Objective + Descriptive', marks: '100'),
    ],
    totalMarks: '300',
    totalDuration: '90 mins for each paper',
    description: 'Candidates are shortlisted for the interview based on the aggregate marks obtained in Phase-II.',
  ),
   ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '75',
    totalDuration: '-',
    description: 'Candidates will be shortlisted for the interview based on their performance in the Phase-II examination.',
  ),
];
