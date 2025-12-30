// models/offer_model.dart
class Offer {
  final String id;
  final String title;
  final String discount;
  final String description;
  final String imageUrl;
  final String validity;
  final String code;
  final bool isActive;
  final DateTime startDate;
  final DateTime endDate;
  final double minAmount;
  final int maxUsage;

  Offer({
    required this.id,
    required this.title,
    required this.discount,
    required this.description,
    required this.imageUrl,
    required this.validity,
    required this.code,
    this.isActive = true,
    required this.startDate,
    required this.endDate,
    this.minAmount = 0,
    this.maxUsage = 100,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'discount': discount,
      'description': description,
      'imageUrl': imageUrl,
      'validity': validity,
      'code': code,
      'isActive': isActive,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'minAmount': minAmount,
      'maxUsage': maxUsage,
    };
  }

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      id: map['id'],
      title: map['title'],
      discount: map['discount'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      validity: map['validity'],
      code: map['code'],
      isActive: map['isActive'] ?? true,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      minAmount: map['minAmount']?.toDouble() ?? 0,
      maxUsage: map['maxUsage'] ?? 100,
    );
  }
}
