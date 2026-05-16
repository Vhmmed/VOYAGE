import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/deals/views/secret_deals_screen.dart';
import 'package:voyga/features/wishlist/widgets/wishlist_header.dart';
import 'package:voyga/features/wishlist/widgets/wishlist_hotel_card.dart';
import 'package:voyga/features/wishlist/widgets/wishlist_banner_card.dart';
import 'package:voyga/features/wishlist/data/wishlist_data.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: WishlistHeader(),
                ),
                const SizedBox(height: 24),
                ...wishlistHotels.map(
                  (hotel) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WishlistHotelCard(
                      hotel: hotel,
                      onBookNow: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SecretDealsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: WishlistBannerCard(
                    onInviteFriends: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Share wishlist with friends!')),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
