import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 200,
          child: Icon(
            Icons.flight_takeoff,
            size: 100,
            color: AppTheme.greyText.withValues(alpha: 0.15),
          ),
        ),
       const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Your Wishlist',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '12 ITEMS SAVED',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlue,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
