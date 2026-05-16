import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/booking_text_field.dart';

class TravelerPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BookingTextField(
      controller: controller,
      label: 'Phone Number',
      icon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
    );
  }
}
