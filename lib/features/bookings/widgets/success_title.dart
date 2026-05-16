import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class SuccessTitle extends StatelessWidget {
  const SuccessTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Booking Confirmed! 🎉',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppTheme.darkText,
      ),
      textAlign: TextAlign.center,
    );
  }
}
