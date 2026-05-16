import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';

class DealCardImage extends StatelessWidget {
  final DealItem item;

  const DealCardImage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Stack(
        children: [
          Image.network(
            item.image,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 160,
                color: AppTheme.greyBg,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (_, __, ___) => Container(
              height: 160,
              color: AppTheme.greyBg,
              child: const Icon(Icons.image_not_supported,
                  color: AppTheme.greyText),
            ),
          ),
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
                item.discount,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _typeIcon(item.type),
                    color: Colors.white,
                    size: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _typeLabel(item.type),
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
