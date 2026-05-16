import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voyga/features/bookings/widgets/payment_input_decoration.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(text[i]);
    }
    final formatted = buffer.toString();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CardNumberField extends StatelessWidget {
  final TextEditingController controller;

  const CardNumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberFormatter(),
      ],
      validator: (v) {
        final raw = v?.replaceAll(' ', '') ?? '';
        return raw.length < 16 ? 'Enter a valid card number' : null;
      },
      decoration: inputDecoration('Card Number', Icons.credit_card_outlined),
    );
  }
}
