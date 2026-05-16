import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class PaymentStepTitle extends StatelessWidget {
  const PaymentStepTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Your payment info is secured & encrypted',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}
