import 'package:flutter/material.dart';
import 'package:exam_prep_adda/services/progress_service.dart'; // Import the progress service

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables to hold the user's progress data
  Map<String, double> _allScores = {};
  String _username = 'John Doe'; // Default username
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  /// Fetches all user data (scores and username) from the ProgressService.
  Future<void> _loadAllData() async {
    final scores = await ProgressService.getAllQuizScores();
    final username = await ProgressService.getUsername();
    if (mounted) {
      setState(() {
        _allScores = scores;
        _username = username;
        _isLoading = false;
      });
    }
  }

  /// Shows a dialog to edit the username.
  void _showEditUsernameDialog(BuildContext context) {
    final TextEditingController usernameController = TextEditingController(
      text: _username,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Change Username'),
          content: TextField(
            controller: usernameController,
            decoration: const InputDecoration(hintText: "Enter your new name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                final newUsername = usernameController.text.trim();
                if (newUsername.isNotEmpty) {
                  ProgressService.saveUsername(newUsername).then((_) {
                    setState(() {
                      _username = newUsername;
                    });
                    Navigator.of(context).pop();
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  /// Shows a dialog with a QR code and instructions.
  void _showConnectDialog(
    BuildContext context,
    String channelName,
    String qrImageUrl,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text('Join our $channelName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Scan the QR code below to join our $channelName channel for updates and study materials.',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                  qrImageUrl,
                  fit: BoxFit.contain,
                  // Placeholder while loading
                  loadingBuilder:
                      (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                  // Error placeholder
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 50, color: Colors.red),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate statistics from the loaded scores
    final int quizzesAttempted = _allScores.length;
    final double averageScore = quizzesAttempted > 0
        ? _allScores.values.reduce((a, b) => a + b) / quizzesAttempted
        : 0.0;
    final double highestScore = quizzesAttempted > 0
        ? _allScores.values.reduce((a, b) => a > b ? a : b)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // User Info Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://placehold.co/100x100/000000/FFFFFF?text=User',
                      ),
                    ),
                    title: Text(
                      _username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Aspiring for Greatness'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showEditUsernameDialog(context),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Performance Dashboard Section
                const Text(
                  'Performance Dashboard',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Divider(),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildStatRow(
                          'Quizzes Attempted',
                          quizzesAttempted.toString(),
                          Icons.list_alt,
                          Colors.blue,
                        ),
                        const SizedBox(height: 16),
                        _buildStatRow(
                          'Average Score',
                          '${averageScore.toStringAsFixed(2)}%',
                          Icons.show_chart,
                          Colors.orange,
                        ),
                        const SizedBox(height: 16),
                        _buildStatRow(
                          'Highest Score',
                          '${highestScore.toStringAsFixed(2)}%',
                          Icons.star,
                          Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Connect with Us Section
                const Text(
                  'Connect with Us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Divider(),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.message, color: Colors.green),
                        title: const Text('Join our WhatsApp Channel'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Placeholder URL for a WhatsApp QR code
                          _showConnectDialog(
                            context,
                            'WhatsApp Channel',
                            'https://placehold.co/200x200/25D366/FFFFFF?text=WhatsApp+QR',
                          );
                        },
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      ListTile(
                        leading: const Icon(
                          Icons.telegram,
                          color: Colors.blueAccent,
                        ),
                        title: const Text('Join our Telegram Channel'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Placeholder URL for a Telegram QR code
                          _showConnectDialog(
                            context,
                            'Telegram Channel',
                            'https://placehold.co/200x200/0088CC/FFFFFF?text=Telegram+QR',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  /// Helper widget to build a row for a statistic.
  Widget _buildStatRow(String title, String value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
