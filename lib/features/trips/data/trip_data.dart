class PastTrip {
  final String destination;
  final String imageUrl;
  final String monthYear;
  final String days;
  final String spent;

  const PastTrip({
    required this.destination,
    required this.imageUrl,
    required this.monthYear,
    required this.days,
    required this.spent,
  });
}

const String activeDestination = 'London, UK';
const String activeImage =
    'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=400';
const String activeStartDate = 'Oct 12';
const String activeEndDate = 'Oct 19';
const String activeBudget = '85,500';
const String activeTravelers = '1 Traveler';
const String activeFlight = 'LHR Direct';

const List<PastTrip> pastTrips = [
  PastTrip(
    destination: 'Sharm El Sheikh',
    imageUrl:
        'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=400',
    monthYear: 'August 2023',
    days: '5 Days',
    spent: '32,400',
  ),
  PastTrip(
    destination: 'Rome, Italy',
    imageUrl:
        'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=400',
    monthYear: 'May 2023',
    days: '7 Days',
    spent: '58,900',
  ),
];
