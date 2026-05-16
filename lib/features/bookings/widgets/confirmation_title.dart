import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class ConfirmationTitle extends StatelessWidget {
  const ConfirmationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review & Confirm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Double-check your booking before confirming',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}
