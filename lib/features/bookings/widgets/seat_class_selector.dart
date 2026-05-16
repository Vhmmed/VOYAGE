import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';

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
