import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trips/data/trip_data.dart';

class ActiveTripCard extends StatelessWidget {
  final VoidCallback? onViewDetails;
  final VoidCallback? onManage;

  const ActiveTripCard({super.key, this.onViewDetails, this.onManage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                Image.network(
                  activeImage,
                  height: 160,
                  width: double.infinity,
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
                    height: 160,
                    color: AppTheme.greyBg,
                    child: const Icon(Icons.image_not_supported,
                        color: AppTheme.greyText),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.grey),
                        SizedBox(width: 6),
                        Text(
                          'ACTIVE PLANNING',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.darkText,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            activeDestination,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkText,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  size: 14, color: AppTheme.greyText),
                              const SizedBox(width: 6),
                              Text(
                                '$activeStartDate - $activeEndDate',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppTheme.greyText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'TOTAL BUDGET',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.greyText,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$activeBudget EGP',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const Icon(Icons.person_outline,
                        size: 14, color: AppTheme.greyText),
                    const SizedBox(width: 6),
                    Text(
                      activeTravelers,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.greyText,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.flight_takeoff,
                        size: 14, color: AppTheme.greyText),
                    const SizedBox(width: 6),
                    Text(
                      activeFlight,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.greyText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onViewDetails,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryBlue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'View Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: onManage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.greyBg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Manage',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
