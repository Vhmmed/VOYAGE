import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// ─── Booking Step Indicator ───────────────────────────────────────────────────

class BookingStepIndicator extends StatelessWidget {
  final int currentStep; // 0, 1, 2

  const BookingStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepDot(index: 0, currentStep: currentStep, label: 'Info'),
        StepLine(isActive: currentStep >= 1),
        StepDot(index: 1, currentStep: currentStep, label: 'Payment'),
        StepLine(isActive: currentStep >= 2),
        StepDot(index: 2, currentStep: currentStep, label: 'Confirm'),
      ],
    );
  }
}

// ─── Step Dot ─────────────────────────────────────────────────────────────────

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

// ─── Step Line ────────────────────────────────────────────────────────────────

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
