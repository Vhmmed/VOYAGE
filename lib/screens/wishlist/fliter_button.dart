import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isPrimary;

  const FilterButton({super.key, required this.label, required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isPrimary
          ? ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.brightBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label),
      )
          : OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppTheme.darkText,
          side: BorderSide(color: AppTheme.greyText.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }
}

