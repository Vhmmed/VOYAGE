import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

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
