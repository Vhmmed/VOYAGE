import 'package:voyga/shared/models/explore_destination.dart';

const String spotlightName = 'Great Pyramids';
const String spotlightLocation = 'Giza, Egypt';
const String spotlightCategory = 'BUCKET LIST';
const String spotlightPrice = '1,250';
const String spotlightRating = '4.9';
const String spotlightImage =
    'https://images.unsplash.com/photo-1539650116574-8efeb43e2750?w=400';

const List<Map<String, String>> topDestinationCities = [
  {
    'name': 'London',
    'image':
        'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=400',
  },
  {
    'name': 'Paris',
    'image':
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400',
  },
  {
    'name': 'Sharm El Sheikh',
    'image':
        'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=400',
  },
  {
    'name': 'Dubai',
    'image':
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400',
  },
  {
    'name': 'Rome',
    'image':
        'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=400',
  },
  {
    'name': 'Tokyo',
    'image':
        'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400',
  },
];

const List<Map<String, String>> worldClassEscapes = [
  {
    'name': 'London',
    'price': '18,200',
    'image':
        'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=400',
  },
  {
    'name': 'Paris',
    'price': '16,500',
    'image':
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400',
  },
  {
    'name': 'Dubai',
    'price': '14,800',
    'image':
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400',
  },
  {
    'name': 'Rome',
    'price': '13,200',
    'image':
        'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=400',
  },
];

const String featuredDealDeparture = 'CAI';
const String featuredDealArrival = 'LHR';
const String featuredDealFrom = 'CAIRO';
const String featuredDealTo = 'LONDON';
const String featuredDealPrice = '15,400';

const List<Map<String, String>> flightOffers = [
  {
    'route': 'Cairo to Paris',
    'stops': 'Direct',
    'duration': '4h 50m',
    'price': '14,200',
  },
  {
    'route': 'Cairo to Dubai',
    'stops': 'Direct',
    'duration': '3h 30m',
    'price': '9,800',
  },
  {
    'route': 'Alex to Athens',
    'stops': '1 Stop',
    'duration': '5h 15m',
    'price': '8,450',
  },
];

const List<ExploreDestination> exploreDestinations = [
  ExploreDestination(
    name: 'Egypt',
    city: 'Cairo & Luxor',
    description:
        'Ancient pyramids, majestic temples, and the timeless Nile River.',
    imageUrl:
        'https://images.unsplash.com/photo-1539650116574-8efeb43e2750?w=400',
    landmarks: [
      'Great Pyramid of Giza',
      'Sphinx',
      'Egyptian Museum',
      'Karnak Temple',
      'Valley of the Kings',
    ],
  ),
  ExploreDestination(
    name: 'Thailand',
    city: 'Bangkok & Phuket',
    description:
        'Golden temples, floating markets, and pristine tropical beaches.',
    imageUrl:
        'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?w=400',
    landmarks: [
      'Grand Palace',
      'Wat Phra Kaew',
      'Phi Phi Islands',
      'Chatuchak Market',
      'Floating Markets',
    ],
  ),
  ExploreDestination(
    name: 'Switzerland',
    city: 'Interlaken & Zurich',
    description:
        'Alpine peaks, crystal lakes, and charming mountain villages.',
    imageUrl:
        'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=400',
    landmarks: [
      'Jungfraujoch',
      'Lake Geneva',
      'Chapel Bridge',
      'Rhine Falls',
      'Matterhorn',
    ],
  ),
  ExploreDestination(
    name: 'Japan',
    city: 'Tokyo & Kyoto',
    description:
        'Ancient temples, neon-lit streets, and serene bamboo forests.',
    imageUrl:
        'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400',
    landmarks: [
      'Fushimi Inari Shrine',
      'Arashiyama Bamboo Grove',
      'Senso-ji Temple',
      'Shibuya Crossing',
      'Mount Fuji',
    ],
  ),
  ExploreDestination(
    name: 'Greece',
    city: 'Santorini & Athens',
    description:
        'Whitewashed buildings, blue domes, and ancient ruins under the sun.',
    imageUrl:
        'https://images.unsplash.com/photo-1613395877344-13b4b9b0d4b3?w=400',
    landmarks: [
      'Parthenon',
      'Santorini Caldera',
      'Red Beach',
      'Oia Castle Ruins',
      'Plaka District',
    ],
  ),
  ExploreDestination(
    name: 'Indonesia',
    city: 'Bali',
    description:
        'Tropical paradise with ancient temples and vibrant coral reefs.',
    imageUrl:
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=400',
    landmarks: [
      'Tanah Lot Temple',
      'Tegallalang Rice Terraces',
      'Ubud Monkey Forest',
      'Seminyak Beach',
      'Mount Batur',
    ],
  ),
  ExploreDestination(
    name: 'Italy',
    city: 'Amalfi Coast & Rome',
    description: 'Ancient ruins meet dramatic coastal cliffs and cuisine.',
    imageUrl:
        'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=400',
    landmarks: [
      'Colosseum',
      'Vatican Museums',
      'Path of the Gods',
      'Pompeii Ruins',
      'Positano Coastline',
    ],
  ),
  ExploreDestination(
    name: 'Maldives',
    city: 'Male & Atolls',
    description:
        'Overwater bungalows and crystalline lagoons on pristine atolls.',
    imageUrl:
        'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=400',
    landmarks: [
      'Banana Reef',
      'Manta Point',
      'Biyadhoo Island',
      'Hulhumale Beach',
      'Vaavu Atoll',
    ],
  ),
];
