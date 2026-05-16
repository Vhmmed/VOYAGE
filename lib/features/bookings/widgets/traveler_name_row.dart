import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/booking_text_field.dart';

class TravelerNameRow extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const TravelerNameRow({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BookingTextField(
            controller: firstNameController,
            label: 'First Name',
            icon: Icons.person_outline,
            validator: (v) => v == null || v.isEmpty ? 'Required' : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BookingTextField(
            controller: lastNameController,
            label: 'Last Name',
            icon: Icons.person_outline,
            validator: (v) => v == null || v.isEmpty ? 'Required' : null,
          ),
        ),
      ],
    );
  }
}
