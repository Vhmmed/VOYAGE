import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class WishlistBannerCard extends StatelessWidget {
  final VoidCallback? onInviteFriends;

  const WishlistBannerCard({super.key, this.onInviteFriends});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue,
            AppTheme.purpleAccent,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Icon(
              Icons.group,
              size: 80,
              color: Colors.white.withValues(alpha: 0.15),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Planning a trip with friends?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Share your wishlist and vote on your next favorite destination together.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: onInviteFriends,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Invite Friends',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
