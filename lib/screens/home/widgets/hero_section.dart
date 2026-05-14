import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool isRoundTrip = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // IMAGE + TEXT
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                left: 20,
                top: 30,
                child: Text.rich(
                  TextSpan(
                    text: 'Explore the world\nwith ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Voyage.',
                        style: TextStyle(
                          color: AppTheme.primaryBlue, // غيّر اللون اللي انت عايزه
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),

          const SizedBox(height: 20),

          // CARD
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: AppTheme.cardShadow,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // TRIP TYPE (FIXED OVERFLOW)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isRoundTrip = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isRoundTrip
                                ? AppTheme.brightBlue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: AppTheme.greyText.withOpacity(0.5)),
                          ),
                          child: Center(
                            child: Text(
                              'Round Trip',
                              style: TextStyle(
                                color: isRoundTrip
                                    ? Colors.white
                                    : AppTheme.greyText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isRoundTrip = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: !isRoundTrip
                                ? AppTheme.brightBlue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: AppTheme.greyText.withOpacity(0.5)),
                          ),
                          child: Center(
                            child: Text(
                              'One Way',
                              style: TextStyle(
                                color: !isRoundTrip
                                    ? Colors.white
                                    : AppTheme.greyText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // FIELDS
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.greyBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.flight_takeoff, size: 18, color: Colors.blue),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('From', style: TextStyle(fontSize: 10)),
                                Text('City'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.greyBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.flight_land, size: 18, color: Colors.blue),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('To', style: TextStyle(fontSize: 10)),
                                Text('City'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // SEARCH BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: const Text('Search Flights'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.brightBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}