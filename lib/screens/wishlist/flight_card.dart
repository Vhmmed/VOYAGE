import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../details/flight_details_screen.dart';

// ─── Flight Card Widget ───────────────────────────────────────────────────────

class FlightCard extends StatelessWidget {
  final Map<String, dynamic> flight;

  const FlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 8),
          _buildSubtitleRow(),
          const SizedBox(height: 16),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            flight['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
        ),
        const Icon(Icons.favorite, color: Colors.red, size: 24),
      ],
    );
  }

  Widget _buildSubtitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          flight['subtitle'],
          style: const TextStyle(fontSize: 14, color: AppTheme.greyText),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: flight['badgeColor'],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            flight['badge'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          flight['price'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlue,
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FlightDetailsScreen(flight: flight),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.brightBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(flight['buttonText']),
        ),
      ],
    );
  }
}
