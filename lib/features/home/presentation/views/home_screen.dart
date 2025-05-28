import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientEnd],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          )
        ],
      )
    );
  }
}
