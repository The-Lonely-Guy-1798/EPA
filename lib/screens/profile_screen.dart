import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/home_screen.dart'; // Import home screen to access ad widgets

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name Section
              const Text(
                'User Name: John Doe', // Placeholder user name
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
    
              // Notifications Section
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('New study material available!'),
                onTap: () {
                  // Handle notification tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Your daily quiz is ready.'),
                onTap: () {
                  // Handle notification tap
                },
              ),
              const SizedBox(height: 24),
    
              // My Exams Section
              const Text(
                'My Exams',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('SSC-CGL (Active)'),
                onTap: () {
                  // Handle exam tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('Bank-PO (Completed)'),
                onTap: () {
                  // Handle exam tap
                },
              ),
              
              // Spacing before the native ad
              const SizedBox(height: 24),
              // Native Ad Placeholder at the very bottom
              const NativeAdPlaceholder(),
              // A SizedBox is used here to provide a final gap and padding at the bottom of the screen.
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
