import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../details/hotel_details_screen.dart';
import '../details/flight_details_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedNavIndex = 2; // Wishlist active

  final List<Map<String, dynamic>> _wishlistItems = [
    {
      'type': 'hotel',
      'title': 'The Savoy Regency',
      'price': '12,400 EGP / night',
      'image':
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
      'badge': 'FREE CANCELLATION',
      'badgeColor': Colors.green,
      'rating': 4.7,
      'reviews': 1890,
    },
    {
      'type': 'flight',
      'title': 'CAI → LHR',
      'subtitle': 'Direct • Flight MS777',
      'price': '15,850 EGP',
      'badge': 'Price Drop! Lowest in 30 days',
      'badgeColor': const Color(0xFF8B5CF6),
      'buttonText': 'Select',
      'from': 'CAI',
      'to': 'LHR',
      'departureTime': '10:30 AM',
      'arrivalTime': '2:15 PM',
      'duration': '3h 45m',
      'stops': 'Non-stop',
      'flightNumber': 'MS777',
      'airline': 'EgyptAir',
    },
    {
      'type': 'activity',
      'title': 'Luxor Balloon Ride',
      'duration': '4 hours',
      'capacity': 'Up to 4 people',
      'image':
          'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=400',
      'badge': 'PRIVATE TOUR',
      'badgeColor': Colors.orange,
      'price': '2,500 EGP / person',
    },
    {
      'type': 'hotel',
      'title': 'Rixos Premium Seagate',
      'rating': 4.8,
      'reviews': 1240,
      'price': '8,200 EGP / night',
      'image':
          'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopAppBar(),
              _buildHeaderAndFilters(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  itemCount: _wishlistItems.length,
                  itemBuilder: (context, index) {
                    return _buildWishlistCard(_wishlistItems[index]);
                  },
                ),
              ),
              _buildEngagementSections(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Voyage',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue)),
          CircleAvatar(
            backgroundColor: AppTheme.greyBg,
            child: IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.primaryBlue),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAndFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Wishlist',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.favorite, color: AppTheme.brightBlue, size: 18),
              const SizedBox(width: 6),
              Text(
                  '${_wishlistItems.length} items Saved for your next adventure',
                  style: const TextStyle(color: AppTheme.greyText, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildFilterButton('Filter by type', isPrimary: false),
              const SizedBox(width: 12),
              _buildFilterButton('Share List', isPrimary: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, {required bool isPrimary}) {
    return Expanded(
      child: isPrimary
          ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.brightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(text),
            )
          : OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.darkText,
                side: BorderSide(color: AppTheme.greyText.withOpacity(0.5)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(text),
            ),
    );
  }

  Widget _buildWishlistCard(Map<String, dynamic> item) {
    final type = item['type'];
    if (type == 'hotel') return _buildHotelCard(item);
    if (type == 'flight') return _buildFlightCard(item);
    if (type == 'activity') return _buildActivityCard(item);
    return const SizedBox.shrink();
  }

  // ---------------------- Hotel Card ----------------------
  Widget _buildHotelCard(Map<String, dynamic> hotel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(hotel['image'],
                    height: 180, width: double.infinity, fit: BoxFit.cover),
              ),
              if (hotel.containsKey('badge'))
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: hotel['badgeColor'],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(hotel['badge'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 4)
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.favorite, color: Colors.red, size: 20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hotel['title'],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkText)),
                    if (hotel.containsKey('rating'))
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                              '${hotel['rating']} (${hotel['reviews']} reviews)',
                              style: const TextStyle(color: AppTheme.greyText)),
                        ],
                      ),
                    const SizedBox(height: 8),
                    Text(hotel['price'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى تفاصيل الفندق عند الضغط على الزر فقط
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HotelDetailsScreen(hotel: hotel),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(hotel.containsKey('buttonText')
                      ? hotel['buttonText']
                      : 'Book Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- Flight Card ----------------------
  Widget _buildFlightCard(Map<String, dynamic> flight) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(flight['title'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkText)),
              ),
              const Icon(Icons.favorite, color: Colors.red, size: 24),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(flight['subtitle'],
                  style: const TextStyle(fontSize: 14, color: AppTheme.greyText)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: flight['badgeColor'],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(flight['badge'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(flight['price'],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue)),
              ElevatedButton(
                onPressed: () {
                  // الانتقال إلى تفاصيل الرحلة عند الضغط على الزر فقط
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FlightDetailsScreen(flight: flight),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.brightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(flight['buttonText']),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------- Activity Card (similar to hotel) ----------------------
  Widget _buildActivityCard(Map<String, dynamic> activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  activity['image'],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppTheme.greyBg,
                    child: const Icon(Icons.broken_image, size: 40),
                  ),
                ),
              ),
              if (activity.containsKey('badge'))
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: activity['badgeColor'],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(activity['badge'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 4)
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.favorite, color: Colors.red, size: 20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity['title'],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkText)),
                    const SizedBox(height: 4),
                    Text('${activity['duration']} • ${activity['capacity']}',
                        style: const TextStyle(color: AppTheme.greyText)),
                    const SizedBox(height: 8),
                    if (activity.containsKey('price'))
                      Text(activity['price'],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryBlue)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // يمكن توجيه النشاط إلى شاشة تفاصيل منفصلة لاحقاً أو شاشة عامة
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تفاصيل النشاط قريباً')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- Engagement Sections ----------------------
  Widget _buildEngagementSections() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: AppTheme.greyText.withOpacity(0.5), width: 1.5),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.greyBg),
                      child: const Icon(Icons.add, color: AppTheme.brightBlue),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Find more to love',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkText)),
                        Text('Discover new destinations',
                            style: TextStyle(
                                fontSize: 12, color: AppTheme.greyText)),
                      ],
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Browse Destinations',
                        style: TextStyle(color: AppTheme.brightBlue))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.darkText,
                borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planning a trip with friends?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 4),
                    Text('Create a shared wishlist',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.people),
                  label: const Text('Create Shared Wishlist'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.darkText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  // ---------------------- Bottom Navigation Bar ----------------------