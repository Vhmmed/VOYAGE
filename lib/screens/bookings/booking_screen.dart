import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import 'booking_step_indicator.dart';
import 'booking_summary_card.dart';
import 'traveler_info_step.dart';
import 'payment_step.dart';
import 'confirmation_step.dart';
import 'booking_success_screen.dart';

// ─── Booking Screen ───────────────────────────────────────────────────────────

class BookingScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const BookingScreen({super.key, required this.item});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _currentStep = 0;

  // Step 1 controllers
  final _infoFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passportController = TextEditingController();

  // Step 2 controllers
  final _paymentFormKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passportController.dispose();
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentStep == 0) {
      if (_infoFormKey.currentState!.validate()) {
        setState(() => _currentStep = 1);
      }
    } else if (_currentStep == 1) {
      if (_paymentFormKey.currentState!.validate()) {
        setState(() => _currentStep = 2);
      }
    } else {
      // Go to success screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BookingSuccessScreen(item: widget.item),
        ),
      );
    }
  }

  void _onBack() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:
            const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              BookingAppBar(
                currentStep: _currentStep,
                onBack: _onBack,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      BookingSummaryCard(item: widget.item),
                      const SizedBox(height: 24),
                      _buildCurrentStep(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              BookingBottomBar(
                currentStep: _currentStep,
                onNext: _onNext,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    if (_currentStep == 0) {
      return TravelerInfoStep(
        formKey: _infoFormKey,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        emailController: _emailController,
        phoneController: _phoneController,
        passportController: _passportController,
        itemType: widget.item['type'],
      );
    } else if (_currentStep == 1) {
      return PaymentStep(
        formKey: _paymentFormKey,
        cardNumberController: _cardNumberController,
        cardHolderController: _cardHolderController,
        expiryController: _expiryController,
        cvvController: _cvvController,
      );
    } else {
      return ConfirmationStep(
        item: widget.item,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
      );
    }
  }
}

// ─── Booking App Bar ──────────────────────────────────────────────────────────

class BookingAppBar extends StatelessWidget {
  final int currentStep;
  final VoidCallback onBack;

  const BookingAppBar({
    super.key,
    required this.currentStep,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new,
                      size: 18, color: AppTheme.darkText),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Complete Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 36),
            ],
          ),
          const SizedBox(height: 20),
          BookingStepIndicator(currentStep: currentStep),
        ],
      ),
    );
  }
}

// ─── Booking Bottom Bar ───────────────────────────────────────────────────────

class BookingBottomBar extends StatelessWidget {
  final int currentStep;
  final VoidCallback onNext;

  const BookingBottomBar({
    super.key,
    required this.currentStep,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      'Continue to Payment',
      'Review Booking',
      'Confirm & Pay',
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            labels[currentStep],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
