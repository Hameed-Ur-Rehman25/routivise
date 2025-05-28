import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';

class MoodDetailScreen extends StatelessWidget {
  const MoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the provider when the screen is loaded
    final moodProvider = Provider.of<MoodProvider>(context, listen: false);
    const String userId = 'user-123';
    
    // Fetch mood data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moodProvider.fetchCurrentMood(userId);
      moodProvider.fetchMoodHistory(userId);
    });
    
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          // Back button and title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Current Mood',
                  style: AppStyles.headerMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Mood emoji
          Image.asset(
            'assets/images/smile_emoji.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          // Current mood
          Consumer<MoodProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return const CircularProgressIndicator(color: Colors.white);
              }
              final moodValue = provider.currentMood?.value ?? 'Happy';
              return Text(
                moodValue,
                style: AppStyles.headerLarge,
              );
            },
          ),
        ],
      ),
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
              const Text(
                'Mood Meter',
                style: AppStyles.sectionTitle,
              ),
              const SizedBox(height: 20),
              _buildMoodSlider(),
              const SizedBox(height: 30),
              Center(
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<MoodProvider>(context, listen: false);
                      const String userId = 'user-123';
                      
                      // Simulate logging 'Happy' for now
                      // In a real app, you'd get this from the mood selection
                      provider.logMood('Happy', userId).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mood logged successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      });
                    },
                    style: AppStyles.primaryButtonStyle,
                    child: const Text(
                      'Log Mood',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Moods Today',
                style: AppStyles.sectionTitle,
              ),
              const SizedBox(height: 15),
              Consumer<MoodProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  if (provider.moodHistory.isEmpty) {
                    return const Center(
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

  Widget _buildMoodSlider() {
    return Stack(
      children: [
        // Slider background (gradient from red to green)
        Container(
          height: 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade400,
                Colors.amber.shade400,
                Colors.green.shade400,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Mood icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMoodIcon('angry', 40),
            Column(
              children: [
                const SizedBox(height: 20),
                _buildMoodIcon('happy', 30),
              ],
            ),
            _buildMoodIcon('happy', 40),
          ],
        ),
      ],
    );
  }

  Widget _buildMoodIcon(String type, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: type == 'angry' ? Colors.red.shade400 : Colors.amber.shade400,
        shape: BoxShape.circle,
      ),
      child: Icon(
        type == 'angry' ? Icons.sentiment_very_dissatisfied : Icons.sentiment_very_satisfied,
        color: Colors.white,
        size: size * 0.7,
      ),
    );
  }

  Widget _buildMoodHistoryItem(String mood, String timeRange) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppStyles.cardDecoration,
      child: Row(
        children: [
          Image.asset(
            'assets/images/smile_emoji.png',
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 20),
          Text(
            mood,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            timeRange,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}