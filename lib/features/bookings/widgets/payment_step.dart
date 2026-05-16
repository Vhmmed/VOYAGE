import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/payment_step_title.dart';
import 'package:voyga/features/bookings/widgets/payment_method_selector.dart';
import 'package:voyga/features/bookings/widgets/payment_card_title.dart';
import 'package:voyga/features/bookings/widgets/card_preview.dart';
import 'package:voyga/features/bookings/widgets/card_number_field.dart';
import 'package:voyga/features/bookings/widgets/card_holder_field.dart';
import 'package:voyga/features/bookings/widgets/card_expiry_and_cvv_row.dart';

class PaymentStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  const PaymentStep({
    super.key,
    required this.formKey,
    required this.cardNumberController,
    required this.cardHolderController,
    required this.expiryController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaymentStepTitle(),
          const SizedBox(height: 20),
          const PaymentMethodSelector(),
          const SizedBox(height: 24),
          const PaymentCardTitle(),
          const SizedBox(height: 16),
          CardPreview(
            cardNumberController: cardNumberController,
            cardHolderController: cardHolderController,
            expiryController: expiryController,
          ),
          const SizedBox(height: 24),
          CardNumberField(controller: cardNumberController),
          const SizedBox(height: 16),
          CardHolderField(controller: cardHolderController),
          const SizedBox(height: 16),
          CardExpiryAndCvvRow(
            expiryController: expiryController,
            cvvController: cvvController,
          ),
        ],
      ),
    );
  }
}
