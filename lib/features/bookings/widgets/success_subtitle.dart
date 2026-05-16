import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';

class SuccessSubtitle extends StatelessWidget {
  final DealItem item;

  const SuccessSubtitle({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your booking for ${item.title} has been confirmed.\nA confirmation email has been sent.',
      style: const TextStyle(
        fontSize: 14,
        color: AppTheme.greyText,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}
