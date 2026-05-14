import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.brightBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 6,
          shadowColor: AppTheme.brightBlue.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppTheme.primaryBlue,
          side: BorderSide(color: AppTheme.greyText.withOpacity(0.5)),
          minimumSize: const Size(double.infinity, 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 20, color: AppTheme.primaryBlue),
            if (icon != null) const SizedBox(width: 8),
            Text(text,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }
  }
}
