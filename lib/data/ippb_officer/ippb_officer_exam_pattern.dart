// lib/data/ippb_officer/ippb_officer_exam_pattern.dart

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

final List<ExamPatternTier> ippbOfficerExamPattern = [
  ExamPatternTier(
    tierTitle: 'Preliminary Examination',
    patternRows: [
      ExamPatternRow(
        subject: 'English Language',
        questions: '30',
        marks: '30',
        duration: '20 mins',
      ),
      ExamPatternRow(
        subject: 'Reasoning Ability',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
      ExamPatternRow(
        subject: 'Quantitative Aptitude',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description:
        'This is an objective test. There is a penalty for wrong answers.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination',
    patternRows: [
      ExamPatternRow(
        subject: 'Reasoning & Computer Aptitude',
        questions: '40',
        marks: '50',
        duration: '50 mins',
      ),
      ExamPatternRow(
        subject: 'English Language',
        questions: '40',
        marks: '40',
        duration: '30 mins',
      ),
      ExamPatternRow(
        subject: 'Data Analysis & Interpretation',
        questions: '40',
        marks: '50',
        duration: '45 mins',
      ),
      ExamPatternRow(
        subject: 'General Economy/Banking Awareness',
        questions: '40',
        marks: '40',
        duration: '25 mins',
      ),
    ],
    totalMarks: '180',
    totalDuration: '150 Minutes',
    description:
        'The Main exam is objective. There is a penalty for wrong answers.',
  ),
];
