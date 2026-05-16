import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/wishlist/data/wishlist_data.dart';

class WishlistHotelCard extends StatelessWidget {
  final WishlistHotel hotel;
  final VoidCallback? onBookNow;
  final VoidCallback? onToggleFavorite;

  const WishlistHotelCard({
    super.key,
    required this.hotel,
    this.onBookNow,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  hotel.imageUrl,
                  height: 180,
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
                    height: 180,
                    color: AppTheme.greyBg,
                    child: const Icon(Icons.image_not_supported,
                        color: AppTheme.greyText),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: onToggleFavorite,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 18,
                      ),
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
                Text(
                  hotel.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 15, color: AppTheme.greyText),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        hotel.location,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.greyText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PER NIGHT',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.greyText,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'EGP ${hotel.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onBookNow,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
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
