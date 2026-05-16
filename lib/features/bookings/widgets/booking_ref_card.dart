import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class BookingRefCard extends StatelessWidget {
  const BookingRefCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: const Column(
        children: [
          Text(
            'Booking Reference',
            style: TextStyle(fontSize: 12, color: AppTheme.greyText),
          ),
          SizedBox(height: 8),
          _RefText(),
        ],
      ),
    );
  }
}

class _RefText extends StatelessWidget {
  const _RefText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'VYG-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryBlue,
        letterSpacing: 4,
      ),
    );
  }
}
