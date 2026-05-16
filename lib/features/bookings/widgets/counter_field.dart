import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class CounterField extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const CounterField({
    super.key,
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.greyBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.greyText),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.remove,
                      size: 16, color: AppTheme.darkText),
                ),
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
