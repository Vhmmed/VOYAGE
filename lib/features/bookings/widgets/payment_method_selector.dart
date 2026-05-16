import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

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
