class DealItem {
  final String type;
  final String title;
  final String subtitle;
  final String price;
  final String discount;
  final String image;
  final String? rating;
  final String? reviews;
  final String? duration;
  final String? capacity;

  const DealItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.discount,
    required this.image,
    this.rating,
    this.reviews,
    this.duration,
    this.capacity,
  });
}
