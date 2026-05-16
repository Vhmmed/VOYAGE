import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// ─── Step 1 : Traveler Info ───────────────────────────────────────────────────

class TravelerInfoStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passportController;
  final String itemType;

  const TravelerInfoStep({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passportController,
    required this.itemType,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TravelerInfoTitle(),
          const SizedBox(height: 20),
          TravelerNameRow(
            firstNameController: firstNameController,
            lastNameController: lastNameController,
          ),
          const SizedBox(height: 16),
          TravelerEmailField(controller: emailController),
          const SizedBox(height: 16),
          TravelerPhoneField(controller: phoneController),
          const SizedBox(height: 16),
          if (itemType == 'flight')
            TravelerPassportField(controller: passportController),
          if (itemType == 'hotel') const HotelExtrasSection(),
          if (itemType == 'activity') const ActivityExtrasSection(),
        ],
      ),
    );
  }
}

// ─── Traveler Info Title ──────────────────────────────────────────────────────

class TravelerInfoTitle extends StatelessWidget {
  const TravelerInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traveler Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Please fill in the details below',
          style: TextStyle(fontSize: 13, color: AppTheme.greyText),
        ),
      ],
    );
  }
}

// ─── Traveler Name Row ────────────────────────────────────────────────────────

class TravelerNameRow extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const TravelerNameRow({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BookingTextField(
            controller: firstNameController,
            label: 'First Name',
            icon: Icons.person_outline,
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BookingTextField(
            controller: lastNameController,
            label: 'Last Name',
            icon: Icons.person_outline,
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
        ),
      ],
    );
  }
}

// ─── Traveler Email Field ─────────────────────────────────────────────────────

class TravelerEmailField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BookingTextField(
      controller: controller,
      label: 'Email Address',
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (v) =>
          v!.isEmpty || !v.contains('@') ? 'Enter a valid email' : null,
    );
  }
}

// ─── Traveler Phone Field ─────────────────────────────────────────────────────

class TravelerPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BookingTextField(
      controller: controller,
      label: 'Phone Number',
      icon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      validator: (v) => v!.isEmpty ? 'Required' : null,
    );
  }
}

// ─── Traveler Passport Field (flight only) ────────────────────────────────────

class TravelerPassportField extends StatelessWidget {
  final TextEditingController controller;

  const TravelerPassportField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingTextField(
          controller: controller,
          label: 'Passport Number',
          icon: Icons.badge_outlined,
          validator: (v) => v!.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        const SeatClassSelector(),
      ],
    );
  }
}

// ─── Seat Class Selector (flight) ─────────────────────────────────────────────

class SeatClassSelector extends StatefulWidget {
  const SeatClassSelector({super.key});

  @override
  State<SeatClassSelector> createState() => _SeatClassSelectorState();
}

class _SeatClassSelectorState extends State<SeatClassSelector> {
  int _selected = 0;
  final List<String> _classes = ['Economy', 'Business', 'First'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seat Class',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            _classes.length,
            (i) => Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: i < 2 ? 8 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _selected == i
                        ? AppTheme.primaryBlue
                        : AppTheme.greyBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      _classes[i],
                      style: TextStyle(
                        color: _selected == i ? Colors.white : AppTheme.greyText,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Hotel Extras Section ─────────────────────────────────────────────────────

class HotelExtrasSection extends StatefulWidget {
  const HotelExtrasSection({super.key});

  @override
  State<HotelExtrasSection> createState() => _HotelExtrasSectionState();
}

class _HotelExtrasSectionState extends State<HotelExtrasSection> {
  int _nights = 1;
  int _guests = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stay Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CounterField(
                label: 'Nights',
                value: _nights,
                onDecrement: () {
                  if (_nights > 1) setState(() => _nights--);
                },
                onIncrement: () => setState(() => _nights++),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CounterField(
                label: 'Guests',
                value: _guests,
                onDecrement: () {
                  if (_guests > 1) setState(() => _guests--);
                },
                onIncrement: () => setState(() => _guests++),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Activity Extras Section ──────────────────────────────────────────────────

class ActivityExtrasSection extends StatefulWidget {
  const ActivityExtrasSection({super.key});

  @override
  State<ActivityExtrasSection> createState() => _ActivityExtrasSectionState();
}

class _ActivityExtrasSectionState extends State<ActivityExtrasSection> {
  int _persons = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activity Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        CounterField(
          label: 'Number of Persons',
          value: _persons,
          onDecrement: () {
            if (_persons > 1) setState(() => _persons--);
          },
          onIncrement: () => setState(() => _persons++),
        ),
      ],
    );
  }
}

// ─── Counter Field ────────────────────────────────────────────────────────────

class CounterField extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const CounterField({
    super.key,
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.greyBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.greyText),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.remove,
                      size: 16, color: AppTheme.darkText),
                ),
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Booking Text Field ───────────────────────────────────────────────────────

class BookingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const BookingTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
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
          borderSide:
              const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
