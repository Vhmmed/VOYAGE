class Destination {
  final String country;
  final String place;
  final double rating;
  final String image;
  final String description;
  final String? price;

  const Destination({
    required this.country,
    required this.place,
    required this.rating,
    required this.image,
    required this.description,
    this.price,
  });
}
