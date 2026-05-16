import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/explore/data/explore_data.dart';
import 'package:voyga/features/explore/views/destinations_flight_screen.dart';

class TopDestinationsSection extends StatelessWidget {
  const TopDestinationsSection({super.key});

  void _openDestinationsFlightScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DestinationsFlightScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              GestureDetector(
                onTap: () => _openDestinationsFlightScreen(context),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: topDestinationCities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final city = topDestinationCities[index];
              return GestureDetector(
                onTap: () => _openDestinationsFlightScreen(context),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        city['image']!,
                        width: 100,
                        height: 100,
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
                          width: 100,
                          height: 100,
                          color: AppTheme.greyBg,
                          child: const Icon(Icons.image_not_supported,
                              color: AppTheme.greyText),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      city['name']!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
