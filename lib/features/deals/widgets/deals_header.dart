import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/app_back_button.dart';

class DealsHeader extends StatelessWidget {
  const DealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBackButton(),
        const Text(
          'Secret Deals',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Exclusive offers for our premium members.',
          style: TextStyle(fontSize: 14, color: AppTheme.greyText),
        ),
      ],
    );
  }
}
