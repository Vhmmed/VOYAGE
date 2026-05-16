import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class StepDot extends StatelessWidget {
  final int index;
  final int currentStep;
  final String label;

  const StepDot({
    super.key,
    required this.index,
    required this.currentStep,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = currentStep > index;
    final bool isActive = currentStep == index;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted || isActive
                ? AppTheme.primaryBlue
                : AppTheme.greyBg,
            border: Border.all(
              color: isActive ? AppTheme.primaryBlue : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.white : AppTheme.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive || isCompleted
                ? AppTheme.primaryBlue
                : AppTheme.greyText,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
