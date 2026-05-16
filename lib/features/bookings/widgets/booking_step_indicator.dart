import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/step_dot.dart';
import 'package:voyga/features/bookings/widgets/step_line.dart';

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
