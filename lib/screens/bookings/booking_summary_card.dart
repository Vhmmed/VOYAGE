import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// ─── Booking Summary Card ─────────────────────────────────────────────────────
// Shows a compact summary of what is being booked (hotel / flight / activity)

class BookingSummaryCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const BookingSummaryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          BookingSummaryIcon(type: item['type']),
          const SizedBox(width: 12),
          Expanded(child: BookingSummaryText(item: item)),
          BookingSummaryPrice(price: item['price']),
        ],
      ),
    );
  }
}

// ─── Booking Summary Icon ─────────────────────────────────────────────────────

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

// ─── Booking Summary Text ─────────────────────────────────────────────────────

class BookingSummaryText extends StatelessWidget {
  final Map<String, dynamic> item;

  const BookingSummaryText({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String subtitle = item['type'] == 'flight'
        ? item['subtitle'] ?? ''
        : item['type'] == 'activity'
            ? '${item['duration']} • ${item['capacity']}'
            : item.containsKey('rating')
                ? '★ ${item['rating']} (${item['reviews']} reviews)'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item['title'],
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

// ─── Booking Summary Price ────────────────────────────────────────────────────

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
