import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

class ConfirmationPolicyNote extends StatelessWidget {
  const ConfirmationPolicyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'By confirming, you agree to our Terms & Conditions and Cancellation Policy.',
              style: TextStyle(fontSize: 12, color: AppTheme.greyText),
            ),
          ),
        ],
      ),
    );
  }
}
