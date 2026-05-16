import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voyga/features/bookings/widgets/payment_input_decoration.dart';

class ExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }
    final formatted = buffer.toString();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CardExpiryAndCvvRow extends StatelessWidget {
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  const CardExpiryAndCvvRow({
    super.key,
    required this.expiryController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: expiryController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryFormatter(),
            ],
            validator: (v) => v == null || v.length < 5 ? 'Enter MM/YY' : null,
            decoration: inputDecoration('MM/YY', Icons.calendar_today_outlined),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: cvvController,
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            validator: (v) => v == null || v.length < 3 ? 'Enter CVV' : null,
            decoration: inputDecoration('CVV', Icons.lock_outline),
          ),
        ),
      ],
    );
  }
}
