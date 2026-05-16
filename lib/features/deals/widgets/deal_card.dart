import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/deals/widgets/deal_card_image.dart';
import 'package:voyga/features/deals/widgets/deal_card_info.dart';

class DealCard extends StatelessWidget {
  final DealItem item;
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
