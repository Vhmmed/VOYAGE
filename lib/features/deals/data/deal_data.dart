import 'package:voyga/shared/models/deal_item.dart';

const List<DealItem> dealItems = [
  DealItem(
    type: 'flight',
    title: 'Cairo to New York',
    subtitle: 'EgyptAir — Direct',
    price: '€220',
    discount: '-40%',
    image:
        'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400',
  ),
  DealItem(
    type: 'hotel',
    title: 'Steigenberger Cecil',
    subtitle: 'Alexandria • 5★',
    price: '€80',
    discount: '-25%',
    image:
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
    rating: '4.8',
    reviews: '1230',
  ),
  DealItem(
    type: 'tour',
    title: 'Nile Cruise 5 Days',
    subtitle: 'Luxor to Aswan',
    price: '€350',
    discount: '-30%',
    image:
        'https://images.unsplash.com/photo-1553913861-c0fddf2619ee?w=400',
    duration: '5 days',
    capacity: '12 guests',
  ),
  DealItem(
    type: 'flight',
    title: 'Cairo to Dubai',
    subtitle: 'Emirates — Direct',
    price: '€180',
    discount: '-35%',
    image:
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400',
  ),
  DealItem(
    type: 'hotel',
    title: 'Four Seasons Sharm',
    subtitle: 'Sharm El Sheikh • 5★',
    price: '€120',
    discount: '-20%',
    image:
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400',
    rating: '4.9',
    reviews: '890',
  ),
  DealItem(
    type: 'tour',
    title: 'White Desert Safari',
    subtitle: 'Bahariya Oasis',
    price: '€120',
    discount: '-15%',
    image:
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
    duration: '3 days',
    capacity: '8 guests',
  ),
];
