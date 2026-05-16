import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/booking_text_field.dart';

class TravelerEmailField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BookingTextField(
      controller: controller,
      label: 'Email Address',
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (v) =>
          v == null || v.isEmpty || !v.contains('@') ? 'Enter a valid email' : null,
    );
  }
}
