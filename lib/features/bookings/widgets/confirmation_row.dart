import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class ConfirmationRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const ConfirmationRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
              color: isTotal ? AppTheme.darkText : AppTheme.greyText,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 13,
            ),
          ),
          ),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isTotal ? AppTheme.primaryBlue : AppTheme.darkText,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 13,
            ),
          ),
        ],
      ),
    );
  }
}
