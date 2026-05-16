import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/bookings/widgets/counter_field.dart';

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
