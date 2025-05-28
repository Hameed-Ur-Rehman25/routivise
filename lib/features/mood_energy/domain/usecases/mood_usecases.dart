import '../models/mood.dart';
import '../repositories/mood_repository.dart';

class GetCurrentMood {
  final MoodRepository repository;

  GetCurrentMood(this.repository);

  Future<Mood> call(String userId) {
    return repository.getCurrentMood(userId);
  }
}

class LogMood {
  final MoodRepository repository;

  LogMood(this.repository);

  Future<Mood> call(Mood mood) {
    return repository.createMood(mood);
  }
}

class GetMoodHistory {
  final MoodRepository repository;

  GetMoodHistory(this.repository);

  Future<List<Mood>> call(String userId) {
    return repository.getMoodsForUser(userId);
  }
}
