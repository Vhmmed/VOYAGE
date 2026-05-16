import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// ─── Booking Success Screen ───────────────────────────────────────────────────

class BookingSuccessScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const BookingSuccessScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:
            const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SuccessAnimation(),
                const SizedBox(height: 32),
                const SuccessTitle(),
                const SizedBox(height: 12),
                SuccessSubtitle(item: item),
                const SizedBox(height: 40),
                const BookingRefCard(),
                const SizedBox(height: 40),
                SuccessActions(item: item),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Success Animation ────────────────────────────────────────────────────────

class SuccessAnimation extends StatefulWidget {
  const SuccessAnimation({super.key});

  @override
  State<SuccessAnimation> createState() => _SuccessAnimationState();
}

class _SuccessAnimationState extends State<SuccessAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green.shade300, width: 3),
        ),
        child: Icon(Icons.check_circle_rounded,
            color: Colors.green.shade500, size: 60),
      ),
    );
  }
}

// ─── Success Title ────────────────────────────────────────────────────────────

class SuccessTitle extends StatelessWidget {
  const SuccessTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Booking Confirmed! 🎉',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppTheme.darkText,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// ─── Success Subtitle ─────────────────────────────────────────────────────────

class SuccessSubtitle extends StatelessWidget {
  final Map<String, dynamic> item;

  const SuccessSubtitle({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your booking for ${item['title']} has been confirmed.\nA confirmation email has been sent.',
      style: const TextStyle(
        fontSize: 14,
        color: AppTheme.greyText,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// ─── Booking Ref Card ─────────────────────────────────────────────────────────

class BookingRefCard extends StatelessWidget {
  const BookingRefCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          const Text(
            'Booking Reference',
            style: TextStyle(fontSize: 12, color: AppTheme.greyText),
          ),
          const SizedBox(height: 8),
          Text(
            'VYG-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlue,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Success Actions ──────────────────────────────────────────────────────────

class SuccessActions extends StatelessWidget {
  final Map<String, dynamic> item;

  const SuccessActions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            icon: const Icon(Icons.home_outlined),
            label: const Text('Back to Home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download_outlined),
            label: const Text('Download Ticket'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryBlue,
              side: const BorderSide(color: AppTheme.primaryBlue),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
      ],
    );
  }
}
