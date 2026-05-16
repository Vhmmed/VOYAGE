import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/bookings/widgets/counter_field.dart';

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
