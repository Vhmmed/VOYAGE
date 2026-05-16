import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/deals/views/secret_deals_screen.dart';
import 'package:voyga/features/explore/widgets/destinations_flight_header.dart';
import 'package:voyga/features/explore/widgets/world_class_escape_card.dart';
import 'package:voyga/features/explore/widgets/featured_deal_card.dart';
import 'package:voyga/features/explore/widgets/flight_offer_row.dart';
import 'package:voyga/features/explore/data/explore_data.dart';

class DestinationsFlightScreen extends StatelessWidget {
  const DestinationsFlightScreen({super.key});

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DestinationsFlightHeader(),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'World-Class Escapes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SecretDealsScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: worldClassEscapes.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final city = worldClassEscapes[index];
                      return WorldClassEscapeCard(
                        name: city['name']!,
                        price: city['price']!,
                        imageUrl: city['image']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SecretDealsScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Exclusive Flight Offers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FeaturedDealCard(
                    onBookNow: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SecretDealsScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ...flightOffers.map(
                  (offer) => Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 12,
                    ),
                    child: FlightOfferRow(
                      route: offer['route']!,
                      stops: offer['stops']!,
                      duration: offer['duration']!,
                      price: offer['price']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SecretDealsScreen(),
                          ),
                        );
                      },
                    ),
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
