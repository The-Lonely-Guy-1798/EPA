import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/profile_screen.dart'; // Import the profile screen
import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import the new exam detail screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List of exams, sorted alphabetically
  final List<String> exams = const [
    'Bank-Clerk',
    'Bank-PO',
    'CAT',
    'CDS',
    'IB-ACIO',
    'NDA',
    'SSC-CGL',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exam Prep Hub',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false, // Align title to the left
        actions: [
          // User profile button
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://placehold.co/100x100/FF0000/FFFFFF?text=User', // Placeholder user image
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8, // Adjust aspect ratio for card height
          ),
          itemCount: exams.length,
          itemBuilder: (context, index) {
            return ExamCard(examName: exams[index]);
          },
        ),
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.examName});

  final String examName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          // Navigate to ExamDetailScreen when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(examName: examName),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for an exam icon/image
              const Icon(
                Icons.school,
                size: 40,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 8),
              Text(
                examName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
