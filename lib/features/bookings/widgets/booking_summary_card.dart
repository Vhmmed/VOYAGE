import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/features/bookings/widgets/booking_summary_icon.dart';
import 'package:voyga/features/bookings/widgets/booking_summary_text.dart';
import 'package:voyga/features/bookings/widgets/booking_summary_price.dart';

class BookingSummaryCard extends StatelessWidget {
  final DealItem item;

  const BookingSummaryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          BookingSummaryIcon(type: item.type),
          const SizedBox(width: 12),
          Expanded(child: BookingSummaryText(item: item)),
          BookingSummaryPrice(price: item.price),
        ],
      ),
    );
  }
}
