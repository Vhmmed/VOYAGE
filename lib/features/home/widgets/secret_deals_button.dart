import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/deals/views/secret_deals_screen.dart';

class SecretDealsButton extends StatelessWidget {
  const SecretDealsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SecretDealsScreen(),
              ),
            );
          },
          icon: const Icon(Icons.star, color: Colors.white, size: 20),
          label: const Text(
            'REVEAL SECRET DEALS',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryBlue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
