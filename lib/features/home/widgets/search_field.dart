import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/core/constants/constants.dart';

class SearchField extends StatelessWidget {
  final IconData icon;
  final String hint;

  const SearchField({super.key, required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.greyBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.greyText, size: 20),
          const SizedBox(width: 10),
          Text(
            hint,
            style: const TextStyle(color: AppTheme.greyText),
          ),
        ],
      ),
    );
  }
}
