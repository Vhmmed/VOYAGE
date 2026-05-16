import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trip_planner/data/trip_planner_data.dart';

class ItineraryNotesCard extends StatefulWidget {
  const ItineraryNotesCard({super.key});

  @override
  State<ItineraryNotesCard> createState() => _ItineraryNotesCardState();
}

class _ItineraryNotesCardState extends State<ItineraryNotesCard> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Itinerary Notes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.edit_note,
                  color: AppTheme.primaryBlue,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...List.generate(itineraryItems.length, (index) {
            final item = itineraryItems[index];
            final bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = _selectedIndex == index ? null : index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryBlue
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color:
                            AppTheme.primaryBlue.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        item.number,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkText,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${item.price} • ${item.time}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
