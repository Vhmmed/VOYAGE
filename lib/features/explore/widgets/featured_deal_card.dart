import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/explore/data/explore_data.dart';

class FeaturedDealCard extends StatelessWidget {
  final VoidCallback? onBookNow;

  const FeaturedDealCard({super.key, this.onBookNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'DEAL OF THE WEEK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildRouteRow(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const Text(
                featuredDealFrom,
                style: TextStyle(
                  fontSize: 11,
                  color: AppTheme.greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Text(
                featuredDealTo,
                style: TextStyle(
                  fontSize: 11,
                  color: AppTheme.greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Starting from',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.greyText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$featuredDealPrice EGP',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onBookNow,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Book This Deal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRouteRow() {
    return Row(
      children: [
        const Text(
          featuredDealDeparture,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
            letterSpacing: 2,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(15, (_) => const Padding(
              padding: EdgeInsets.only(right: 3),
              child: SizedBox(
                width: 4,
                height: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
              ),
            )),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.flight_takeoff,
            color: AppTheme.primaryBlue,
            size: 20,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(14, (_) => const Padding(
              padding: EdgeInsets.only(right: 3),
              child: SizedBox(
                width: 4,
                height: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
              ),
            )),
          ),
        ),
        const Text(
          featuredDealArrival,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
