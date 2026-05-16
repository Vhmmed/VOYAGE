import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class WorldClassEscapeCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;

  const WorldClassEscapeCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 150,
      height: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 2),
      ),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
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
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$price EGP',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

