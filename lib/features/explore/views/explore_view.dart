import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/explore/widgets/explore_header.dart';
import 'package:voyga/features/explore/widgets/explore_search_bar.dart';
import 'package:voyga/features/explore/widgets/global_spotlight_section.dart';
import 'package:voyga/features/explore/widgets/top_destinations_section.dart';
import 'package:voyga/features/explore/widgets/plan_trip_fab.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ExploreHeader(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ExploreSearchBar(),
                    ),
                    SizedBox(height: 24),
                    GlobalSpotlightSection(),
                    SizedBox(height: 24),
                    TopDestinationsSection(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 65,
                child: const PlanTripFAB(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
