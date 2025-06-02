import 'package:flutter/material.dart';
import '../models/routine.dart';

class RoutineProvider extends ChangeNotifier {
  List<Routine> _routines = [];
  bool _isLoading = false;

  List<Routine> get routines => _routines;
  bool get isLoading => _isLoading;

  // Fetch routines for the current day
  Future<void> fetchTodaysRoutines(String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock data - in real app would come from repository
    _routines = [
      Routine(
        id: '1',
        title: 'Drink Water',
        description: 'Drink a refreshing glass of water to start off your day!',
        time: '11:00 am',
        isDone: true,
        icon: 'water_drop',
        category: 'health',
      ),
      Routine(
        id: '2',
        title: 'Workout',
        description:
            'Time for your cardio! This 10 minute video will do just the trick!',
        time: '11:05 am',
        isDone: false,
        icon: 'fitness_center',
        category: 'fitness',
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  // Toggle routine completion status
  Future<void> toggleRoutineStatus(String routineId) async {
    final index = _routines.indexWhere((r) => r.id == routineId);
    if (index != -1) {
      _routines[index] = _routines[index].copyWith(
        isDone: !_routines[index].isDone,
      );
      notifyListeners();

      // In a real app, you would send this update to your backend
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  // Refresh routines
  Future<void> refreshRoutines(String userId) async {
    await fetchTodaysRoutines(userId);
  }
}
