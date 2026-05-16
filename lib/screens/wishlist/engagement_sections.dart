import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

// ─── Engagement Sections ──────────────────────────────────────────────────────

class EngagementSections extends StatelessWidget {
  const EngagementSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildDiscoverCard(),
          const SizedBox(height: 16),
          _buildSharedWishlistCard(),
        ],
      ),
    );
  }

  Widget _buildDiscoverCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.greyText.withOpacity(0.5),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.greyBg,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.add, color: AppTheme.brightBlue),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find more to love',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText,
                      ),
                    ),
                    Text(
                      'Discover new destinations',
                      style: TextStyle(fontSize: 12, color: AppTheme.greyText),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Browse Destinations',
              style: TextStyle(color: AppTheme.brightBlue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharedWishlistCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkText,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Planning a trip with friends?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Create a shared wishlist',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.people),
              label: const Text('Create Shared Wishlist'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.darkText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}