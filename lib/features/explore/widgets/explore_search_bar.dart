import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class ExploreSearchBar extends StatelessWidget {
  const ExploreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppTheme.greyText, size: 22),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Where to next?',
                hintStyle: TextStyle(color: AppTheme.greyText, fontSize: 15),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.greyBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune,
              color: AppTheme.darkText,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
