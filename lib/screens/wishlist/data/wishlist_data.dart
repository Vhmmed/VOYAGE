import 'package:flutter/material.dart';

// ─── Wishlist Static Data ────────────────────────────────────────────────────

final List<Map<String, dynamic>> wishlistItems = [
  {
    'type': 'hotel',
    'title': 'The Savoy Regency',
    'price': '12,400 EGP / night',
    'image': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
    'badge': 'FREE CANCELLATION',
    'badgeColor': Colors.green,
    'rating': 4.7,
    'reviews': 1890,
  },
  {
    'type': 'flight',
    'title': 'CAI → LHR',
    'subtitle': 'Direct • Flight MS777',
    'price': '15,850 EGP',
    'badge': 'Price Drop! Lowest in 30 days',
    'badgeColor': Color(0xFF8B5CF6),
    'buttonText': 'Select',
    'from': 'CAI',
    'to': 'LHR',
    'departureTime': '10:30 AM',
    'arrivalTime': '2:15 PM',
    'duration': '3h 45m',
    'stops': 'Non-stop',
    'flightNumber': 'MS777',
    'airline': 'EgyptAir',
  },
  {
    'type': 'activity',
    'title': 'Luxor Balloon Ride',
    'duration': '4 hours',
    'capacity': 'Up to 4 people',
    'image': 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=400',
    'badge': 'PRIVATE TOUR',
    'badgeColor': Colors.orange,
    'price': '2,500 EGP / person',
  },
  {
    'type': 'hotel',
    'title': 'Rixos Premium Seagate',
    'rating': 4.8,
    'reviews': 1240,
    'price': '8,200 EGP / night',
    'image': 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=400',
  },
];
