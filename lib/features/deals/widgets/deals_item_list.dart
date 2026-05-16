import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/deals/widgets/deal_card.dart';

class DealsItemList extends StatelessWidget {
  final List<DealItem> items;
  final ValueChanged<DealItem> onTap;

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
