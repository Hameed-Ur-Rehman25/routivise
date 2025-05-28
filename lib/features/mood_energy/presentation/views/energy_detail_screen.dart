import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';

class EnergyDetailScreen extends StatelessWidget {
  const EnergyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the provider when the screen is loaded
    final energyProvider = Provider.of<EnergyProvider>(context, listen: false);
    const String userId = 'user-123';
    
    // Fetch energy data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      energyProvider.fetchCurrentEnergy(userId);
      energyProvider.fetchEnergyHistory(userId);
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
                  'Current Energy Levels',
                  style: AppStyles.headerMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Energy icon
          Image.asset(
            'assets/images/water_level.png',
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          // Current percentage
          Consumer<EnergyProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return const CircularProgressIndicator(color: Colors.white);
              }
              final energyPercentage = provider.currentEnergy?.percentage ?? 70;
              return Text(
                '$energyPercentage%',
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
                'Energy Meter',
                style: AppStyles.sectionTitle,
              ),
              const SizedBox(height: 20),
              _buildSlider(),
              const SizedBox(height: 30),
              Center(
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      // Get the current slider value
                      final provider = Provider.of<EnergyProvider>(context, listen: false);
                      const String userId = 'user-123';
                      
                      // Simulate logging at 70% for now
                      // In a real app, you'd get this from a slider or other input
                      provider.logEnergy(70, userId).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Energy level logged successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      });
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                    child: const Text(
                      'Log Energy',
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
                'Energy Levels Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              Consumer<EnergyProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  if (provider.energyHistory.isEmpty) {
                    return const Center(
                      child: Text('No energy data available'),
                    );
                  }
                  
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.energyHistory.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final energy = provider.energyHistory[index];
                      final percentage = '${energy.percentage}%';
                      final timeString = DateTimeHelper.formatTimeRange(
                        energy.timestamp.subtract(const Duration(minutes: 25)),
                        energy.timestamp,
                      );
                      return _buildEnergyHistoryItem(percentage, timeString);
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

  Widget _buildSlider() {
    return Stack(
      children: [
        // Slider background
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Icons on the slider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWaterIcon(Colors.blue.shade600, 40),
            Column(
              children: [
                const SizedBox(height: 20),
                _buildWaterIcon(Colors.blue.shade400, 30),
              ],
            ),
            _buildWaterIcon(Colors.blue.shade300, 40),
          ],
        ),
      ],
    );
  }

  Widget _buildWaterIcon(Color color, double size) {
    return Image.asset(
      'assets/images/water_level.png',
      height: size,
      width: size,
      color: color,
    );
  }

  Widget _buildEnergyHistoryItem(String percentage, String timeRange) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/water_level.png',
            height: 40,
            width: 40,
            color: Colors.blue,
          ),
          const SizedBox(width: 20),
          Text(
            percentage,
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