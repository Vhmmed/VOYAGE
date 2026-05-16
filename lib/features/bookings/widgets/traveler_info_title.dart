import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class TravelerInfoTitle extends StatelessWidget {
  const TravelerInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traveler Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Please fill in the details below',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}
