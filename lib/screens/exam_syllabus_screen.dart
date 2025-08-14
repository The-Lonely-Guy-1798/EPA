import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

// Import all the syllabus data files with prefixes
import 'package:exam_prep_adda/data/ib_acio/ib_acio_syllabus.dart'
    as ib_acio_syllabus;
import 'package:exam_prep_adda/data/afcat/afcat_syllabus.dart'
    as afcat_syllabus;
import 'package:exam_prep_adda/data/cat/cat_syllabus.dart' as cat_syllabus;
import 'package:exam_prep_adda/data/cds/cds_syllabus.dart' as cds_syllabus;
import 'package:exam_prep_adda/data/ctet/ctet_syllabus.dart' as ctet_syllabus;
import 'package:exam_prep_adda/data/gate/gate_syllabus.dart' as gate_syllabus;
import 'package:exam_prep_adda/data/ibps_clerk/ibps_clerk_syllabus.dart'
    as ibps_clerk_syllabus;
import 'package:exam_prep_adda/data/ibps_po/ibps_po_syllabus.dart'
    as ibps_po_syllabus;
import 'package:exam_prep_adda/data/ibps_rrb/ibps_rrb_syllabus.dart'
    as ibps_rrb_syllabus;

// A model class to hold syllabus data for different exams.
class ExamSyllabus {
  // This structure now supports multiple tiers (e.g., Tier-I, Tier-II)
  final Map<String, Map<String, List<String>>> syllabusByTier;
  ExamSyllabus({required this.syllabusByTier});
}

/// A screen that displays the syllabus for a selected exam.
class SyllabusScreen extends StatelessWidget {
  final String examName;

  const SyllabusScreen({super.key, required this.examName});

  // A helper method to get the correct syllabus data based on the exam name.
  ExamSyllabus _getSyllabusForExam(String examName) {
    switch (examName) {
      case 'AFCAT':
        // Wrap single-tier syllabuses in a map for consistent UI handling
        return ExamSyllabus(
          syllabusByTier: {'Syllabus': afcat_syllabus.afcatSyllabus},
        );
      case 'CAT':
        return ExamSyllabus(
          syllabusByTier: {'Syllabus': cat_syllabus.catSyllabus},
        );
      case 'CDS':
        return ExamSyllabus(
          syllabusByTier: {'Syllabus': cds_syllabus.cdsSyllabus},
        );
      case 'CTET':
        return ExamSyllabus(syllabusByTier: ctet_syllabus.ctetSyllabus);
      case 'GATE':
        return ExamSyllabus(syllabusByTier: gate_syllabus.gateSyllabus);

      case 'IB-ACIO':
        return ExamSyllabus(syllabusByTier: ib_acio_syllabus.ibAcioSyllabus);

      case 'IBPS CLERK':
        return ExamSyllabus(
          syllabusByTier: ibps_clerk_syllabus.ibpsClerkSyllabus,
        );

      case 'IBPS PO':
        return ExamSyllabus(syllabusByTier: ibps_po_syllabus.ibpsPoSyllabus);

      case 'IBPS RRB':
        return ExamSyllabus(syllabusByTier: ibps_rrb_syllabus.ibpsRrbSyllabus);

      default:
        // Return a default or empty syllabus if the exam is not found
        return ExamSyllabus(syllabusByTier: {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final examSyllabus = _getSyllabusForExam(examName);
    final syllabusTiers = examSyllabus.syllabusByTier.entries.toList();

    return Scaffold(
      appBar: AppBar(title: Text('$examName Syllabus')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (syllabusTiers.isEmpty)
            const Center(child: Text('Syllabus details are not available yet.'))
          else
            // Use spread operator to insert the list of tier widgets directly
            ...syllabusTiers.expand((tierEntry) {
              final tierName = tierEntry.key;
              final subjects = tierEntry.value.entries.toList();
              // Return a list containing the tier header and its expansion panel
              return [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    tierName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _SyllabusExpansionPanel(syllabusTopics: subjects),
              ];
            }),
          const SizedBox(height: 24),
          const NativeAdPlaceholder(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// A stateful widget to manage the expansion state of the syllabus panels.
class _SyllabusExpansionPanel extends StatefulWidget {
  final List<MapEntry<String, List<String>>> syllabusTopics;

  const _SyllabusExpansionPanel({required this.syllabusTopics});

  @override
  State<_SyllabusExpansionPanel> createState() =>
      _SyllabusExpansionPanelState();
}

class _SyllabusExpansionPanelState extends State<_SyllabusExpansionPanel> {
  // A list to keep track of whether each panel is expanded or collapsed.
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    // Initialize all panels to be collapsed by default.
    _isExpanded = List<bool>.filled(widget.syllabusTopics.length, false);
  }

  @override
  Widget build(BuildContext context) {
    // Wrapping with Material and adding elevation to ensure proper rendering
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAlias, // Ensures the border radius is respected
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded[index] = !isExpanded;
          });
        },
        children: widget.syllabusTopics.asMap().entries.map<ExpansionPanel>((
          entry,
        ) {
          final int index = entry.key;
          final String subject = entry.value.key;
          final List<String> topics = entry.value.value;

          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
            body: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: topics.map((topic) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '• $topic',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
            ),
            isExpanded: _isExpanded[index],
          );
        }).toList(),
      ),
    );
  }
}
