import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:voyga/core/constants/constants.dart';

class AppTheme {
  static const Color primaryBlue = AppColors.primaryBlue;
  static const Color brightBlue = AppColors.brightBlue;
  static const Color lightBlue = AppColors.lightBlue;
  static const Color greyBg = AppColors.greyBg;
  static const Color greyText = AppColors.greyText;
  static const Color white = AppColors.white;
  static const Color darkText = AppColors.darkText;
  static const Color purpleAccent = AppColors.purpleAccent;
  static const Color overlayDark = AppColors.overlayDark;

  static const LinearGradient backgroundGradient = AppGradients.background;

  static List<BoxShadow> get cardShadow => AppGradients.cardShadow;
  static List<BoxShadow> get buttonShadow =>
      AppGradients.buttonShadow(primaryBlue);

  static BoxDecoration glassCard({double radius = 24}) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: 0.75),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      boxShadow: cardShadow,
    );
  }

  static Widget glassEffect({required Widget child, double radius = 24}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: child,
      ),
    );
  }
}
