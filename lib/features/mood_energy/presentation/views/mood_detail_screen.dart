import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/features/mood_energy/presentation/widgets/widgets.dart';
import 'package:routivise/features/mood_energy/presentation/widgets/draggable_handle.dart';

class MoodDetailScreen extends StatefulWidget {
  const MoodDetailScreen({super.key});

  @override
  State<MoodDetailScreen> createState() => _MoodDetailScreenState();
}

class _MoodDetailScreenState extends State<MoodDetailScreen> {
  String selectedMood = 'Happy';
  double moodValue =
      0.6; // Default to happy (0.0 = angry, 0.5 = neutral, 1.0 = happy)
  final String _userId = 'user-123'; // Added userId as a final member

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final moodProvider = Provider.of<MoodProvider>(context, listen: false);
      moodProvider.fetchCurrentMood(_userId);
      moodProvider.fetchMoodHistory(_userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildHeader(context), Expanded(child: _buildContent())],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    // Different icon based on selected mood
    Widget moodIcon;
    if (selectedMood == 'Sad') {
      moodIcon = const MoodIcon(type: 'angry', size: 100);
    } else if (selectedMood == 'Neutral') {
      moodIcon = const MoodIcon(type: 'neutral', size: 100);
    } else {
      moodIcon = const MoodIcon(type: 'happy', size: 100);
    }

    // Show the current mood based on the slider, not provider, for live update
    return DetailHeader(
      title: 'Current Mood',
      icon: moodIcon,
      statusWidget: Text(selectedMood, style: AppStyles.headerLarge),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.grey[50],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mood Meter', style: AppStyles.sectionTitle),
              const SizedBox(height: 20),
              DraggableMeter(
                initialValue: moodValue,
                gradientColors: [
                  Colors.red.shade400,
                  Colors.amber.shade400,
                  Colors.green.shade400,
                ],
                iconWidgets: [
                  const MoodIcon(type: 'angry', size: 40),
                  const MoodIcon(type: 'happy', size: 40),
                ],
                onValueChanged: (value) {
                  setState(() {
                    moodValue = value;
                    if (value < 0.33) {
                      selectedMood = 'Sad';
                    } else if (value < 0.66) {
                      selectedMood = 'Neutral';
                    } else {
                      selectedMood = 'Happy';
                    }
                  });
                },
                handleBuilder: (value) {
                  Widget emojiIcon;
                  if (value < 0.33) {
                    emojiIcon = const MoodIcon(type: 'angry', size: 40);
                  } else if (value < 0.66) {
                    emojiIcon = const MoodIcon(type: 'neutral', size: 40);
                  } else {
                    emojiIcon = const MoodIcon(type: 'happy', size: 40);
                  }
                  return DraggableHandle(emoji: emojiIcon);
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final moodProvider = Provider.of<MoodProvider>(
                      // Renamed for clarity
                      context,
                      listen: false,
                    );
                    // Use the _userId class member
                    await moodProvider.logMood(selectedMood, _userId);
                    // Fetch history again after logging
                    await moodProvider.fetchMoodHistory(_userId);
                    if (mounted) {
                      // Check if widget is still mounted
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Mood logged successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  style: AppStyles.primaryButtonStyle,
                  child: const Text(
                    'Log Mood',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text('Moods Today', style: AppStyles.sectionTitle),
              Consumer<MoodProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    // Return an empty container or a placeholder if needed,
                    // but not a CircularProgressIndicator.
                    return const SizedBox.shrink();
                  }
                  if (provider.moodHistory.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('No mood data available'),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.moodHistory.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final mood = provider.moodHistory[index];
                      final timeString = DateTimeHelper.formatTimeRange(
                        mood.timestamp.subtract(const Duration(minutes: 25)),
                        mood.timestamp,
                      );
                      return _buildMoodHistoryItem(mood.value, timeString);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodHistoryItem(String mood, String timeRange) {
    return HistoryItem(
      iconWidget: Image.asset(
        'assets/images/smile_emoji.png',
        height: 40,
        width: 40,
      ),
      value: mood,
      timeRange: timeRange,
    );
  }
}
