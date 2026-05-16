import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/profile/widgets/bookings_button.dart';
import 'package:voyga/features/profile/widgets/menu_list.dart';
import 'package:voyga/features/profile/widgets/profile_card.dart';
import 'package:voyga/features/profile/widgets/wallet_card.dart';
import 'package:voyga/shared/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _user = UserModel(
    name: 'Ahmed Mohamed',
    email: 'ahmed@voyage.com',
    tier: 'GOLD',
    walletBalance: 1250.00,
    bookingsCount: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const ProfileCard(user: _user),
              const SizedBox(height: 20),
              WalletCard(balance: _user.walletBalance),
              const SizedBox(height: 20),
              BookingsButton(count: _user.bookingsCount),
              const SizedBox(height: 20),
              const MenuList(),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
}
