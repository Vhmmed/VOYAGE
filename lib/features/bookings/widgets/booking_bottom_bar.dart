import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class BookingBottomBar extends StatelessWidget {
  final int currentStep;
  final VoidCallback onNext;

  const BookingBottomBar({
    super.key,
    required this.currentStep,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      'Continue to Payment',
      'Review Booking',
      'Confirm & Pay',
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            labels[currentStep],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
