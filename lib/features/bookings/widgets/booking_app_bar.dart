import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/bookings/widgets/booking_step_indicator.dart';
import 'package:voyga/shared/widgets/app_back_button.dart';

class BookingAppBar extends StatelessWidget {
  final int currentStep;
  final VoidCallback onBack;

  const BookingAppBar({
    super.key,
    required this.currentStep,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              AppBackButton(onBack: onBack),
              const Expanded(
                child: Center(
                  child: Text(
                    'Complete Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 36),
            ],
          ),
          const SizedBox(height: 20),
          BookingStepIndicator(currentStep: currentStep),
        ],
      ),
    );
  }
}
