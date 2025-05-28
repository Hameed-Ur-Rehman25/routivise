import 'package:flutter/material.dart';
import '../../domain/models/mood.dart';

class MoodProvider extends ChangeNotifier {
  Mood? _currentMood;
  List<Mood> _moodHistory = [];
  bool _isLoading = false;

  Mood? get currentMood => _currentMood;
  List<Mood> get moodHistory => _moodHistory;
  bool get isLoading => _isLoading;

  // Simulate fetching current mood from backend
  Future<void> fetchCurrentMood(String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Mock data - in real app would come from repository
    _currentMood = Mood(
      value: 'Happy',
      timestamp: DateTime.now(),
      userId: userId,
      id: 'mood-1',
    );
    
    _isLoading = false;
    notifyListeners();
  }

  // Simulate fetching mood history from backend
  Future<void> fetchMoodHistory(String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Mock data - in real app would come from repository
    final now = DateTime.now();
    _moodHistory = [
      Mood(value: 'Happy', timestamp: now.subtract(const Duration(hours: 1)), userId: userId, id: 'mood-1'),
      Mood(value: 'Happy', timestamp: now.subtract(const Duration(hours: 3)), userId: userId, id: 'mood-2'),
      Mood(value: 'Happy', timestamp: now.subtract(const Duration(hours: 5)), userId: userId, id: 'mood-3'),
      Mood(value: 'Happy', timestamp: now.subtract(const Duration(hours: 8)), userId: userId, id: 'mood-4'),
    ];
    
    _isLoading = false;
    notifyListeners();
  }

  // Log a new mood
  Future<void> logMood(String value, String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Create new mood entry
    final newMood = Mood(
      value: value,
      timestamp: DateTime.now(),
      userId: userId,
      id: 'mood-${DateTime.now().millisecondsSinceEpoch}',
    );
    
    // In a real app, you would send this to your backend
    
    // Update local state
    _currentMood = newMood;
    _moodHistory.insert(0, newMood);
    
    _isLoading = false;
    notifyListeners();
  }
}
