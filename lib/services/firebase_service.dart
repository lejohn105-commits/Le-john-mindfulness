import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final _database = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;

  // Save meditation session
  Future<void> saveMeditationSession({
    required int duration,
    required DateTime date,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _database.child('users/$userId/meditations').push().set({
      'duration': duration,
      'date': date.toIso8601String(),
      'timestamp': ServerValue.timestamp,
    });
  }

  // Save mood entry
  Future<void> saveMoodEntry({
    required int moodScore,
    required String notes,
    required DateTime date,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _database.child('users/$userId/moods').push().set({
      'score': moodScore,
      'notes': notes,
      'date': date.toIso8601String(),
      'timestamp': ServerValue.timestamp,
    });
  }

  // Get meditation sessions
  Stream<List<Map>> getMeditationSessions() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _database
        .child('users/$userId/meditations')
        .onValue
        .map((event) {
      final data = event.snapshot.value as Map?;
      if (data == null) return [];
      return data.entries.map((e) => e.value as Map).toList();
    });
  }

  // Get mood entries
  Stream<List<Map>> getMoodEntries() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _database
        .child('users/$userId/moods')
        .onValue
        .map((event) {
      final data = event.snapshot.value as Map?;
      if (data == null) return [];
      return data.entries.map((e) => e.value as Map).toList();
    });
  }

  // Get user profile
  Future<Map?> getUserProfile() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return null;

    final snapshot = await _database.child('users/$userId/profile').get();
    return snapshot.value as Map?;
  }

  // Update user profile
  Future<void> updateUserProfile({
    required String name,
    required String bio,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _database.child('users/$userId/profile').set({
      'name': name,
      'bio': bio,
      'updatedAt': ServerValue.timestamp,
    });
  }
}
