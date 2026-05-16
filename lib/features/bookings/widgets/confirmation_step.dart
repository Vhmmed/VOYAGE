import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/features/bookings/widgets/confirmation_title.dart';
import 'package:voyga/features/bookings/widgets/confirmation_traveler_card.dart';
import 'package:voyga/features/bookings/widgets/confirmation_price_card.dart';
import 'package:voyga/features/bookings/widgets/confirmation_policy_note.dart';

class ConfirmationStep extends StatelessWidget {
  final DealItem item;
  final String firstName;
  final String lastName;
  final String email;

  const ConfirmationStep({
    super.key,
    required this.item,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ConfirmationTitle(),
        const SizedBox(height: 20),
        ConfirmationTravelerCard(
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),
        const SizedBox(height: 16),
        ConfirmationPriceCard(item: item),
        const SizedBox(height: 16),
        const ConfirmationPolicyNote(),
      ],
    );
  }
}
