import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           const Text('Voyage',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue)
          ),
          const Spacer(),
          const Icon(Icons.notifications, color: AppTheme.primaryBlue, size: 24),
          const SizedBox(width: 20,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const CircleAvatar(
              backgroundColor: AppTheme.greyBg,
              child: Icon(Icons.person, color: AppTheme.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }
}
