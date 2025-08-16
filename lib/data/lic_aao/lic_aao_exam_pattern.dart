// lib/data/lic_aao/lic_aao_exam_pattern.dart

/// A class to define the structure for a single row in the exam pattern table.
class ExamPatternRow {
  final String subject;
  final String marks;
  final String questions;
  final String duration;

  ExamPatternRow({
    required this.subject,
    required this.marks,
    required this.questions,
    required this.duration,
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

/// The actual exam pattern data for the LIC AAO exam.
final List<ExamPatternTier> licAaoExamPattern = [
  ExamPatternTier(
    tierTitle: 'Phase-I: Preliminary Examination',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning Ability', questions: '35', marks: '35', duration: '20 mins'),
      ExamPatternRow(subject: 'Quantitative Aptitude', questions: '35', marks: '35', duration: '20 mins'),
      ExamPatternRow(subject: 'English Language', questions: '30', marks: '30', duration: '20 mins'),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description: 'The English Language test is of a qualifying nature and the marks will not be counted for ranking. Candidates have to qualify in each of the three tests.',
  ),
  ExamPatternTier(
    tierTitle: 'Phase-II: Main Examination',
    patternRows: [
      ExamPatternRow(subject: 'Reasoning Ability', questions: '30', marks: '90', duration: '40 mins'),
      ExamPatternRow(subject: 'General Knowledge, Current Affairs', questions: '30', marks: '60', duration: '20 mins'),
      ExamPatternRow(subject: 'Data Analysis & Interpretation', questions: '30', marks: '90', duration: '40 mins'),
      ExamPatternRow(subject: 'Insurance and Financial Market Awareness', questions: '30', marks: '60', duration: '20 mins'),
      ExamPatternRow(subject: 'English Language (Letter Writing & Essay)', questions: '2', marks: '25', duration: '30 mins'),
    ],
    totalMarks: '325',
    totalDuration: '2 Hours 30 Minutes',
    description: 'The objective test has a negative marking of 1/4th for wrong answers. The descriptive test in English is of a qualifying nature.',
  ),
   ExamPatternTier(
    tierTitle: 'Phase-III: Interview',
    patternRows: [],
    totalMarks: '60',
    totalDuration: '-',
    description: 'Candidates who qualify the Main Exam will be called for a personal interview. Final selection is based on the marks obtained in the Main Exam and the Interview.',
  ),
];
