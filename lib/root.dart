import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyga/screens/auth/widgets/profile_screen.dart';
import 'package:voyga/screens/bookings/booking_screen.dart';
import 'package:voyga/screens/bookings/my_bookings_screen.dart';
import 'package:voyga/screens/explore/explore_view.dart';
import 'package:voyga/screens/home/home_screen.dart';
import 'package:voyga/screens/wishlist/wishlist_screen.dart';
import 'package:voyga/themes/app_theme.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController pageController;
  late List<Widget> screens;
  int currentScreen = 0;

  @override
  void initState() {
    screens = const [
      HomeScreen(),
      ExploreView(),
      SecretDealsScreen(),
      WishlistScreen(),
      ProfileScreen(),
    ];
    pageController = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// NAV ITEM
  Widget navItem(IconData icon, String label, int index) {
    bool isSelected = currentScreen == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentScreen = index;
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade400,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [

          /// PAGES
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: screens,
          ),

          /// GLASS FLOATING NAVBAR
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      navItem(Icons.home_filled, "Home", 0),
                      navItem(Icons.explore_outlined, "Explore", 1),
                      navItem(Icons.flight_takeoff_outlined, "Bookings", 2),
                      navItem(Icons.favorite_border, "Wishlist", 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}