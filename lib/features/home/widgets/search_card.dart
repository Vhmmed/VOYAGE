import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/explore/views/explore_view.dart';
import 'package:voyga/features/home/widgets/info_field.dart';
import 'package:voyga/features/home/widgets/primary_button.dart';
import 'package:voyga/features/home/widgets/search_field.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where to?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.darkText,
              ),
            ),
            SizedBox(height: 8),
            SearchField(
              icon: Icons.search,
              hint: 'Search destinations...',
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: InfoField(icon: Icons.calendar_today, label: 'Select dates')),
                SizedBox(width: 10),
                Expanded(child: InfoField(icon: Icons.person_outline, label: 'Travelers')),
              ],
            ),
            SizedBox(height: 16),
            PrimaryButton(
              label: 'Search Journeys',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExploreView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
