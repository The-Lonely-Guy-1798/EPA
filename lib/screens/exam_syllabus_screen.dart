import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

// Import the new syllabus data file
import 'package:exam_prep_adda/data/ib_acio/ib_acio_syllabus.dart';

// A model class to hold syllabus data for different exams.
// This makes it easy to add more exams in the future.
class ExamSyllabus {
  // Updated to handle a tiered syllabus structure
  final Map<String, Map<String, List<String>>> syllabusByTier;
  ExamSyllabus({required this.syllabusByTier});
}

/// A screen that displays the syllabus for a selected exam.
/// It dynamically loads the syllabus data based on the exam name.
class SyllabusScreen extends StatelessWidget {
  final String examName;

  const SyllabusScreen({super.key, required this.examName});

  // A helper method to get the correct syllabus data based on the exam name.
  ExamSyllabus _getSyllabusForExam(String examName) {
    switch (examName) {
      case 'IB-ACIO':
        // The data file now exports a map organized by tiers
        return ExamSyllabus(syllabusByTier: ibAcioSyllabus);
      // Add cases for other exams here
      // case 'SSC-CGL':
      //   return ExamSyllabus(syllabusByTier: sscCglSyllabus);
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
      appBar: AppBar(
        title: Text('$examName Syllabus'),
      ),
      // Replaced SingleChildScrollView and Column with a ListView for better scrollable behavior.
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (syllabusTiers.isEmpty)
            const Center(
              child: Text('Syllabus details are not available yet.'),
            )
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
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
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
        children:
            widget.syllabusTopics.asMap().entries.map<ExpansionPanel>((entry) {
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
