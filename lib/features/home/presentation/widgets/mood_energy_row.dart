import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/features/home/presentation/widgets/status_container.dart';

class MoodEnergyRow extends StatelessWidget {
  const MoodEnergyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildMoodContainer(),
        const SizedBox(width: 20),
        _buildEnergyContainer(),
      ],
    );
  }

  Widget _buildMoodContainer() {
    return Consumer<MoodProvider>(
      builder: (context, moodProvider, _) {
        final moodValue = moodProvider.currentMood?.value ?? 'Happy';
        return StatusContainer(
          title: 'Mood',
          imagePath: 'assets/images/smile_emoji.png',
          value: moodValue,
          routeName: AppRoutes.moodDetail,
        );
      },
    );
  }

  Widget _buildEnergyContainer() {
    return Consumer<EnergyProvider>(
      builder: (context, energyProvider, _) {
        final energyValue =
            energyProvider.currentEnergy?.percentage.toString() ?? '70';
        return StatusContainer(
          title: 'Energy',
          imagePath: 'assets/images/water_level.png',
          value: '$energyValue%',
          routeName: AppRoutes.energyDetail,
        );
      },
    );
  }
}
