import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/bookings/widgets/confirmation_row.dart';

class ConfirmationSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> rows;
  final String? totalPrice;

  const ConfirmationSection({
    super.key,
    required this.title,
    required this.icon,
    required this.rows,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: AppTheme.greyText.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.primaryBlue, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppTheme.darkText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          ...rows,
          if (totalPrice != null) ...[
            const SizedBox(height: 8),
            ConfirmationRow(
              label: 'Total',
              value: totalPrice!,
              isTotal: true,
            ),
          ],
        ],
      ),
    );
  }
}
