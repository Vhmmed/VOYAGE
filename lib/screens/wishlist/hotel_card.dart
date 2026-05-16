import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../details/hotel_details_screen.dart';

// ─── Hotel Card Widget ────────────────────────────────────────────────────────

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildInfo(context),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Image.network(
            hotel['image'],
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        if (hotel.containsKey('badge'))
          Positioned(
            top: 12,
            left: 12,
            child: _buildBadge(hotel['badge'], hotel['badgeColor']),
          ),
        Positioned(
          top: 12,
          right: 12,
          child: _buildFavoriteButton(),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotel['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              if (hotel.containsKey('rating')) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${hotel['rating']} (${hotel['reviews']} reviews)',
                      style: const TextStyle(color: AppTheme.greyText),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              Text(
                hotel['price'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HotelDetailsScreen(hotel: hotel),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.lightBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(hotel['buttonText'] ?? 'Book Now'),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(6),
        child: Icon(Icons.favorite, color: Colors.red, size: 20),
      ),
    );
  }
}
