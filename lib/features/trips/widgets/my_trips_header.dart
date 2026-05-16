import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/app_back_button.dart';

class MyTripsHeader extends StatelessWidget {
  const MyTripsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppBackButton(),
        const Text(
          'My Trips',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 24),
              color: AppTheme.darkText,
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.primaryBlue,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ],
        ),
      ],
    );
  }
}
