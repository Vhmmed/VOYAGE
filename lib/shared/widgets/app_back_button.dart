import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onBack;

  const AppBackButton({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ?? () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppTheme.cardShadow,
        ),
        child: const Icon(Icons.arrow_back_ios_new,
            size: 18, color: AppTheme.darkText),
      ),
    );
  }
}
