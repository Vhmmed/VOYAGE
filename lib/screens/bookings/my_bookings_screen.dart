import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import 'booking_screen.dart';

// ─── Secret Deals Screen ──────────────────────────────────────────────────────

class SecretDealsScreen extends StatefulWidget {
  const SecretDealsScreen({super.key});

  @override
  State<SecretDealsScreen> createState() => _SecretDealsScreenState();
}

class _SecretDealsScreenState extends State<SecretDealsScreen> {
  String _selectedFilter = 'all';

  // ── Sample data ──────────────────────────────────────────────────────────────
  final List<Map<String, dynamic>> _allItems = [
    {
      'type': 'flight',
      'title': 'Cairo → Dubai',
      'subtitle': 'EgyptAir • Non-stop • 3h 20m',
      'price': '\$189',
      'discount': '45% OFF',
      'image': 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=600',
    },
    {
      'type': 'hotel',
      'title': 'Burj Al Arab',
      'subtitle': 'Dubai, UAE',
      'price': '\$420/night',
      'discount': '30% OFF',
      'rating': '4.9',
      'reviews': '2.1k',
      'image': 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600',
    },
    {
      'type': 'tour',
      'title': 'Pyramids Full-Day Tour',
      'subtitle': 'Giza, Egypt',
      'price': '\$65',
      'discount': '20% OFF',
      'duration': '8 hours',
      'capacity': 'Max 12',
      'image': 'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?w=600',
    },
    {
      'type': 'flight',
      'title': 'Cairo → London',
      'subtitle': 'British Airways • 1 stop • 6h 45m',
      'price': '\$340',
      'discount': '25% OFF',
      'image': 'https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?w=600',
    },
    {
      'type': 'hotel',
      'title': 'Nile Ritz-Carlton',
      'subtitle': 'Cairo, Egypt',
      'price': '\$210/night',
      'discount': '15% OFF',
      'rating': '4.7',
      'reviews': '1.4k',
      'image': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600',
    },
    {
      'type': 'tour',
      'title': 'Luxor & Karnak Temples',
      'subtitle': 'Luxor, Egypt',
      'price': '\$90',
      'discount': '10% OFF',
      'duration': '12 hours',
      'capacity': 'Max 8',
      'image': 'https://images.unsplash.com/photo-1600532210894-b0afb20958a3?w=600',
    },
  ];

  List<Map<String, dynamic>> get _filteredItems {
    if (_selectedFilter == 'all') return _allItems;
    // 'tours' filter maps to type 'tour'
    final typeMap = {'flights': 'flight', 'hotels': 'hotel', 'tours': 'tour'};
    return _allItems
        .where((i) => i['type'] == typeMap[_selectedFilter])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DealsAppBar(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DealsHeader(),
                    const SizedBox(height: 20),
                    DealsFilterTabs(
                      selected: _selectedFilter,
                      onSelect: (f) => setState(() => _selectedFilter = f),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: DealsItemList(
                  items: _filteredItems,
                  onTap: (item) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(item: item),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── App Bar ──────────────────────────────────────────────────────────────────

class DealsAppBar extends StatelessWidget {
  const DealsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: AppTheme.cardShadow,
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 18, color: AppTheme.darkText),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: const Icon(Icons.person_outline,
                size: 22, color: AppTheme.primaryBlue),
          ),
        ],
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class DealsHeader extends StatelessWidget {
  const DealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Secret Deals',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Exclusive offers for our premium members.',
          style: TextStyle(fontSize: 14, color: AppTheme.greyText),
        ),
      ],
    );
  }
}

// ─── Filter Tabs ──────────────────────────────────────────────────────────────

class DealsFilterTabs extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;

  const DealsFilterTabs({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  static const _filters = ['all', 'flights', 'hotels', 'tours'];
  static const _labels = ['All', 'Flights', 'Hotels', 'Tours'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_filters.length, (i) {
          final bool isActive = selected == _filters[i];
          return GestureDetector(
            onTap: () => onSelect(_filters[i]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color:
                isActive ? AppTheme.primaryBlue : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: isActive ? [] : AppTheme.cardShadow,
              ),
              child: Text(
                _labels[i],
                style: TextStyle(
                  color: isActive ? Colors.white : AppTheme.greyText,
                  fontWeight:
                  isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Items List ───────────────────────────────────────────────────────────────

class DealsItemList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final ValueChanged<Map<String, dynamic>> onTap;

  const DealsItemList({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No deals available',
          style: TextStyle(color: AppTheme.greyText),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: items.length,
      itemBuilder: (context, index) => DealCard(
        item: items[index],
        onTap: () => onTap(items[index]),
      ),
    );
  }
}

// ─── Deal Card ────────────────────────────────────────────────────────────────

class DealCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const DealCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DealCardImage(item: item),
            DealCardInfo(item: item),
          ],
        ),
      ),
    );
  }
}

// ─── Deal Card Image ──────────────────────────────────────────────────────────

class DealCardImage extends StatelessWidget {
  final Map<String, dynamic> item;

  const DealCardImage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Stack(
        children: [
          Image.network(
            item['image'],
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 160,
              color: AppTheme.greyBg,
              child: const Icon(Icons.image_not_supported,
                  color: AppTheme.greyText),
            ),
          ),
          // Discount badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item['discount'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          // Type badge
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _typeIcon(item['type']),
                    color: Colors.white,
                    size: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _typeLabel(item['type']),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _typeIcon(String type) {
    switch (type) {
      case 'flight':
        return Icons.flight;
      case 'hotel':
        return Icons.hotel;
      default:
        return Icons.local_activity;
    }
  }

  String _typeLabel(String type) {
    switch (type) {
      case 'flight':
        return 'Flight';
      case 'hotel':
        return 'Hotel';
      default:
        return 'Tour';
    }
  }
}

// ─── Deal Card Info ───────────────────────────────────────────────────────────

class DealCardInfo extends StatelessWidget {
  final Map<String, dynamic> item;

  const DealCardInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['subtitle'],
                  style: const TextStyle(
                      fontSize: 12, color: AppTheme.greyText),
                ),
                if (item.containsKey('rating')) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 14),
                      const SizedBox(width: 3),
                      Text(
                        '${item['rating']} (${item['reviews']} reviews)',
                        style: const TextStyle(
                            fontSize: 11, color: AppTheme.greyText),
                      ),
                    ],
                  ),
                ],
                if (item.containsKey('duration')) ...[
                  const SizedBox(height: 6),
                  Text(
                    '${item['duration']} • ${item['capacity']}',
                    style: const TextStyle(
                        fontSize: 11, color: AppTheme.greyText),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item['price'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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