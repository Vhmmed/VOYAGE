import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Voyage',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryBlue,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.notifications_outlined,
              color: AppTheme.darkText,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
