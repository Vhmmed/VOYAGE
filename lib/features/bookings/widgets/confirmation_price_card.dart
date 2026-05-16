import 'package:flutter/material.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/features/bookings/widgets/confirmation_section.dart';
import 'package:voyga/features/bookings/widgets/confirmation_row.dart';
import 'package:voyga/features/bookings/widgets/confirmation_divider.dart';

class ConfirmationPriceCard extends StatelessWidget {
  final DealItem item;

  const ConfirmationPriceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ConfirmationSection(
      title: 'Price Breakdown',
      icon: Icons.receipt_long_outlined,
      rows: [
        ConfirmationRow(label: item.title, value: item.price),
        const ConfirmationRow(label: 'Taxes & Fees', value: 'Included'),
        const ConfirmationDivider(),
      ],
      totalPrice: item.price,
    );
  }
}
