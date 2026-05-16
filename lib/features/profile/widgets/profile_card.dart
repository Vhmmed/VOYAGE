import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/models/user_model.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;
  const ProfileCard({super.key, required this.user});

  Color _tierColor(String tier) {
    switch (tier) {
      case 'PLATINUM':
        return const Color(0xFFE5E4E2);
      case 'GOLD':
        return const Color(0xFFFFD700);
      case 'SILVER':
        return const Color(0xFFC0C0C0);
      case 'BRONZE':
        return const Color(0xFFCD7F32);
      default:
        return AppTheme.primaryBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tierColor = _tierColor(user.tier);
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: AppTheme.primaryBlue.withValues(alpha: 0.15),
                child: Text(
                  _initials(user.name),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.greyText,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: tierColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: tierColor.withValues(alpha: 0.5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.workspace_premium, size: 16, color: tierColor),
                    const SizedBox(width: 6),
                    Text(
                      user.tier,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: tierColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}
