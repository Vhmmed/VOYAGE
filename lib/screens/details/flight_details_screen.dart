import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

class FlightDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> flight;

  const FlightDetailsScreen({super.key, required this.flight});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  bool _fareRulesExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAppBar(),
                    const SizedBox(height: 8),
                    _buildFlightSummary(),
                    const SizedBox(height: 24),
                    _buildTimeline(),
                    const SizedBox(height: 24),
                    _buildBaggageInfo(),
                    const SizedBox(height: 24),
                    _buildSeatInfo(),
                    const SizedBox(height: 24),
                    _buildFareRules(),
                    const SizedBox(height: 24),
                    _buildPriceBreakdown(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              _buildStickyCTA(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.primaryBlue),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Text(
            widget.flight['title'] ?? 'Flight Details',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.flight['airline'] ?? 'EgyptAir',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.airplanemode_active, color: AppTheme.brightBlue),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(widget.flight['departureTime'] ?? '10:30 AM',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                Text(widget.flight['from'] ?? 'CAI',
                    style: const TextStyle(color: AppTheme.greyText)),
              ]),
              const Icon(Icons.flight_takeoff, color: AppTheme.brightBlue),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(widget.flight['arrivalTime'] ?? '2:15 PM',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                Text(widget.flight['to'] ?? 'DXB',
                    style: const TextStyle(color: AppTheme.greyText)),
              ]),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                color: AppTheme.greyBg,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '${widget.flight['duration'] ?? '3h 45m'} • ${widget.flight['stops'] ?? 'Non-stop'}'),
                Text(widget.flight['flightNumber'] ?? 'MS777',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Journey Timeline',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _timelineItem(Icons.flight_takeoff, 'Departure',
              '10:30 AM, Cairo International Airport', 'Terminal 2'),
          _timelineLine(),
          _timelineItem(Icons.hourglass_empty, 'Layover', '1h 20m in Dubai',
              'Optional lounge access'),
          _timelineLine(),
          _timelineItem(Icons.flight_land, 'Arrival',
              '2:15 PM, Dubai International Airport', 'Terminal 3'),
        ],
      ),
    );
  }

  Widget _timelineItem(
      IconData icon, String title, String time, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.brightBlue, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time, style: const TextStyle(color: AppTheme.darkText)),
              Text(subtitle,
                  style: const TextStyle(color: AppTheme.greyText, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _timelineLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(height: 20, width: 2, color: AppTheme.greyText),
    );
  }

  Widget _buildBaggageInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Baggage Allowance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _infoRow(Icons.work_outline, 'Cabin Bag', '7 kg'),
          _infoRow(Icons.luggage, 'Checked Bag', '23 kg'),
          const SizedBox(height: 8),
          const Text('Extra baggage fees: 15 USD/kg',
              style: TextStyle(color: AppTheme.greyText, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSeatInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Seat Selection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _infoRow(Icons.event_seat, 'Standard seat', 'Included'),
          _infoRow(
              Icons.airline_seat_recline_extra, 'Extra legroom', '+ 20 USD'),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppTheme.brightBlue)),
            child: const Text('View Seat Map'),
          ),
        ],
      ),
    );
  }

  Widget _buildFareRules() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                setState(() => _fareRulesExpanded = !_fareRulesExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Fare Rules',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(
                    _fareRulesExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          if (_fareRulesExpanded) ...[
            const SizedBox(height: 12),
            _infoRow(Icons.currency_exchange, 'Refund policy',
                'Non-refundable'), // ✅ استبدال refund
            _infoRow(Icons.cancel, 'Cancellation', 'Free within 24h'),
            _infoRow(Icons.date_range, 'Date change', '50 USD fee'),
            _infoRow(Icons.restaurant, 'Meal included', 'Yes (snack)'),
          ],
        ],
      ),
    );
  }

  Widget _buildPriceBreakdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _infoRow(Icons.monetization_on, 'Ticket', '\$220'),
          _infoRow(Icons.receipt, 'Taxes', '\$40'),
          _infoRow(Icons.settings, 'Service fee', '\$10'),
          const Divider(),
          _infoRow(Icons.receipt_long, 'Total', '\$270', isBold: true),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryBlue),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyCTA() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
        ]),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.brightBlue,
                padding: const EdgeInsets.symmetric(vertical: 14)),
            child:
                const Text('Continue Booking', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
