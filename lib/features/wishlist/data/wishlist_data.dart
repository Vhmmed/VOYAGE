class WishlistHotel {
  final String name;
  final String location;
  final String imageUrl;
  final String price;

  const WishlistHotel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.price,
  });
}

const List<WishlistHotel> wishlistHotels = [
  WishlistHotel(
    name: 'The Savoy',
    location: 'Strand, London WC2R 0EZ',
    imageUrl:
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400',
    price: '24,500',
  ),
  WishlistHotel(
    name: 'Rixos Premium',
    location: 'Sharm El Sheikh, Egypt',
    imageUrl:
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400',
    price: '18,200',
  ),
  WishlistHotel(
    name: 'Adrere Amellal',
    location: 'Siwa Oasis, Egypt',
    imageUrl:
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=400',
    price: '12,800',
  ),
];
