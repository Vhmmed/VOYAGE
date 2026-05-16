import 'package:flutter/material.dart';
import 'package:voyga/features/bookings/widgets/traveler_info_title.dart';
import 'package:voyga/features/bookings/widgets/traveler_name_row.dart';
import 'package:voyga/features/bookings/widgets/traveler_email_field.dart';
import 'package:voyga/features/bookings/widgets/traveler_phone_field.dart';
import 'package:voyga/features/bookings/widgets/traveler_passport_field.dart';
import 'package:voyga/features/bookings/widgets/hotel_extras_section.dart';
import 'package:voyga/features/bookings/widgets/activity_extras_section.dart';

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
