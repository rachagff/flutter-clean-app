// models/user_model.dart
class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String? profileImage;
  final DateTime createdAt;
  final bool isAdmin;
  final List<String> bookingIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.profileImage,
    required this.createdAt,
    this.isAdmin = false,
    this.bookingIds = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'isAdmin': isAdmin,
      'bookingIds': bookingIds,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      profileImage: map['profileImage'],
      createdAt: DateTime.parse(map['createdAt']),
      isAdmin: map['isAdmin'] ?? false,
      bookingIds: List<String>.from(map['bookingIds'] ?? []),
    );
  }
}