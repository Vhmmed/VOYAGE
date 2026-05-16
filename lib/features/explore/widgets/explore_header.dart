import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Hi Ali,',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'explore the world',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlue,
          ),
        ),
      ],
    );
  }
}
