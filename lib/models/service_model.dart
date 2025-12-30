// models/service_model.dart
class Service {
  final String id;
  final String name;
  final String description;
  final double price;
  final String duration;
  final String imageUrl;
  final List<String> features;
  final bool isActive;
  final String category;
  final int minPersons;
  final int maxPersons;
  final double rating;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.imageUrl,
    this.features = const [],
    this.isActive = true,
    this.category = 'General',
    this.minPersons = 1,
    this.maxPersons = 10,
    this.rating = 4.5,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'duration': duration,
      'imageUrl': imageUrl,
      'features': features,
      'isActive': isActive,
      'category': category,
      'minPersons': minPersons,
      'maxPersons': maxPersons,
      'rating': rating,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'].toDouble(),
      duration: map['duration'],
      imageUrl: map['imageUrl'],
      features: List<String>.from(map['features'] ?? []),
      isActive: map['isAdmin'] ?? true,
      category: map['category'] ?? 'General',
      minPersons: map['minPersons'] ?? 1,
      maxPersons: map['maxPersons'] ?? 10,
      rating: map['rating']?.toDouble() ?? 4.5,
    );
  }
}