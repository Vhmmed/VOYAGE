import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/app_back_button.dart';

class TripPlannerHeader extends StatelessWidget {
  const TripPlannerHeader({super.key});

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
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trip Planner',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Design your next ethereal journey to Cairo.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.greyText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
