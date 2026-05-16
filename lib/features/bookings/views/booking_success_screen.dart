import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/bookings/widgets/success_animation.dart';
import 'package:voyga/features/bookings/widgets/success_title.dart';
import 'package:voyga/features/bookings/widgets/success_subtitle.dart';
import 'package:voyga/features/bookings/widgets/booking_ref_card.dart';
import 'package:voyga/features/bookings/widgets/success_actions.dart';

class BookingSuccessScreen extends StatelessWidget {
  final DealItem item;

  const BookingSuccessScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:
            const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SuccessAnimation(),
                const SizedBox(height: 32),
                const SuccessTitle(),
                const SizedBox(height: 12),
                SuccessSubtitle(item: item),
                const SizedBox(height: 40),
                const BookingRefCard(),
                const SizedBox(height: 40),
                SuccessActions(item: item),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
