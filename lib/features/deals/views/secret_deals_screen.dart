import 'package:flutter/material.dart';
import 'package:voyga/features/deals/widgets/deals_header.dart';
import 'package:voyga/features/deals/widgets/deals_filter_tabs.dart';
import 'package:voyga/features/deals/widgets/deals_item_list.dart';
import 'package:voyga/features/deals/data/deal_data.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/features/bookings/views/booking_screen.dart';
import 'package:voyga/core/constants/app_theme.dart';

class SecretDealsScreen extends StatefulWidget {
  const SecretDealsScreen({super.key});

  @override
  State<SecretDealsScreen> createState() => _SecretDealsScreenState();
}

class _SecretDealsScreenState extends State<SecretDealsScreen> {
  String _selectedFilter = 'all';

  List<DealItem> get _filteredItems {
    if (_selectedFilter == 'all') return dealItems;
    final typeMap = {'flights': 'flight', 'hotels': 'hotel', 'tours': 'tour'};
    return dealItems
        .where((i) => i.type == typeMap[_selectedFilter])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
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
    );
  }
}
