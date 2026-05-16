import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trips/data/trip_data.dart';

class PastTripCard extends StatelessWidget {
  final PastTrip trip;

  const PastTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              trip.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: AppTheme.greyBg,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => Container(
                width: 64,
                height: 64,
                color: AppTheme.greyBg,
                child: const Icon(Icons.image_not_supported,
                    color: AppTheme.greyText, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.destination,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${trip.monthYear} • ${trip.days}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.greyText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Spent: ${trip.spent} EGP',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'COMPLETED',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlue,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
