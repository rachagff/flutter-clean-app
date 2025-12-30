// models/booking_model.dart
class Booking {
  final String id;
  final String userId;
  final String serviceId;
  final String userName;
  final String serviceName;
  final DateTime bookingDate;
  final String timeSlot;
  final String address;
  final String phone;
  final String status; // pending, confirmed, completed, cancelled
  final double amount;
  final String? offerCode;
  final double discount;
  final double totalAmount;
  final String? notes;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.userName,
    required this.serviceName,
    required this.bookingDate,
    required this.timeSlot,
    required this.address,
    required this.phone,
    this.status = 'pending',
    required this.amount,
    this.offerCode,
    this.discount = 0,
    required this.totalAmount,
    this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'serviceId': serviceId,
      'userName': userName,
      'serviceName': serviceName,
      'bookingDate': bookingDate.toIso8601String(),
      'timeSlot': timeSlot,
      'address': address,
      'phone': phone,
      'status': status,
      'amount': amount,
      'offerCode': offerCode,
      'discount': discount,
      'totalAmount': totalAmount,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      userId: map['userId'],
      serviceId: map['serviceId'],
      userName: map['userName'],
      serviceName: map['serviceName'],
      bookingDate: DateTime.parse(map['bookingDate']),
      timeSlot: map['timeSlot'],
      address: map['address'],
      phone: map['phone'],
      status: map['status'] ?? 'pending',
      amount: map['amount'].toDouble(),
      offerCode: map['offerCode'],
      discount: map['discount']?.toDouble() ?? 0,
      totalAmount: map['totalAmount'].toDouble(),
      notes: map['notes'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}