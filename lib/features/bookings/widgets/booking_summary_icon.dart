import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class BookingSummaryIcon extends StatelessWidget {
  final String type;

  const BookingSummaryIcon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final IconData icon = type == 'hotel'
        ? Icons.hotel
        : type == 'flight'
            ? Icons.flight
            : Icons.local_activity;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
