import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/booking_text_field.dart';
import 'package:voyga/features/bookings/widgets/seat_class_selector.dart';

class TravelerPassportField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerPassportField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingTextField(
          controller: controller,
          label: 'Passport Number',
          icon: Icons.badge_outlined,
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        const SeatClassSelector(),
      ],
    );
  }
}
