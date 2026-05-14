import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/bookings/my_bookings_screen.dart';
import 'screens/wishlist/wishlist_screen.dart';
import 'screens/auth/widgets/profile_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    MyBookingsScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}