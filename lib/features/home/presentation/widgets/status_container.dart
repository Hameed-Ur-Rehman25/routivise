import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class StatusContainer extends StatelessWidget {
  final String title;
  final String imagePath;
  final String value;
  final String routeName;

  const StatusContainer({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.value,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          // const SizedBox(height: 5),
          Image.asset(
            imagePath,
            height: 45,
            // width: 50,
          ),
          // const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          // const SizedBox(height: 5),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routeName);
              },
              style: AppStyles.smallButtonStyle,
              child: const Text(
                'Change',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
