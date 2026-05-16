import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/profile/widgets/menu_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  static const _items = [
    MenuItem(Icons.favorite_outline, 'Wishlist'),
    MenuItem(Icons.card_giftcard_outlined, 'Rewards'),
    MenuItem(Icons.headset_mic_outlined, 'Support'),
    MenuItem(Icons.logout, 'Sign Out'),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final isLast = i == _items.length - 1;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        Icon(item.icon,
                            color: isLast ? Colors.redAccent : AppTheme.darkText,
                            size: 22),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: isLast
                                  ? Colors.redAccent
                                  : AppTheme.darkText,
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right,
                            color: isLast
                                ? Colors.redAccent.withValues(alpha: 0.5)
                                : AppTheme.greyText,
                            size: 20),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey.withValues(alpha: 0.15),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
