import 'package:flutter/material.dart';
import 'package:voyga/screens/wishlist/wishlist_header.dart';
import '../../themes/app_theme.dart';
import 'data/wishlist_data.dart';
import 'hotel_card.dart';
import 'flight_card.dart';
import 'activity_card.dart';
import 'engagement_sections.dart';

// ─── Wishlist Screen ──────────────────────────────────────────────────────────

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              const WishlistHeader(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    return _buildCard(context, wishlistItems[index]);
                  },
                ),
              ),
              const EngagementSections(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }



  // ── Card Router ──────────────────────────────────────────────────────────────
  Widget _buildCard(BuildContext context, Map<String, dynamic> item) {
    switch (item['type']) {
      case 'hotel':
        return HotelCard(hotel: item);
      case 'flight':
        return FlightCard(flight: item);
      case 'activity':
        return ActivityCard(activity: item);
      default:
        return const SizedBox.shrink();
    }
  }
}


