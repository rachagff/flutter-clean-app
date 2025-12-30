import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookings = [];
  List<Booking> _userBookings = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _userId = '';

  List<Booking> get bookings => _bookings;
  List<Booking> get userBookings => _userBookings;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get userId => _userId;

  final List<Booking> _demoBookings = [
    Booking(
      id: '1',
      userId: '1',
      serviceId: '1',
      userName: 'Jean Dupont',
      serviceName: 'Nettoyage Maison Standard',
      bookingDate: DateTime(2024, 12, 15),
      timeSlot: '14:00 - 17:00',
      address: '123 Rue de Paris, Alger',
      phone: '0123456789',
      status: 'confirmed',
      amount: 80.0,
      discount: 0,
      totalAmount: 80.0,
      notes: 'Préférence pour les produits écologiques',
      createdAt: DateTime(2024, 12, 10),
    ),
    Booking(
      id: '2',
      userId: '1',
      serviceId: '3',
      userName: 'Jean Dupont',
      serviceName: 'Nettoyage de Bureau',
      bookingDate: DateTime(2024, 12, 18),
      timeSlot: '09:00 - 13:00',
      address: '456 Avenue des Champs, Alger',
      phone: '0123456789',
      status: 'pending',
      amount: 120.0,
      offerCode: 'FIRST30',
      discount: 36.0,
      totalAmount: 84.0,
      notes: 'Bureau au 3ème étage',
      createdAt: DateTime(2024, 12, 11),
    ),
  ];

  Future<void> loadBookings() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      _bookings = _demoBookings;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Erreur lors du chargement des réservations';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadUserBookings(String userId) async {
    _isLoading = true;
    _userId = userId;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      _userBookings = _demoBookings
          .where((booking) => booking.userId == userId)
          .toList();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Erreur lors du chargement de vos réservations';
    }

    _isLoading = false;
    notifyListeners();
  }

  Booking? getBookingById(String id) {
    try {
      return _bookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

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
  final String status;
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
}