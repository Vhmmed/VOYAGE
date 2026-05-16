import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

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
                color: AppTheme.primaryBlue.withValues(alpha: 0.4),
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
