import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trip_planner/data/trip_planner_data.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryBlue, width: 2),
      ),
      child: Stack(
        children: [
          Image.network(
            activeImage,
            width: double.infinity,
            height: double.infinity,
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
              color: AppTheme.greyBg,
              child: const Icon(Icons.image_not_supported,
                  color: AppTheme.greyText),
            ),
          ),
         const Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activeCity,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'ACTIVE ITINERARY',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppTheme.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.open_in_full,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
