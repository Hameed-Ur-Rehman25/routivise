import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/widgets/widgets.dart';
import 'package:routivise/features/mood_energy/presentation/widgets/draggable_handle.dart';

class EnergyDetailScreen extends StatefulWidget {
  const EnergyDetailScreen({super.key});

  @override
  State<EnergyDetailScreen> createState() => _EnergyDetailScreenState();
}

class _EnergyDetailScreenState extends State<EnergyDetailScreen> {
  double energyValue = 0.7; // Default to 70% energy
  int energyPercentage = 70;
  final String _userId = 'user-123'; // Added userId as a final member

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final energyProvider = Provider.of<EnergyProvider>(
        context,
        listen: false,
      );
      energyProvider.fetchCurrentEnergy(_userId);
      energyProvider.fetchEnergyHistory(_userId);
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
    return DetailHeader(
      title: 'Current Energy Levels',
      icon: Image.asset(
        'assets/images/water_level.png',
        height: 100,
        width: 100,
        color: Colors.white,
      ),
      statusWidget: Text('$energyPercentage%', style: AppStyles.headerLarge),
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
              const Text('Energy Meter', style: AppStyles.sectionTitle),
              const SizedBox(height: 20),
              _buildSlider(),
              const SizedBox(height: 30),
              Center(
                child: Builder(
                  builder:
                      (context) => ElevatedButton(
                        onPressed: () async {
                          // Made onPressed async
                          // Get the current slider value
                          final energyProvider = Provider.of<EnergyProvider>(
                            // Renamed for clarity
                            context,
                            listen: false,
                          );
                          // Use the _userId class member
                          await energyProvider.logEnergy(
                            energyPercentage,
                            _userId,
                          );
                          // Fetch history again after logging
                          await energyProvider.fetchEnergyHistory(_userId);
                          if (mounted) {
                            // Check if widget is still mounted
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Energy level logged successfully!',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: AppStyles.primaryButtonStyle,
                        child: const Text(
                          'Log Energy',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 30),
              const Text('Energy Levels Today', style: AppStyles.sectionTitle),

              Consumer<EnergyProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const SizedBox.shrink();
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
    return DraggableMeter(
      initialValue: energyValue,
      gradientColors: [
        Colors.blue.shade600,
        Colors.blue.shade400,
        Colors.blue.shade300,
      ],
      iconWidgets: [
        EnergyIcon(color: Colors.blue.shade600, size: 40),
        EnergyIcon(color: Colors.blue.shade300, size: 40),
      ],
      onValueChanged: (value) {
        setState(() {
          energyValue = value;
          energyPercentage = (value * 100).round();
        });
      },
      handleBuilder: (value) {
        // You can customize the emoji or icon for the handle here
        return DraggableHandle(
          emoji: Image.asset(
            'assets/images/water_level.png',
            height: 40,
            width: 40,
            color: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildEnergyHistoryItem(String percentage, String timeRange) {
    return HistoryItem(
      iconWidget: Image.asset(
        'assets/images/water_level.png',
        height: 40,
        width: 40,
        color: Colors.blue,
      ),
      value: percentage,
      timeRange: timeRange,
    );
  }
}
