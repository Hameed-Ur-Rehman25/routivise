import '../../domain/entities/workout.dart';
import 'workout_datasource.dart';

class LocalWorkoutDataSource implements WorkoutDataSource {
  final List<Workout> _workouts = [
    // Focus workouts
    Workout(
      id: 'focus_1',
      name: 'Full Body Focus',
      imageUrl: 'assets/images/workout.png',
      exercises: ['Push-ups', 'Squats', 'Lunges', 'Plank', 'Burpees'],
      calories: 350,
      duration: 45,
      tags: ['Advanced', 'Full Body'],
      workoutType: 'Focus',
    ),
    Workout(
      id: 'focus_2',
      name: 'Core Focus',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Sit-ups',
        'Crunches',
        'Leg Raises',
        'Plank',
        'Russian Twists',
      ],
      calories: 250,
      duration: 30,
      tags: ['Intermediate', 'Core'],
      workoutType: 'Focus',
    ),

    // Quick workouts
    Workout(
      id: 'quick_1',
      name: '15-Min Express',
      imageUrl: 'assets/images/workout.png',
      exercises: ['Jumping Jacks', 'Mountain Climbers', 'Burpees'],
      calories: 150,
      duration: 15,
      tags: ['Beginner', 'Quick', 'Full Body'],
      workoutType: 'Quick',
    ),
    Workout(
      id: 'quick_2',
      name: 'Morning Kickstart',
      imageUrl: 'assets/images/workout.png',
      exercises: ['Jumping Jacks', 'Push-ups', 'Squats', 'High Knees'],
      calories: 200,
      duration: 20,
      tags: ['Beginner', 'Morning'],
      workoutType: 'Quick',
    ),

    // HIT workouts
    Workout(
      id: 'hit_1',
      name: 'HIIT Inferno',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Burpees',
        'Jump Squats',
        'Mountain Climbers',
        'High Knees',
        'Jumping Lunges',
      ],
      calories: 450,
      duration: 40,
      tags: ['Advanced', 'High Intensity'],
      workoutType: 'HIT',
    ),
    Workout(
      id: 'hit_2',
      name: 'Tabata Blaster',
      imageUrl: 'assets/images/workout.png',
      exercises: ['Squat Jumps', 'Push-ups', 'Burpees', 'Mountain Climbers'],
      calories: 380,
      duration: 30,
      tags: ['Advanced', 'Tabata'],
      workoutType: 'HIT',
    ),

    // Cardio workouts
    Workout(
      id: 'cardio_1',
      name: 'Cardio Blast',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Jumping Jacks',
        'High Knees',
        'Burpees',
        'Jump Rope',
        'Squat Jumps',
      ],
      calories: 400,
      duration: 35,
      tags: ['Intermediate', 'Cardio'],
      workoutType: 'Cardio',
    ),
    Workout(
      id: 'cardio_2',
      name: 'Fat Burning Cardio',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Mountain Climbers',
        'Jumping Jacks',
        'Burpees',
        'High Knees',
      ],
      calories: 320,
      duration: 25,
      tags: ['Intermediate', 'Fat Burn'],
      workoutType: 'Cardio',
    ),

    // Mind workouts
    Workout(
      id: 'mind_1',
      name: 'Yoga Flow',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Sun Salutation',
        'Warrior Pose',
        'Tree Pose',
        'Child\'s Pose',
        'Savasana',
      ],
      calories: 180,
      duration: 40,
      tags: ['Beginner', 'Flexibility'],
      workoutType: 'Mind',
    ),
    Workout(
      id: 'mind_2',
      name: 'Meditation & Stretch',
      imageUrl: 'assets/images/workout.png',
      exercises: [
        'Deep Breathing',
        'Body Scan',
        'Hamstring Stretch',
        'Back Stretch',
      ],
      calories: 120,
      duration: 30,
      tags: ['Beginner', 'Relaxation'],
      workoutType: 'Mind',
    ),
  ];

  @override
  Future<List<Workout>> getWorkouts() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    return _workouts;
  }

  @override
  Future<List<Workout>> getWorkoutsByType(String workoutType) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    return _workouts
        .where((workout) => workout.workoutType == workoutType)
        .toList();
  }

  @override
  Future<Workout> getWorkoutById(String id) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    final workout = _workouts.firstWhere(
      (workout) => workout.id == id,
      orElse: () => throw Exception('Workout not found'),
    );
    return workout;
  }
}
