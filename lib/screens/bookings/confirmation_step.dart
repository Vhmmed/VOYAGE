import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// ─── Step 3 : Confirmation ────────────────────────────────────────────────────

class ConfirmationStep extends StatelessWidget {
  final Map<String, dynamic> item;
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

// ─── Confirmation Title ───────────────────────────────────────────────────────

class ConfirmationTitle extends StatelessWidget {
  const ConfirmationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review & Confirm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Double-check your booking before confirming',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}

// ─── Confirmation Traveler Card ───────────────────────────────────────────────

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

// ─── Confirmation Price Card ──────────────────────────────────────────────────

class ConfirmationPriceCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ConfirmationPriceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ConfirmationSection(
      title: 'Price Breakdown',
      icon: Icons.receipt_long_outlined,
      rows: [
        ConfirmationRow(label: item['title'], value: item['price']),
        const ConfirmationRow(label: 'Taxes & Fees', value: 'Included'),
        const ConfirmationDivider(),
        const ConfirmationRow(
          label: 'Total',
          value: '',
          isTotal: true,
        ),
      ],
      totalPrice: item['price'],
    );
  }
}

// ─── Confirmation Policy Note ─────────────────────────────────────────────────

class ConfirmationPolicyNote extends StatelessWidget {
  const ConfirmationPolicyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.amber.withOpacity(0.4)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'By confirming, you agree to our Terms & Conditions and Cancellation Policy.',
              style: TextStyle(fontSize: 12, color: AppTheme.greyText),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Confirmation Section ─────────────────────────────────────────────────────

class ConfirmationSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> rows;
  final String? totalPrice;

  const ConfirmationSection({
    super.key,
    required this.title,
    required this.icon,
    required this.rows,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: AppTheme.greyText.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.primaryBlue, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppTheme.darkText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          ...rows,
        ],
      ),
    );
  }
}

// ─── Confirmation Row ─────────────────────────────────────────────────────────

class ConfirmationRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const ConfirmationRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? AppTheme.darkText : AppTheme.greyText,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? AppTheme.primaryBlue : AppTheme.darkText,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 13,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Confirmation Divider ─────────────────────────────────────────────────────

class ConfirmationDivider extends StatelessWidget {
  const ConfirmationDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Divider(height: 1),
    );
  }
}
