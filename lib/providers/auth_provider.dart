import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;
  bool get isAdmin => _currentUser?.isAdmin ?? false;

  final List<User> _demoUsers = [
    User(
      id: '1',
      name: 'Jean Dupont',
      email: 'client@exemple.com',
      phone: '0123456789',
      address: '123 Rue de Paris, Alger',
      createdAt: DateTime.now(),
      isAdmin: false,
    ),
    User(
      id: '2',
      name: 'Administrateur',
      email: 'admin@nettoyage.com',
      phone: '0987654321',
      address: 'Siège social',
      createdAt: DateTime.now(),
      isAdmin: true,
    ),
  ];

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _demoUsers.firstWhere(
            (user) => user.email == email,
        orElse: () => throw Exception('Utilisateur non trouvé'),
      );

      _currentUser = user;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Email ou mot de passe incorrect';
      _currentUser = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginAsAdmin(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _demoUsers.firstWhere(
            (user) => user.email == email && user.isAdmin,
        orElse: () => throw Exception('Accès admin refusé'),
      );

      _currentUser = user;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Accès admin refusé';
      _currentUser = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    try {
      if (_demoUsers.any((user) => user.email == email)) {
        throw Exception('Cet email est déjà utilisé');
      }

      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        phone: phone,
        address: address,
        createdAt: DateTime.now(),
        isAdmin: false,
      );

      _demoUsers.add(newUser);
      _currentUser = newUser;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

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
}