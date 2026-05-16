import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import 'data/wishlist_data.dart';
import 'fliter_button.dart';

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Wishlist',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.favorite, color: AppTheme.brightBlue, size: 18),
              const SizedBox(width: 6),
              Text(
                '${wishlistItems.length} items saved for your next adventure',
                style: const TextStyle(color: AppTheme.greyText, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 16),
         const Row(
            children: [
              FilterButton(label: 'Filter by type', isPrimary: false),
              const SizedBox(width: 12),
              FilterButton(label: 'Share List', isPrimary: true),
            ],
          ),
        ],
      ),
    );
  }
}
