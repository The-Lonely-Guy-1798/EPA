import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

// Import exam pattern data files with prefixes for clarity and to avoid conflicts
import 'package:exam_prep_adda/data/ib_acio/ib_acio_exam_pattern.dart'
    as ib_acio_pattern;
import 'package:exam_prep_adda/data/afcat/afcat_exam_pattern.dart'
    as afcat_pattern;
import 'package:exam_prep_adda/data/cat/cat_exam_pattern.dart' as cat_pattern;
import 'package:exam_prep_adda/data/cds/cds_exam_pattern.dart' as cds_pattern;
import 'package:exam_prep_adda/data/ctet/ctet_exam_pattern.dart'
    as ctet_pattern;
import 'package:exam_prep_adda/data/gate/gate_exam_pattern.dart'
    as gate_pattern;
import 'package:exam_prep_adda/data/ibps_clerk/ibps_clerk_exam_pattern.dart'
    as ibps_clerk_pattern;
import 'package:exam_prep_adda/data/ibps_po/ibps_po_exam_pattern.dart'
    as ibps_po_pattern;
import 'package:exam_prep_adda/data/ibps_rrb/ibps_rrb_exam_pattern.dart'
    as ibps_rrb_pattern;

/// A screen that displays the exam pattern for a selected exam.
/// It dynamically loads the pattern data based on the exam name.
class ExamPatternScreen extends StatelessWidget {
  final String examName;

  const ExamPatternScreen({super.key, required this.examName});

  // A helper method to get the correct pattern data based on the exam name.
  // The return type is now dynamic to accommodate different data types.
  List<dynamic> _getPatternForExam(String examName) {
    switch (examName) {
      case 'AFCAT':
        return afcat_pattern.afcatExamPattern;
      case 'CAT':
        return cat_pattern.catExamPattern;
      case 'CDS':
        return cds_pattern.cdsExamPattern;
      case 'CTET':
        return ctet_pattern.ctetExamPattern;
      case 'GATE':
        return gate_pattern.gateExamPattern;
      case 'IB-ACIO':
        // Now using the prefix for consistency
        return ib_acio_pattern.ibAcioExamPattern;
      case 'IBPS CLERK':
        return ibps_clerk_pattern.ibpsClerkExamPattern;

      case 'IBPS PO':
        return ibps_po_pattern.ibpsPoExamPattern;

      case 'IBPS RRB':
        return ibps_rrb_pattern.ibpsRrbExamPattern;
      // Add cases for other exams here
      // case 'SSC-CGL':
      //   return sscCglExamPattern;
      default:
        // Return an empty list if the exam is not found
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final examPatternTiers = _getPatternForExam(examName);

    return Scaffold(
      appBar: AppBar(title: Text('$examName Exam Pattern')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (examPatternTiers.isEmpty)
            const Center(
              child: Text('Exam pattern details are not available yet.'),
            )
          else
            ...examPatternTiers.map((tier) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tier.tierTitle,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (tier.description.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          tier.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                      const SizedBox(height: 16),
                      // Use a DataTable for a clean tabular layout
                      DataTable(
                        columnSpacing: 38.0,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Subject',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Questions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text(
                              'Marks',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            numeric: true,
                          ),
                        ],
                        // Corrected: Explicitly cast the list of rows to List<DataRow>
                        rows: (tier.patternRows as List<dynamic>).map<DataRow>((
                          row,
                        ) {
                          return DataRow(
                            cells: [
                              DataCell(Text(row.subject)),
                              DataCell(Text(row.questions)),
                              DataCell(Text(row.marks)),
                            ],
                          );
                        }).toList(),
                      ),
                      const Divider(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Marks: ${tier.totalMarks}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Duration: ${tier.totalDuration}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          const SizedBox(height: 24),
          const NativeAdPlaceholder(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
