import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/models/deal_item.dart';

class BookingSummaryText extends StatelessWidget {
  final DealItem item;

  const BookingSummaryText({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String subtitle = item.type == 'flight'
        ? item.subtitle
        : item.type == 'tour'
            ? '${item.duration ?? ''} • ${item.capacity ?? ''}'
            : item.rating != null
                ? '★ ${item.rating} (${item.reviews} reviews)'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppTheme.darkText,
          ),
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: AppTheme.greyText),
          ),
      ],
    );
  }
}
