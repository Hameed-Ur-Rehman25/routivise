import '../models/mood.dart';

abstract class MoodRepository {
  Future<List<Mood>> getMoodsForUser(String userId);
  Future<Mood> createMood(Mood mood);
  Future<Mood> getCurrentMood(String userId);
  Future<void> updateMood(Mood mood);
  Future<void> deleteMood(String moodId);
}
