import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/booking_app_bar.dart';
import 'package:voyga/features/bookings/widgets/booking_bottom_bar.dart';
import 'package:voyga/features/bookings/widgets/booking_summary_card.dart';
import 'package:voyga/features/bookings/widgets/traveler_info_step.dart';
import 'package:voyga/features/bookings/widgets/payment_step.dart';
import 'package:voyga/features/bookings/widgets/confirmation_step.dart';
import 'package:voyga/features/bookings/views/booking_success_screen.dart';
import 'package:voyga/shared/models/deal_item.dart';
import 'package:voyga/core/constants/app_theme.dart';

class BookingScreen extends StatefulWidget {
  final DealItem item;

  const BookingScreen({super.key, required this.item});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _currentStep = 0;

  final _infoFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passportController = TextEditingController();

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
      if (_infoFormKey.currentState?.validate() ?? false) {
        setState(() => _currentStep = 1);
      }
    } else if (_currentStep == 1) {
      if (_paymentFormKey.currentState?.validate() ?? false) {
        setState(() => _currentStep = 2);
      }
    } else {
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
        itemType: widget.item.type,
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
