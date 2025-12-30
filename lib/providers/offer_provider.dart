import 'package:flutter/material.dart';

class OfferProvider with ChangeNotifier {
  List<Offer> _offers = [];
  List<Offer> _activeOffers = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Offer> get offers => _offers;
  List<Offer> get activeOffers => _activeOffers;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final List<Offer> _demoOffers = [
    Offer(
      id: '1',
      title: 'Première Visite',
      discount: '30% DE RÉDUCTION',
      description: 'Profitez de 30% de réduction sur votre première commande',
      imageUrl: 'assets/images/offers/first_visit.jpg',
      validity: 'Valide jusqu\'au 31/12/2024',
      code: 'FIRST30',
      isActive: true,
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 12, 31),
      minAmount: 50,
      maxUsage: 1000,
    ),
    Offer(
      id: '2',
      title: 'Abonnement Mensuel',
      discount: '20% DE RÉDUCTION',
      description: 'Abonnez-vous et économisez 20% chaque mois',
      imageUrl: 'assets/images/offers/monthly_subscription.jpg',
      validity: 'Engagement minimum 3 mois',
      code: 'MONTHLY20',
      isActive: true,
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 12, 31),
      minAmount: 100,
      maxUsage: 500,
    ),
    Offer(
      id: '3',
      title: 'Spécial Week-end',
      discount: '15% DE RÉDUCTION',
      description: 'Nettoyage du week-end à tarifs réduits',
      imageUrl: 'assets/images/offers/weekend.jpg',
      validity: 'Valable du vendredi au dimanche',
      code: 'WEEKEND15',
      isActive: true,
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 12, 31),
      minAmount: 0,
      maxUsage: 200,
    ),
    Offer(
      id: '4',
      title: 'Parrainage',
      discount: '€20 DE BONUS',
      description: 'Recevez €20 pour chaque ami parrainé',
      imageUrl: 'assets/images/offers/referral.jpg',
      validity: 'Sans limite',
      code: 'REFER20',
      isActive: true,
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 12, 31),
      minAmount: 0,
      maxUsage: 99999,
    ),
  ];

  Future<void> loadOffers() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      final now = DateTime.now();

      _offers = _demoOffers.where((offer) {
        return offer.isActive &&
            now.isAfter(offer.startDate) &&
            now.isBefore(offer.endDate);
      }).toList();

      _activeOffers = _offers.where((offer) => offer.isActive).toList();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Erreur lors du chargement des offres';
    }

    _isLoading = false;
    notifyListeners();
  }

  Offer? getOfferById(String id) {
    try {
      return _offers.firstWhere((offer) => offer.id == id);
    } catch (e) {
      return null;
    }
  }

  Offer? getOfferByCode(String code) {
    try {
      final now = DateTime.now();
      return _offers.firstWhere((offer) {
        return offer.code == code &&
            offer.isActive &&
            now.isAfter(offer.startDate) &&
            now.isBefore(offer.endDate);
      });
    } catch (e) {
      return null;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

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
}