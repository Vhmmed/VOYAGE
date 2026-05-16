import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trip_planner/widgets/trip_planner_header.dart';
import 'package:voyga/features/trip_planner/widgets/map_card.dart';
import 'package:voyga/features/trip_planner/widgets/itinerary_notes_card.dart';
import 'package:voyga/features/trip_planner/widgets/lumina_assistant_card.dart';

class TripPlannerScreen extends StatelessWidget {
  const TripPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: const SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 40),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 65),
                TripPlannerHeader(),
                SizedBox(height: 24),
                MapCard(),
                SizedBox(height: 20),
                ItineraryNotesCard(),
                SizedBox(height: 20),
                LuminaAssistantCard(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
