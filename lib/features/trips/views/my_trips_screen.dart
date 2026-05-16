import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trip_planner/views/trip_planner_screen.dart';
import 'package:voyga/features/trips/widgets/active_trip_card.dart';
import 'package:voyga/features/trips/widgets/past_trip_card.dart';
import 'package:voyga/features/trips/data/trip_data.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ActiveTripCard(
                    onViewDetails: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TripPlannerScreen(),
                        ),
                      );
                    },
                    onManage: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TripPlannerScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Past Explorations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkText,
                        ),
                      ),
                      const Text(
                        'HISTORY',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.greyText,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ...pastTrips.map(
                  (trip) => Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 12,
                    ),
                    child: PastTripCard(trip: trip),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
