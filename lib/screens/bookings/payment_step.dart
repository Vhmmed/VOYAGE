import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../themes/app_theme.dart';

// ─── Step 2 : Payment ─────────────────────────────────────────────────────────

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

// ─── Payment Step Title ───────────────────────────────────────────────────────

class PaymentStepTitle extends StatelessWidget {
  const PaymentStepTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Your payment info is secured & encrypted',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}

// ─── Payment Method Selector ──────────────────────────────────────────────────

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  int _selected = 0;
  final List<Map<String, dynamic>> _methods = [
    {'label': 'Credit Card', 'icon': Icons.credit_card},
    {'label': 'PayPal', 'icon': Icons.account_balance_wallet_outlined},
    {'label': 'Apple Pay', 'icon': Icons.apple},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _methods.length,
        (i) => Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selected = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: i < 2 ? 10 : 0),
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color:
                    _selected == i ? AppTheme.primaryBlue : AppTheme.greyBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Icon(
                    _methods[i]['icon'],
                    color:
                        _selected == i ? Colors.white : AppTheme.greyText,
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _methods[i]['label'],
                    style: TextStyle(
                      fontSize: 11,
                      color: _selected == i ? Colors.white : AppTheme.greyText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Payment Card Title ───────────────────────────────────────────────────────

class PaymentCardTitle extends StatelessWidget {
  const PaymentCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Card Information',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppTheme.darkText,
      ),
    );
  }
}

// ─── Card Preview ─────────────────────────────────────────────────────────────

class CardPreview extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController expiryController;

  const CardPreview({
    super.key,
    required this.cardNumberController,
    required this.cardHolderController,
    required this.expiryController,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        cardNumberController,
        cardHolderController,
        expiryController,
      ]),
      builder: (context, _) {
        final rawNumber = cardNumberController.text.replaceAll(' ', '');
        final formatted = List.generate(4, (i) {
          final chunk = rawNumber.length > i * 4
              ? rawNumber.substring(
                  i * 4,
                  rawNumber.length > (i + 1) * 4
                      ? (i + 1) * 4
                      : rawNumber.length,
                )
              : '••••';
          return chunk.padRight(4, '•');
        }).join('  ');

        return Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primaryBlue, Color(0xFF0D47A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voyage',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.credit_card, color: Colors.white70, size: 28),
                ],
              ),
              Text(
                formatted,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CARD HOLDER',
                        style: TextStyle(color: Colors.white54, fontSize: 10),
                      ),
                      Text(
                        cardHolderController.text.isEmpty
                            ? 'YOUR NAME'
                            : cardHolderController.text.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EXPIRES',
                        style: TextStyle(color: Colors.white54, fontSize: 10),
                      ),
                      Text(
                        expiryController.text.isEmpty
                            ? 'MM/YY'
                            : expiryController.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Card Number Field ────────────────────────────────────────────────────────

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
        _CardNumberFormatter(),
      ],
      validator: (v) {
        final raw = v?.replaceAll(' ', '') ?? '';
        return raw.length < 16 ? 'Enter a valid card number' : null;
      },
      decoration: _inputDecoration('Card Number', Icons.credit_card_outlined),
    );
  }
}

// ─── Card Holder Field ────────────────────────────────────────────────────────

class CardHolderField extends StatelessWidget {
  final TextEditingController controller;

  const CardHolderField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      validator: (v) => v!.isEmpty ? 'Required' : null,
      decoration: _inputDecoration('Card Holder Name', Icons.person_outline),
    );
  }
}

// ─── Card Expiry & CVV Row ────────────────────────────────────────────────────

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
              _ExpiryFormatter(),
            ],
            validator: (v) => v!.length < 5 ? 'Enter MM/YY' : null,
            decoration: _inputDecoration('MM/YY', Icons.calendar_today_outlined),
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
            validator: (v) => v!.length < 3 ? 'Enter CVV' : null,
            decoration: _inputDecoration('CVV', Icons.lock_outline),
          ),
        ),
      ],
    );
  }
}

// ─── Shared Input Decoration ──────────────────────────────────────────────────

InputDecoration _inputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: AppTheme.primaryBlue, size: 20),
    filled: true,
    fillColor: AppTheme.greyBg,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );
}

// ─── Input Formatters ─────────────────────────────────────────────────────────

class _CardNumberFormatter extends TextInputFormatter {
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

class _ExpiryFormatter extends TextInputFormatter {
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
