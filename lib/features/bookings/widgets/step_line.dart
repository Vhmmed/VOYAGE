import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class StepLine extends StatelessWidget {
  final bool isActive;

  const StepLine({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 2,
        color: isActive ? AppTheme.primaryBlue : AppTheme.greyBg,
      ),
    );
  }
}
