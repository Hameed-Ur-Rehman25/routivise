import 'package:flutter/material.dart';

class EnergyIcon extends StatelessWidget {
  final Color color;
  final double size;

  const EnergyIcon({super.key, required this.color, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/water_level.png',
      height: size,
      width: size,
      color: color,
    );
  }
}
