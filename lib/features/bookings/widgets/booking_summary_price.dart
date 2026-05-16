import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class BookingSummaryPrice extends StatelessWidget {
  final String price;

  const BookingSummaryPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: AppTheme.primaryBlue,
      ),
    );
  }
}
