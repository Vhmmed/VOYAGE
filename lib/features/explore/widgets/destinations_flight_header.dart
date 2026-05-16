import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/app_back_button.dart';

class DestinationsFlightHeader extends StatelessWidget {
  const DestinationsFlightHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppBackButton(),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Top Destinations',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '& Flight Deals',
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
