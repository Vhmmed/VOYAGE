import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/confirmation_section.dart';
import 'package:voyga/features/bookings/widgets/confirmation_row.dart';

class ConfirmationTravelerCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  const ConfirmationTravelerCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmationSection(
      title: 'Traveler',
      icon: Icons.person_outline,
      rows: [
        ConfirmationRow(label: 'Name', value: '$firstName $lastName'),
        ConfirmationRow(label: 'Email', value: email),
      ],
    );
  }
}
