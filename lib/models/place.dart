class Place {
  final String name;
  final String city;
  final int price;
  final double rating;
  final String description;
  final List<String> images;

  Place({
    required this.name,
    required this.city,
    required this.price,
    required this.rating,
    required this.description,
    required this.images,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['place_name'] ?? 'Unknown Place',
      city: json['city'] ?? 'Unknown City',
      price: json['price'] ?? 0,
      rating: (json['rate'] ?? 0).toDouble(),
      description: json['description'] ?? 'No description available.',
      images: List<String>.from(json['images']),
    );
  }
}
