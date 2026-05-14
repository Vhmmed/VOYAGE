import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

class HotelDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> hotel;

  const HotelDetailsScreen({super.key, required this.hotel});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  int _selectedRoomIndex = 0;
  bool _policiesExpanded = false;

  // روابط صور مضمونة (بديلة للروابط القديمة)
  final List<Map<String, dynamic>> _rooms = [
    {
      'type': 'Standard Room',
      'image':
          'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=400',
      'capacity': '2 guests',
      'size': '28 sqm',
      'price': '120',
      'cancellation': 'Free cancellation'
    },
    {
      'type': 'Deluxe Suite',
      'image':
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400', // رابط صحيح يعمل
      'capacity': '4 guests',
      'size': '55 sqm',
      'price': '220',
      'cancellation': 'Non-refundable'
    },
    {
      'type': 'Executive Room',
      'image':
          'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=400',
      'capacity': '2 guests',
      'size': '35 sqm',
      'price': '180',
      'cancellation': 'Free cancellation'
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
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGallery(),
                    _buildHotelInfo(),
                    _buildAmenities(),
                    _buildRooms(),
                    _buildReviews(),
                    _buildMapSection(),
                    _buildPolicies(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _buildStickyBookingBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGallery() {
    final images = [
      widget.hotel['image'] ??
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
      'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800',
      'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800',
    ];
    return Stack(
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            itemCount: images.length,
            itemBuilder: (_, index) => Image.network(
              images[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppTheme.greyBg,
                child: const Icon(Icons.broken_image,
                    size: 50, color: AppTheme.greyText),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _buildHotelInfo() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.hotel['title'],
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                  '${widget.hotel['rating'] ?? 4.8} ★ (${widget.hotel['reviews'] ?? 2300} reviews)'),
              const SizedBox(width: 16),
              const Icon(Icons.location_on, size: 18, color: AppTheme.greyText),
              const SizedBox(width: 4),
              const Text('2 km from airport',
                  style: TextStyle(color: AppTheme.greyText)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Downtown Cairo', style: TextStyle(color: AppTheme.brightBlue)),
        ],
      ),
    );
  }

  Widget _buildAmenities() {
    final amenities = [
      {'icon': Icons.wifi, 'label': 'WiFi'},
      {'icon': Icons.pool, 'label': 'Pool'},
      {'icon': Icons.free_breakfast, 'label': 'Breakfast'},
      {'icon': Icons.local_parking, 'label': 'Parking'},
      {'icon': Icons.fitness_center, 'label': 'Gym'},
      {'icon': Icons.spa, 'label': 'Spa'},
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Amenities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: amenities
                .map((a) =>
                    _amenityChip(a['icon'] as IconData, a['label'] as String))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _amenityChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppTheme.greyBg, borderRadius: BorderRadius.circular(30)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Text(label)
      ]),
    );
  }

  // ---------------------- ROOMS SECTION (تم إصلاح overflow) ----------------------
  Widget _buildRooms() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Available Rooms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          SizedBox(
            height: 280, // ✅ زيادة الارتفاع لحل مشكلة overflow
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                final room = _rooms[index];
                return GestureDetector(
                  onTap: () => setState(() => _selectedRoomIndex = index),
                  child: Container(
                    width: 260,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: _selectedRoomIndex == index
                          ? AppTheme.lightBlue.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: _selectedRoomIndex == index
                          ? Border.all(color: AppTheme.brightBlue)
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.network(
                            room['image'],
                            height: 140, // ✅ زيادة ارتفاع الصورة
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 140,
                              color: AppTheme.greyBg,
                              child: const Icon(Icons.broken_image,
                                  size: 40, color: AppTheme.greyText),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(room['type'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('${room['capacity']} • ${room['size']}',
                                  style: const TextStyle(color: AppTheme.greyText)),
                              const SizedBox(height: 8),
                              Text('\$${room['price']} / night',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.brightBlue)),
                              const SizedBox(height: 4),
                              Text(room['cancellation'],
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.green)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Reviews & Ratings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppTheme.brightBlue,
                  child: Text('4.8',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    _ratingRow('Cleanliness', 4.9),
                    _ratingRow('Service', 4.7),
                    _ratingRow('Location', 4.8),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('“Amazing stay, highly recommend!” – John Doe',
              style: TextStyle(color: AppTheme.greyText)),
        ],
      ),
    );
  }

  Widget _ratingRow(String label, double value) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(label)),
        Expanded(
            flex: 3,
            child: LinearProgressIndicator(
                value: value / 5,
                backgroundColor: AppTheme.greyBg,
                color: AppTheme.brightBlue)),
        const SizedBox(width: 8),
        Text(value.toString()),
      ],
    );
  }

  Widget _buildMapSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            height: 150,
            color: AppTheme.greyBg,
            child: const Center(
                child: Text('Map Preview (Google Maps)',
                    style: TextStyle(color: AppTheme.greyText))),
          ),
          const SizedBox(height: 8),
          const Text('Nearby: Metro Station (500m), Restaurants, Airport 2km',
              style: TextStyle(color: AppTheme.greyText)),
        ],
      ),
    );
  }

  Widget _buildPolicies() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _policiesExpanded = !_policiesExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Policies',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(_policiesExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          if (_policiesExpanded) ...[
            const SizedBox(height: 12),
            _infoRow(Icons.access_time, 'Check-in', '2:00 PM'),
            _infoRow(Icons.access_time_filled, 'Check-out', '12:00 PM'),
            _infoRow(Icons.pets, 'Pets allowed', 'Yes (extra fee)'),
            _infoRow(Icons.smoking_rooms, 'Smoking', 'Non-smoking floors'),
          ],
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryBlue),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildStickyBookingBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
        ]),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$${_rooms[_selectedRoomIndex]['price']} / night',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.brightBlue)),
                  const Text('Taxes included', style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.brightBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child:
                      const Text('Reserve Now', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
