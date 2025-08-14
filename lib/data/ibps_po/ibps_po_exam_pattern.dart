// lib/data/ibps_po/ibps_po_exam_pattern.dart

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

final List<ExamPatternTier> ibpsPoExamPattern = [
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
        subject: 'Quantitative Aptitude',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
      ExamPatternRow(
        subject: 'Reasoning Ability',
        questions: '35',
        marks: '35',
        duration: '20 mins',
      ),
    ],
    totalMarks: '100',
    totalDuration: '1 Hour',
    description:
        'Candidates have to qualify in each of the three tests by securing minimum cut-off marks.',
  ),
  ExamPatternTier(
    tierTitle: 'Main Examination (Objective + Descriptive)',
    patternRows: [
      ExamPatternRow(
        subject: 'Reasoning & Computer Aptitude',
        questions: '45',
        marks: '60',
        duration: '60 mins',
      ),
      ExamPatternRow(
        subject: 'General/ Economy/ Banking Awareness',
        questions: '40',
        marks: '40',
        duration: '35 mins',
      ),
      ExamPatternRow(
        subject: 'English Language',
        questions: '35',
        marks: '40',
        duration: '40 mins',
      ),
      ExamPatternRow(
        subject: 'Data Analysis & Interpretation',
        questions: '35',
        marks: '60',
        duration: '45 mins',
      ),
      ExamPatternRow(
        subject: 'English Language (Letter Writing & Essay)',
        questions: '2',
        marks: '25',
        duration: '30 mins',
      ),
    ],
    totalMarks: '225',
    totalDuration: '3 Hours 30 Minutes',
    description:
        'There is a penalty for wrong answers in the objective tests (1/4th of the mark).',
  ),
  ExamPatternTier(
    tierTitle: 'Interview',
    patternRows: [],
    totalMarks: '100',
    totalDuration: '-',
    description:
        'Candidates qualifying the Main Exam will be called for a personal interview.',
  ),
];
