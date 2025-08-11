// lib/services/progress_service.dart

import 'package:shared_preferences/shared_preferences.dart';

/// A service class to manage all local storage logic using `shared_preferences`.
/// This prevents us from repeating code and centralizes all progress-related
/// functionality, making it easier to maintain and update.
class ProgressService {
  // A private constructor to prevent instantiation of this class.
  ProgressService._();

  // Define prefixes for different types of keys to keep data organized.
  static const String _completedKeyPrefix = 'completed_';
  static const String _scoreKeyPrefix = 'score_';

  /// Generates a unique key for a completed practice set or quiz.
  /// Example key: 'completed_IB_ACIO_Quiz_1'
  static String _generateCompletedKey(String examName, String itemName) {
    return '$_completedKeyPrefix${examName}_$itemName';
  }

  /// Generates a unique key for a quiz score.
  /// Example key: 'score_IB_ACIO_Quiz_1'
  static String _generateScoreKey(String examName, String quizName) {
    return '$_scoreKeyPrefix${examName}_$quizName';
  }

  /// Saves the completion status of a specific item (practice question or quiz).
  /// This will save a boolean value of `true` to indicate completion.
  static Future<void> saveCompletionStatus(String examName, String itemName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _generateCompletedKey(examName, itemName);
    await prefs.setBool(key, true);
  }

  /// Checks if a specific item has been completed.
  /// Returns `true` if the item is marked as completed, otherwise `false`.
  static Future<bool> isCompleted(String examName, String itemName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _generateCompletedKey(examName, itemName);
    return prefs.getBool(key) ?? false;
  }

  /// Saves the percentage score for a completed quiz.
  /// The score is stored as a double.
  static Future<void> saveQuizScore(String examName, String quizName, double score) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _generateScoreKey(examName, quizName);
    await prefs.setDouble(key, score);
  }

  /// Retrieves the percentage score for a specific quiz.
  /// Returns the score as a double, or `null` if no score is found.
  static Future<double?> getQuizScore(String examName, String quizName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _generateScoreKey(examName, quizName);
    return prefs.getDouble(key);
  }

  /// Retrieves all saved quiz scores. This is useful for a performance dashboard.
  /// It returns a Map where the key is a unique identifier (e.g., 'IB_ACIO_Quiz_1')
  /// and the value is the percentage score.
  static Future<Map<String, double>> getAllQuizScores() async {
    final prefs = await SharedPreferences.getInstance();
    final scores = <String, double>{};
    final keys = prefs.getKeys();

    for (final key in keys) {
      if (key.startsWith(_scoreKeyPrefix)) {
        final score = prefs.getDouble(key);
        if (score != null) {
          // Remove the prefix to get a cleaner key for the map
          final cleanKey = key.substring(_scoreKeyPrefix.length);
          scores[cleanKey] = score;
        }
      }
    }
    return scores;
  }
}
