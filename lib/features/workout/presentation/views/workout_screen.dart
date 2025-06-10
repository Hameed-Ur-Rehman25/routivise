import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/workout_viewmodel.dart';
import '../widgets/workout_card.dart';
import '../views/workout_detail_screen.dart';

class WorkoutScreen extends StatefulWidget {
  final bool showNavBar;

  const WorkoutScreen({super.key, this.showNavBar = true});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize with Focus workout type
    Future.microtask(
      () => context.read<WorkoutViewModel>().fetchWorkoutsByType('Focus'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Workout Planner',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                _buildWorkoutTypeButtons(),
                const SizedBox(height: 20),
                _buildGenerateButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Now the remaining content is in a single scrollable area
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContinueWatchingSection(),
                    const SizedBox(height: 20),
                    _buildWorkoutListHeader(),
                    const SizedBox(height: 10),
                    _buildWorkoutsList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutTypeButtons() {
    final viewModel = Provider.of<WorkoutViewModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildWorkoutTypeButton(
            icon: Image.asset(
              'assets/icons/focus.png',
              height: 24,
              color:
                  viewModel.selectedWorkoutType == 'Focus'
                      ? Colors.white
                      : Colors.black54,
            ),
            label: 'Focus',
            isSelected: viewModel.selectedWorkoutType == 'Focus',
            onTap: () => viewModel.fetchWorkoutsByType('Focus'),
          ),
          const SizedBox(width: 12),
          _buildWorkoutTypeButton(
            icon: Image.asset(
              'assets/icons/quick.png',
              height: 24,
              color:
                  viewModel.selectedWorkoutType == 'Quick'
                      ? Colors.white
                      : Colors.black54,
            ),
            label: 'Quick',
            isSelected: viewModel.selectedWorkoutType == 'Quick',
            onTap: () => viewModel.fetchWorkoutsByType('Quick'),
          ),
          const SizedBox(width: 12),
          _buildWorkoutTypeButton(
            icon: Image.asset(
              'assets/icons/Hit.png',
              height: 24,
              color:
                  viewModel.selectedWorkoutType == 'HIT'
                      ? Colors.white
                      : Colors.black54,
            ),
            label: 'HIT',
            isSelected: viewModel.selectedWorkoutType == 'HIT',
            onTap: () => viewModel.fetchWorkoutsByType('HIT'),
          ),
          const SizedBox(width: 12),
          _buildWorkoutTypeButton(
            icon: Image.asset(
              'assets/icons/cardio.png',
              height: 24,
              color:
                  viewModel.selectedWorkoutType == 'Cardio'
                      ? Colors.white
                      : Colors.black54,
            ),
            label: 'Cardio',
            isSelected: viewModel.selectedWorkoutType == 'Cardio',
            onTap: () => viewModel.fetchWorkoutsByType('Cardio'),
          ),
          const SizedBox(width: 12),
          _buildWorkoutTypeButton(
            icon: Image.asset(
              'assets/icons/Mind.png',
              height: 24,
              color:
                  viewModel.selectedWorkoutType == 'Mind'
                      ? Colors.white
                      : Colors.black54,
            ),
            label: 'Mind',
            isSelected: viewModel.selectedWorkoutType == 'Mind',
            onTap: () => viewModel.fetchWorkoutsByType('Mind'),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutTypeButton({
    required Widget icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4A93EC) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle generate workout plan action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Generating new AI workout...')),
          );
          context.read<WorkoutViewModel>().fetchWorkouts();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A93EC),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        icon: const Icon(Icons.refresh, color: Colors.white),
        label: const Text(
          'Generate New AI Workout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildContinueWatchingSection() {
    final viewModel = Provider.of<WorkoutViewModel>(context);
    final recentWorkouts = viewModel.recentWorkouts;

    if (recentWorkouts.isEmpty) {
      return const SizedBox.shrink(); // Hide if no recent workouts
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Continue Watching',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentWorkouts.length,
            itemBuilder: (context, index) {
              final progress = recentWorkouts[index];
              // Make width match the full screen width minus padding
              return Container(
                width:
                    MediaQuery.of(context).size.width -
                    32, // Full width minus horizontal padding
                margin: const EdgeInsets.only(right: 16),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Continuing previous workout...'),
                        ),
                      );
                      // Navigate to detail screen
                      final workout = await viewModel.getWorkoutById(
                        progress.workoutId,
                      );
                      if (workout != null && context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => WorkoutDetailScreen(
                                  workoutId: progress.workoutId,
                                ),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                progress.imageUrl,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback if image fails to load
                                  return Container(
                                    height: 120,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.fitness_center,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 5,
                                child: LinearProgressIndicator(
                                  value: progress.completionPercentage,
                                  backgroundColor: Colors.grey[300],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF4A93EC),
                                      ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  progress.workoutName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                progress.formattedCompletionPercentage,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutListHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Workouts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutsList() {
    final viewModel = Provider.of<WorkoutViewModel>(context);

    if (viewModel.isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (viewModel.error != null) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.error!),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed:
                    () => viewModel.fetchWorkoutsByType(
                      viewModel.selectedWorkoutType,
                    ),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    if (viewModel.workouts.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'No workouts available for this category.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    // Now return a Column instead of ListView since we're already in a ScrollView
    return Column(
      children:
          viewModel.workouts.map((workout) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: WorkoutCard(workout: workout),
            );
          }).toList(),
    );
  }
}
