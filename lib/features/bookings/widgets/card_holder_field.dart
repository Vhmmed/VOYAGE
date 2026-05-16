import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/payment_input_decoration.dart';

class CardHolderField extends StatelessWidget {
  final TextEditingController controller;

  const CardHolderField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
      decoration: inputDecoration('Card Holder Name', Icons.person_outline),
    );
  }
}
