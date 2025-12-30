import 'package:flutter/material.dart';

class ServiceProvider with ChangeNotifier {
  List<Service> _services = [];
  List<Service> _filteredServices = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _searchQuery = '';

  List<Service> get services => _services;
  List<Service> get filteredServices => _searchQuery.isEmpty ? _services : _filteredServices;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;

  final List<Service> _demoServices = [
    Service(
      id: '1',
      name: 'Nettoyage Maison Standard',
      description: 'Nettoyage complet de votre maison incluant toutes les pièces',
      price: 80.0,
      duration: '3 heures',
      imageUrl: 'assets/images/services/home_cleaning.jpg',
      features: ['Nettoyage des sols', 'Dépoussiérage', 'Nettoyage salle de bain', 'Nettoyage cuisine'],
      category: 'Résidentiel',
      minPersons: 1,
      maxPersons: 5,
      rating: 4.8,
    ),
    Service(
      id: '2',
      name: 'Nettoyage Profond',
      description: 'Nettoyage intensif avec produits professionnels',
      price: 150.0,
      duration: '5 heures',
      imageUrl: 'assets/images/services/deep_cleaning.jpg',
      features: ['Nettoyage des recoins', 'Dégraissage', 'Nettoyage des vitres', 'Désinfection complète'],
      category: 'Résidentiel',
      minPersons: 2,
      maxPersons: 3,
      rating: 4.9,
    ),
    Service(
      id: '3',
      name: 'Nettoyage de Bureau',
      description: 'Nettoyage professionnel pour espaces de travail',
      price: 120.0,
      duration: '4 heures',
      imageUrl: 'assets/images/services/office_cleaning.jpg',
      features: ['Nettoyage des bureaux', 'Vidéos des poubelles', 'Nettoyage sanitaires', 'Nettoyage espaces communs'],
      category: 'Commercial',
      minPersons: 2,
      maxPersons: 10,
      rating: 4.7,
    ),
    Service(
      id: '4',
      name: 'Nettoyage de Tapis',
      description: 'Nettoyage spécialisé pour tapis et moquettes',
      price: 60.0,
      duration: '2 heures',
      imageUrl: 'assets/images/services/carpet_cleaning.jpg',
      features: ['Détachage', 'Nettoyage vapeur', 'Séchage rapide', 'Désodorisation'],
      category: 'Spécialisé',
      minPersons: 1,
      maxPersons: 2,
      rating: 4.6,
    ),
    Service(
      id: '5',
      name: 'Nettoyage de Vitres',
      description: 'Nettoyage intérieur et extérieur des vitres',
      price: 70.0,
      duration: '2.5 heures',
      imageUrl: 'assets/images/services/window_cleaning.jpg',
      features: ['Nettoyage intérieur', 'Nettoyage extérieur', 'Dégarnage des cadres', 'Finitions parfaites'],
      category: 'Spécialisé',
      minPersons: 1,
      maxPersons: 2,
      rating: 4.8,
    ),
    Service(
      id: '6',
      name: 'Service Blanchisserie',
      description: 'Blanchisserie et repassage professionnel',
      price: 40.0,
      duration: '24 heures',
      imageUrl: 'assets/images/services/laundry.jpg',
      features: ['Lavage professionnel', 'Repassage soigné', 'Plantage', 'Livraison incluse'],
      category: 'Domestique',
      minPersons: 1,
      maxPersons: 1,
      rating: 4.5,
    ),
  ];

  Future<void> loadServices() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      _services = _demoServices.where((service) => service.isActive).toList();
      _filteredServices = _services;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Erreur lors du chargement des services';
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchServices(String query) {
    _searchQuery = query;

    if (query.isEmpty) {
      _filteredServices = _services;
    } else {
      _filteredServices = _services.where((service) {
        return service.name.toLowerCase().contains(query.toLowerCase()) ||
            service.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _filteredServices = _services;
    notifyListeners();
  }

  Service? getServiceById(String id) {
    try {
      return _services.firstWhere((service) => service.id == id);
    } catch (e) {
      return null;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

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
}