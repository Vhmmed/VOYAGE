import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primaryBlue = Color(0xFF4F6EF7);
  static const Color brightBlue = Color(0xFF3B82F6);
  static const Color lightBlue = Color(0xFF60A5FA);
  static const Color greyBg = Color(0xFFF3F4F6);
  static const Color greyText = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF111827);
  static const Color purpleAccent = Color(0xFF8B5CF6);
  static const Color overlayDark = Color(0xCC000000);
  static const Color gold = Color(0xFFFFD700);
  static const Color platinum = Color(0xFFE5E4E2);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color bronze = Color(0xFFCD7F32);
}

class AppStrings {
  AppStrings._();
  static const String appName = 'Voyage';
  static const String exploreTitle = 'Explore Destinations';
  static const String exploreSubtitle = 'Discover your next adventure';
  static const String bookNow = 'Book Now';
  static const String seeAll = 'See all';
  static const String walletBalance = 'Wallet Balance';
  static const String bookingsHistory = 'Bookings History';
  static const String signOut = 'Sign Out';
}

class AppAssets {
  AppAssets._();
}

class AppGradients {
  AppGradients._();
  static const LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5F3FF), Color(0xFFF3F4F6), Color(0xFFFFFFFF)],
  );

  static const cardShadow = <BoxShadow>[
    BoxShadow(
      color: Color(0x14FFFFFF),
      blurRadius: 30,
      offset: Offset(0, 10),
    ),
  ];

  static List<BoxShadow> buttonShadow(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.4),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ];
}
