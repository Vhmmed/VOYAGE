class ItineraryItem {
  final String number;
  final String name;
  final String price;
  final String time;

  const ItineraryItem({
    required this.number,
    required this.name,
    required this.price,
    required this.time,
  });
}

class ChatMessage {
  final String role;
  final String text;

  const ChatMessage({required this.role, required this.text});
}

const String activeCity = 'Cairo, Egypt';
const String activeImage =
    'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=400';

const List<ItineraryItem> itineraryItems = [
  ItineraryItem(
    number: '01',
    name: 'Private Museum Tour',
    price: '1,250 EGP',
    time: '09:00 AM',
  ),
  ItineraryItem(
    number: '02',
    name: 'Sunset Nile Felucca',
    price: '450 EGP',
    time: '05:30 PM',
  ),
];

const List<ChatMessage> chatMessages = [
  ChatMessage(
    role: 'assistant',
    text:
        'Hi Ali! I found a boutique hotel in Zamalek for 2,800 EGP per night.',
  ),
  ChatMessage(
    role: 'user',
    text: 'Yes, that sounds perfect. Please add it.',
  ),
];
