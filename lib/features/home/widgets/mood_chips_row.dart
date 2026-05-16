import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class MoodChipsRow extends StatelessWidget {
  const MoodChipsRow({super.key});

  static const _moods = [
    (Icons.explore, 'ADVENTUROUS', Color(0xFFF97316)),
    (Icons.self_improvement, 'RELAXED', Color(0xFF14B8A6)),
    (Icons.restaurant, 'FOODIE', Color(0xFFEF4444)),
    (Icons.nature, 'NATURE', Color(0xFF22C55E)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How are you feeling?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: _moods.map((m) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(m.$1, color: m.$3, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        m.$2,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.darkText,
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
