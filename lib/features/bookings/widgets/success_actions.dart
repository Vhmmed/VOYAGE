import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/shared/views/root_shell.dart';
import 'package:voyga/core/constants/app_theme.dart';

class SuccessActions extends StatelessWidget {
  final DealItem item;

  const SuccessActions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const RootShell()),
              (route) => false,
            ),
            icon: const Icon(Icons.home_outlined),
            label: const Text('Back to Home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ticket download coming soon')),
              );
            },
            icon: const Icon(Icons.download_outlined),
            label: const Text('Download Ticket'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryBlue,
              side: const BorderSide(color: AppTheme.primaryBlue),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
      ],
    );
  }
}
