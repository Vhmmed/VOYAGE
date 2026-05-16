import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class PaymentCardTitle extends StatelessWidget {
  const PaymentCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Card Information',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppTheme.darkText,
      ),
    );
  }
}
