import 'package:flutter/material.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_progress.dart';
import '../../domain/usecases/get_workouts_usecase.dart';
import '../../domain/usecases/get_workouts_by_type_usecase.dart';
import '../../domain/usecases/get_workout_by_id_usecase.dart';

class WorkoutViewModel extends ChangeNotifier {
  final GetWorkoutsUseCase _getWorkoutsUseCase;
  final GetWorkoutsByTypeUseCase _getWorkoutsByTypeUseCase;
  final GetWorkoutByIdUseCase _getWorkoutByIdUseCase;

  List<Workout> _workouts = [];
  bool _isLoading = false;
  String? _error;
  String _selectedWorkoutType = 'Focus';

  // Track in-progress workouts
  WorkoutProgress? _currentWorkoutProgress;
  final List<WorkoutProgress> _recentWorkouts = [];

  // Keep track of workouts that have been fetched by ID
  // This helps with caching and prevents unnecessary API calls
  final Map<String, Workout> _workoutsById = {};

  // Getters
  List<Workout> get workouts => _workouts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedWorkoutType => _selectedWorkoutType;
  WorkoutProgress? get currentWorkoutProgress => _currentWorkoutProgress;
  List<WorkoutProgress> get recentWorkouts => _recentWorkouts;

  WorkoutViewModel({
    required GetWorkoutsUseCase getWorkoutsUseCase,
    required GetWorkoutsByTypeUseCase getWorkoutsByTypeUseCase,
    required GetWorkoutByIdUseCase getWorkoutByIdUseCase,
  }) : _getWorkoutsUseCase = getWorkoutsUseCase,
       _getWorkoutsByTypeUseCase = getWorkoutsByTypeUseCase,
       _getWorkoutByIdUseCase = getWorkoutByIdUseCase {
    fetchWorkouts();
    _loadMockProgress(); // Initialize with some mock progress data
  }

  Future<void> fetchWorkouts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _workouts = await _getWorkoutsUseCase.execute();

      // Cache the workouts by ID for quick access later
      for (var workout in _workouts) {
        _workoutsById[workout.id] = workout;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load workouts: $e';
      notifyListeners();
    }
  }

  Future<void> fetchWorkoutsByType(String workoutType) async {
    _selectedWorkoutType = workoutType;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _workouts = await _getWorkoutsByTypeUseCase.execute(workoutType);

      // Update the cache with any new workouts
      for (var workout in _workouts) {
        _workoutsById[workout.id] = workout;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load workouts: $e';
      notifyListeners();
    }
  }

  // Method to get a workout by ID
  // First checks the cache, then fetches from repository if not found
  Future<Workout?> getWorkoutById(String id) async {
    // First check if we already have this workout in our cache
    if (_workoutsById.containsKey(id)) {
      return _workoutsById[id];
    }

    // If not in the cache, try to find it in the current list
    try {
      final cachedWorkout = _workouts.firstWhere((workout) => workout.id == id);
      _workoutsById[id] = cachedWorkout; // Add to cache
      return cachedWorkout;
    } catch (e) {
      // Not in the current list, so we need to fetch it from the repository
      try {
        _isLoading = true;
        notifyListeners();

        final workout = await _getWorkoutByIdUseCase.execute(id);
        _workoutsById[id] = workout; // Add to cache

        _isLoading = false;
        notifyListeners();
        return workout;
      } catch (e) {
        _isLoading = false;
        _error = 'Failed to load workout: $e';
        notifyListeners();
        return null;
      }
    }
  }

  // Start a workout - track progress
  void startWorkout(String workoutId) {
    if (_workoutsById.containsKey(workoutId)) {
      final workout = _workoutsById[workoutId]!;

      // Create a new in-progress workout
      _currentWorkoutProgress = WorkoutProgress(
        workoutId: workoutId,
        workoutName: workout.name,
        imageUrl: workout.imageUrl,
        totalDuration: workout.duration,
        elapsedDuration: 0,
        lastAccessed: DateTime.now(),
      );

      notifyListeners();
    }
  }

  // Update workout progress
  void updateWorkoutProgress(String workoutId, int elapsedDuration) {
    if (_currentWorkoutProgress?.workoutId == workoutId) {
      final workout = _workoutsById[workoutId]!;

      // Update progress
      _currentWorkoutProgress = WorkoutProgress(
        workoutId: workoutId,
        workoutName: workout.name,
        imageUrl: workout.imageUrl,
        totalDuration: workout.duration,
        elapsedDuration: elapsedDuration,
        lastAccessed: DateTime.now(),
      );

      // Add to recent workouts if not already there
      _updateRecentWorkouts(_currentWorkoutProgress!);

      notifyListeners();
    }
  }

  // Finish a workout
  void completeWorkout(String workoutId) {
    if (_currentWorkoutProgress?.workoutId == workoutId) {
      final workout = _workoutsById[workoutId]!;

      // Mark as completed
      final completedWorkout = WorkoutProgress(
        workoutId: workoutId,
        workoutName: workout.name,
        imageUrl: workout.imageUrl,
        totalDuration: workout.duration,
        elapsedDuration: workout.duration, // Fully completed
        lastAccessed: DateTime.now(),
      );

      _updateRecentWorkouts(completedWorkout);
      _currentWorkoutProgress = null;

      notifyListeners();
    }
  }

  void _updateRecentWorkouts(WorkoutProgress progress) {
    // Remove if already exists
    _recentWorkouts.removeWhere((w) => w.workoutId == progress.workoutId);

    // Add to the beginning of the list
    _recentWorkouts.insert(0, progress);

    // Keep only the 5 most recent workouts
    if (_recentWorkouts.length > 5) {
      _recentWorkouts.removeLast();
    }
  }

  // Temporary method to load mock progress data
  void _loadMockProgress() {
    // Add a mock "in progress" workout if we have any workouts loaded
    if (_workoutsById.isNotEmpty) {
      final entry = _workoutsById.entries.first;
      final workout = entry.value;

      // Create a mock progress
      final progress = WorkoutProgress(
        workoutId: workout.id,
        workoutName: workout.name,
        imageUrl: workout.imageUrl,
        totalDuration: workout.duration,
        elapsedDuration: (workout.duration * 0.7).round(), // 70% complete
        lastAccessed: DateTime.now().subtract(const Duration(hours: 2)),
      );

      _recentWorkouts.add(progress);

      // For demo purposes, also add another recent workout
      if (_workoutsById.length > 1) {
        final secondEntry = _workoutsById.entries.elementAt(1);
        final secondWorkout = secondEntry.value;

        final secondProgress = WorkoutProgress(
          workoutId: secondWorkout.id,
          workoutName: secondWorkout.name,
          imageUrl: secondWorkout.imageUrl,
          totalDuration: secondWorkout.duration,
          elapsedDuration:
              (secondWorkout.duration * 0.3).round(), // 30% complete
          lastAccessed: DateTime.now().subtract(const Duration(days: 1)),
        );

        _recentWorkouts.add(secondProgress);
      }
    }
  }
}
