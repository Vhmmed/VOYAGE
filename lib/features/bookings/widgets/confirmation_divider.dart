import 'package:flutter/material.dart';

class ConfirmationDivider extends StatelessWidget {
  const ConfirmationDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Divider(height: 1),
    );
  }
}
