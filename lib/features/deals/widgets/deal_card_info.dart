import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';

class DealCardInfo extends StatelessWidget {
  final DealItem item;

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
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, color: AppTheme.greyText),
                ),
                if (item.rating != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 14),
                      const SizedBox(width: 3),
                      Text(
                        '${item.rating} (${item.reviews} reviews)',
                        style: const TextStyle(
                            fontSize: 11, color: AppTheme.greyText),
                      ),
                    ],
                  ),
                ],
                if (item.duration != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    '${item.duration} • ${item.capacity}',
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
                item.price,
                overflow: TextOverflow.ellipsis,
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
