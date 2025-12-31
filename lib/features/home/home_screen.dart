import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  // Nouvelle palette de couleurs professionnelle
  final Color _primaryBlue = const Color(0xFF1C768C);
  final Color _secondaryBlue = const Color(0xFF21BBC7);
  final Color _lightBlue = const Color(0xFFE6F7F9);
  final Color _accentTeal = const Color(0xFF4ECDC4);
  final Color _accentCoral = const Color(0xFFFF6B6B);
  final Color _accentYellow = const Color(0xFFFFD166);
  final Color _accentPurple = const Color(0xFF9D65C9);
  final Color _textDark = const Color(0xFF2D3748);
  final Color _textLight = const Color(0xFF718096);
  final Color _white = Colors.white;
  final Color _lightGrey = const Color(0xFFF7FAFC);

  // Header gradient léger et professionnel
  final List<Color> _headerGradient = [
    const Color(0xFFE6F7F9),
    const Color(0xFFD6F0F5),
    const Color(0xFFC6E9F1),
  ];

  // Liste des images pour le slider
  final List<String> _bannerImages = [
    'assets/offer5.jpg',
    'assets/offer4.jpg',
    'assets/offer3.jpg',
    'assets/offer2.jpg',
    'assets/offer1.jpg',
  ];

  final List<String> _bannerTitles = [
    'Services de Nettoyage',
    'Spécialistes en Nettoyage',
    'Produits Écologiques',
    'Service Express 24h/24',
    'Nettoyage Industriel'
  ];

  final List<String> _bannerDescriptions = [
    'Réservez maintenant -25%',
    'Maison étincelante de propreté',
    'Sécurité famille et animaux',
    'Intervention rapide <2h',
    'Solutions pour entreprises'
  ];

  // Déclarez les listes sans initialisation
  late List<Service> _services;
  late List<Offer> _offers;
  late List<PremiumService> _premiumServices;

  @override
  void initState() {
    super.initState();

    // Initialisez les listes ici dans initState
    _services = _createServices();
    _offers = _createOffers();
    _premiumServices = _createPremiumServices();

    _pageController = PageController(viewportFraction: 0.85);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
  }

  // Méthode pour créer la liste des services
  List<Service> _createServices() {
    return [
      Service('Nettoyage Maison', Icons.cleaning_services, 'assets/clean1.png', 'Complet', _accentTeal),
      Service('Nettoyage Profond', Icons.clean_hands, 'assets/clean2.png', 'Intensif', _accentCoral),
      Service('Nettoyage Bureau', Icons.business, 'assets/clean3.png', 'Pro', _accentYellow),
      Service('Nettoyage Tapis', Icons.carpenter, 'assets/clean4.png', 'Spécial', _accentPurple),
      Service('Nettoyage Vitres', Icons.window, 'assets/offer1.jpg', 'Éclat', _secondaryBlue),
      Service('Blanchisserie', Icons.local_laundry_service, 'assets/offer2.jpg', 'Pro', _accentTeal),
      Service('Désinfection', Icons.medical_services, 'assets/offer3.jpg', 'Santé', _accentCoral),
      Service('Après Travaux', Icons.construction, 'assets/offer4.jpg', 'Complet', _accentYellow),
      Service('Écologique', Icons.eco, 'assets/offer5.jpg', 'Vert', _accentPurple),
      Service('Urgence', Icons.emergency, 'assets/offer6.jpg', 'Rapide', _secondaryBlue),
    ];
  }

  // Méthode pour créer la liste des offres
  List<Offer> _createOffers() {
    return [
      Offer('Premier Nettoyage', '30% réduction première réservation', '30%', Icons.celebration, _accentTeal),
      Offer('Pack Mensuel', 'Économisez 20% chaque mois', '20%', Icons.calendar_today, _accentCoral),
      Offer('Week-end', 'Nettoyage week-end réduit', '15%', Icons.weekend, _accentYellow),
      Offer('Parrainage', '2000 DZD par ami', '2000', Icons.group, _accentPurple),
      Offer('Famille', '-25% familles 4+ personnes', '25%', Icons.family_restroom, _secondaryBlue),
      Offer('Senior 60+', 'Réduction spéciale seniors', '-20%', Icons.elderly, _accentTeal),
    ];
  }

  // Méthode pour créer la liste des services premium
  List<PremiumService> _createPremiumServices() {
    return [
      PremiumService(
        'Nettoyage Intégral',
        'assets/clean1.png',
        'Service complet A à Z',
        '3500 DZD',
        4.9,
      ),
      PremiumService(
        'Pack Entreprise',
        'assets/clean2.png',
        'Bureaux et entreprises',
        '8000 DZD',
        4.8,
      ),
      PremiumService(
        'Service Écologique',
        'assets/clean3.png',
        '100% naturel',
        '4500 DZD',
        4.9,
      ),
    ];
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted && _pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= _bannerImages.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/offers');
        break;
      case 2:
        Navigator.pushNamed(context, '/services');
        break;
      case 3:
        Navigator.pushNamed(context, '/about');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isVerySmallScreen = screenWidth < 320;
    final isExtraSmallScreen = screenWidth < 300;

    return Scaffold(
      backgroundColor: _lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            // Header moderne et professionnel avec gradient léger
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isExtraSmallScreen ? 10.0 : isVerySmallScreen ? 12.0 : 16.0,
                vertical: isExtraSmallScreen ? 8.0 : 12.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _headerGradient,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Top bar avec logo et user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo avec effet de profondeur
                      Container(
                        width: isExtraSmallScreen ? 35 : isVerySmallScreen ? 40 : 45,
                        height: isExtraSmallScreen ? 35 : isVerySmallScreen ? 40 : 45,
                        decoration: BoxDecoration(
                          color: _white,
                          borderRadius: BorderRadius.circular(isExtraSmallScreen ? 8 : 12),
                          boxShadow: [
                            BoxShadow(
                              color: _primaryBlue.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/logo.png',
                            width: isExtraSmallScreen ? 30 : isVerySmallScreen ? 35 : 40,
                            height: isExtraSmallScreen ? 30 : isVerySmallScreen ? 35 : 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // User info avec badge - version compacte pour petits écrans
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isExtraSmallScreen ? 6.0 : 8.0,
                          vertical: isExtraSmallScreen ? 4.0 : 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: _white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            if (!isExtraSmallScreen)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Bienvenue',
                                    style: TextStyle(
                                      color: _textLight,
                                      fontSize: isVerySmallScreen ? 9 : 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Racha G.',
                                    style: TextStyle(
                                      color: _textDark,
                                      fontSize: isVerySmallScreen ? 10 : 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            if (!isExtraSmallScreen) SizedBox(width: isVerySmallScreen ? 4 : 6),
                            Stack(
                              children: [
                                Container(
                                  width: isExtraSmallScreen ? 28 : 32,
                                  height: isExtraSmallScreen ? 28 : 32,
                                  decoration: BoxDecoration(
                                    color: _primaryBlue,
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [_secondaryBlue, _primaryBlue],
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: isExtraSmallScreen ? 14 : 16,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: _accentCoral,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: _white, width: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: isExtraSmallScreen ? 8 : 12),

                  // Search bar moderne
                  Container(
                    height: isExtraSmallScreen ? 40 : 44,
                    decoration: BoxDecoration(
                      color: _white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Rechercher...',
                              hintStyle: TextStyle(
                                color: _textLight,
                                fontSize: isExtraSmallScreen ? 12 : 13,
                              ),
                              prefixIcon: Icon(Icons.search,
                                  color: _primaryBlue, size: isVerySmallScreen ? 18 : 20),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: isExtraSmallScreen ? 8 : 12,
                                vertical: isExtraSmallScreen ? 10 : 12,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: isExtraSmallScreen ? 38 : 42,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: _accentTeal,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: isVerySmallScreen ? 18 : 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(isExtraSmallScreen ? 8 : isVerySmallScreen ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner slider amélioré
                    SizedBox(
                      height: isExtraSmallScreen ? 130 : isVerySmallScreen ? 150 : 170,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: _bannerImages.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: isExtraSmallScreen ? 2 : 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
                                    child: Stack(
                                      children: [
                                        // Image avec overlay gradient
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black.withOpacity(0.7),
                                                Colors.transparent,
                                              ],
                                            ),
                                          ),
                                          child: Image.asset(
                                            _bannerImages[index],
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Contenu
                                        Padding(
                                          padding: EdgeInsets.all(isExtraSmallScreen ? 8 : 12),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: isExtraSmallScreen ? 6 : 8,
                                                  vertical: isExtraSmallScreen ? 2 : 3,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _accentCoral,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  'LIMITÉ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: isExtraSmallScreen ? 7 : 8,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: isExtraSmallScreen ? 4 : 6),
                                              Text(
                                                _bannerTitles[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isExtraSmallScreen ? 12 : isVerySmallScreen ? 14 : 16,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.2,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: isExtraSmallScreen ? 2 : 4),
                                              Text(
                                                _bannerDescriptions[index],
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.9),
                                                  fontSize: isExtraSmallScreen ? 10 : 11,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: isExtraSmallScreen ? 8 : 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _bannerImages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: _currentPage == index ? 20 : 5,
                                height: 5,
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: _currentPage == index ? _primaryBlue : _lightBlue,
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 16 : 20),

                    // Section Services
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nos Services',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 16 : isVerySmallScreen ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Large gamme disponible',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 10 : 11,
                                  color: _textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isExtraSmallScreen ? 6 : 8,
                            vertical: isExtraSmallScreen ? 3 : 4,
                          ),
                          decoration: BoxDecoration(
                            color: _lightBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${_services.length}',
                                style: TextStyle(
                                  color: _primaryBlue,
                                  fontSize: isExtraSmallScreen ? 9 : 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: isExtraSmallScreen ? 1 : 2),
                              Icon(Icons.arrow_forward_ios,
                                  color: _primaryBlue,
                                  size: isExtraSmallScreen ? 8 : 9),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isExtraSmallScreen ? 10 : 12),

                    // Grille de services améliorée
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isExtraSmallScreen ? 3 : 4,
                        crossAxisSpacing: isExtraSmallScreen ? 6 : 8,
                        mainAxisSpacing: isExtraSmallScreen ? 6 : 8,
                        childAspectRatio: isExtraSmallScreen ? 0.85 : 0.8,
                      ),
                      itemCount: _services.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          service: _services[index],
                          isSmallScreen: isSmallScreen,
                          isVerySmallScreen: isVerySmallScreen,
                          isExtraSmallScreen: isExtraSmallScreen,
                        );
                      },
                    ),

                    SizedBox(height: isExtraSmallScreen ? 16 : 20),

                    // Section Services Premium
                    Container(
                      padding: EdgeInsets.all(isExtraSmallScreen ? 10 : 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _primaryBlue.withOpacity(0.1),
                            _accentTeal.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Services Premium',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 14 : isVerySmallScreen ? 16 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isExtraSmallScreen ? 6 : 8,
                                  vertical: isExtraSmallScreen ? 2 : 3,
                                ),
                                decoration: BoxDecoration(
                                  color: _accentTeal,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'EXCLUSIF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isExtraSmallScreen ? 7 : 8,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Les plus demandés',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 11 : 12,
                              color: _textLight,
                            ),
                          ),
                          SizedBox(height: isExtraSmallScreen ? 10 : 12),
                          SizedBox(
                            height: isExtraSmallScreen ? 180 : isVerySmallScreen ? 200 : 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _premiumServices.length,
                              itemBuilder: (context, index) {
                                return PremiumServiceCard(
                                  service: _premiumServices[index],
                                  isSmallScreen: isSmallScreen,
                                  isVerySmallScreen: isVerySmallScreen,
                                  isExtraSmallScreen: isExtraSmallScreen,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 16 : 20),

                    // Section Offres Spéciales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Offres Spéciales',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 16 : isVerySmallScreen ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Promotions exclusives',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 10 : 11,
                                  color: _textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/offers');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isExtraSmallScreen ? 8 : 10,
                              vertical: isExtraSmallScreen ? 4 : 5,
                            ),
                            decoration: BoxDecoration(
                              color: _white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: _lightBlue, width: 1),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Voir',
                                  style: TextStyle(
                                    color: _primaryBlue,
                                    fontSize: isExtraSmallScreen ? 9 : 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: isExtraSmallScreen ? 1 : 2),
                                Icon(Icons.arrow_forward,
                                    color: _primaryBlue,
                                    size: isExtraSmallScreen ? 10 : 12),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isExtraSmallScreen ? 10 : 12),

                    // Slider d'offres horizontal
                    SizedBox(
                      height: isExtraSmallScreen ? 140 : isVerySmallScreen ? 160 : 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _offers.length,
                        itemBuilder: (context, index) {
                          return OfferCard(
                            offer: _offers[index],
                            isSmallScreen: isSmallScreen,
                            isVerySmallScreen: isVerySmallScreen,
                            isExtraSmallScreen: isExtraSmallScreen,
                          );
                        },
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 16 : 20),

                    // Section Autres Offres - FIXED: Using ListView.builder instead of spread operator
                    Text(
                      'Autres Avantages',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 14 : isVerySmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: _textDark,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Avantages exclusifs',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 10 : 11,
                        color: _textLight,
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 10 : 12),

                    // FIX: Using ListView.builder instead of spread operator
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _offers.length,
                      itemBuilder: (context, index) {
                        return AdditionalOfferCard(
                          offer: _offers[index],
                          isSmallScreen: isSmallScreen,
                          isVerySmallScreen: isVerySmallScreen,
                          isExtraSmallScreen: isExtraSmallScreen,
                        );
                      },
                    ),

                    // Section Contact moderne
                    SizedBox(height: isExtraSmallScreen ? 16 : 20),
                    Container(
                      padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _primaryBlue,
                            _secondaryBlue,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
                        boxShadow: [
                          BoxShadow(
                            color: _primaryBlue.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: isExtraSmallScreen ? 40 : 45,
                            height: isExtraSmallScreen ? 40 : 45,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.support_agent,
                              size: isExtraSmallScreen ? 20 : 22,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: isExtraSmallScreen ? 8 : 12),
                          Text(
                            'Service personnalisé?',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isExtraSmallScreen ? 4 : 6),
                          Text(
                            'Experts disponibles',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 11 : 12,
                              color: Colors.white70,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isExtraSmallScreen ? 12 : 16),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: _primaryBlue,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isExtraSmallScreen ? 10 : 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: Text(
                                    'Appeler',
                                    style: TextStyle(
                                      fontSize: isExtraSmallScreen ? 12 : 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: isExtraSmallScreen ? 8 : 10),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.white),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isExtraSmallScreen ? 10 : 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Message',
                                    style: TextStyle(
                                      fontSize: isExtraSmallScreen ? 12 : 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 20 : 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: _white,
            selectedItemColor: _primaryBlue,
            unselectedItemColor: _textLight,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isExtraSmallScreen ? 8 : 9,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: isExtraSmallScreen ? 8 : 9,
            ),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 4 : 5),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    size: _selectedIndex == 0
                        ? (isExtraSmallScreen ? 18 : 20)
                        : (isExtraSmallScreen ? 16 : 18),
                  ),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 4 : 5),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.local_offer,
                    size: _selectedIndex == 1
                        ? (isExtraSmallScreen ? 18 : 20)
                        : (isExtraSmallScreen ? 16 : 18),
                  ),
                ),
                label: 'Offres',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 4 : 5),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.cleaning_services,
                    size: _selectedIndex == 2
                        ? (isExtraSmallScreen ? 18 : 20)
                        : (isExtraSmallScreen ? 16 : 18),
                  ),
                ),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 4 : 5),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 3 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: _selectedIndex == 3
                        ? (isExtraSmallScreen ? 18 : 20)
                        : (isExtraSmallScreen ? 16 : 18),
                  ),
                ),
                label: 'À Propos',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 4 : 5),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 4 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: _selectedIndex == 4
                        ? (isExtraSmallScreen ? 18 : 20)
                        : (isExtraSmallScreen ? 16 : 18),
                  ),
                ),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Classes avec paramètres de taille

class Service {
  final String title;
  final IconData icon;
  final String image;
  final String tag;
  final Color color;

  Service(this.title, this.icon, this.image, this.tag, this.color);
}

class ServiceCard extends StatelessWidget {
  final Service service;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isExtraSmallScreen;

  const ServiceCard({
    super.key,
    required this.service,
    required this.isSmallScreen,
    required this.isVerySmallScreen,
    required this.isExtraSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/services');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isExtraSmallScreen ? 35 : isVerySmallScreen ? 38 : 42,
              height: isExtraSmallScreen ? 35 : isVerySmallScreen ? 38 : 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    service.color.withOpacity(0.9),
                    service.color.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: service.color.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                service.icon,
                color: Colors.white,
                size: isExtraSmallScreen ? 18 : isVerySmallScreen ? 20 : 22,
              ),
            ),
            SizedBox(height: isExtraSmallScreen ? 4 : 6),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                children: [
                  Text(
                    service.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isExtraSmallScreen ? 8 : isVerySmallScreen ? 9 : 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3748),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isExtraSmallScreen ? 2 : 3),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isExtraSmallScreen ? 3 : 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      service.tag,
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 6 : 7,
                        fontWeight: FontWeight.bold,
                        color: service.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumService {
  final String title;
  final String image;
  final String description;
  final String price;
  final double rating;

  PremiumService(this.title, this.image, this.description, this.price, this.rating);
}

class PremiumServiceCard extends StatelessWidget {
  final PremiumService service;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isExtraSmallScreen;

  const PremiumServiceCard({
    super.key,
    required this.service,
    required this.isSmallScreen,
    required this.isVerySmallScreen,
    required this.isExtraSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExtraSmallScreen ? 200 : isVerySmallScreen ? 220 : 240,
      margin: EdgeInsets.only(right: isExtraSmallScreen ? 8 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image avec overlay
          Container(
            height: isExtraSmallScreen ? 80 : isVerySmallScreen ? 90 : 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(service.image), // Use the service's image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(isExtraSmallScreen ? 8 : 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 5 : 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD166),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'PREMIUM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isExtraSmallScreen ? 7 : 8,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isExtraSmallScreen ? 8 : 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        service.title,
                        style: TextStyle(
                          fontSize: isExtraSmallScreen ? 12 : 13,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D3748),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 5 : 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ECDC4).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        service.price,
                        style: TextStyle(
                          fontSize: isExtraSmallScreen ? 9 : 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4ECDC4),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isExtraSmallScreen ? 2 : 4),
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 10 : 11,
                    color: const Color(0xFF718096),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isExtraSmallScreen ? 4 : 6),
                Row(
                  children: [
                    Icon(Icons.star, color: const Color(0xFFFFD166), size: 12),
                    SizedBox(width: 3),
                    Text(
                      '${service.rating}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      '(120)',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 9 : 10,
                        color: const Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isExtraSmallScreen ? 8 : 10),
                SizedBox(
                  height: isExtraSmallScreen ? 32 : 36,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reservation');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C768C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Réserver',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 11 : 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Offer {
  final String title;
  final String description;
  final String discount;
  final IconData icon;
  final Color color;

  Offer(this.title, this.description, this.discount, this.icon, this.color);
}

class OfferCard extends StatelessWidget {
  final Offer offer;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isExtraSmallScreen;

  const OfferCard({
    super.key,
    required this.offer,
    required this.isSmallScreen,
    required this.isVerySmallScreen,
    required this.isExtraSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExtraSmallScreen ? 200 : isVerySmallScreen ? 220 : 240,
      margin: EdgeInsets.only(right: isExtraSmallScreen ? 8 : 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            offer.color.withOpacity(0.9),
            offer.color.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: offer.color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isExtraSmallScreen ? 10 : 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    offer.icon,
                    color: Colors.white,
                    size: isExtraSmallScreen ? 16 : 18,
                  ),
                ),
                SizedBox(height: isExtraSmallScreen ? 6 : 8),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isExtraSmallScreen ? 8 : 10,
                    vertical: isExtraSmallScreen ? 3 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    offer.discount,
                    style: TextStyle(
                      color: offer.color,
                      fontWeight: FontWeight.bold,
                      fontSize: isExtraSmallScreen ? 11 : 12,
                    ),
                  ),
                ),
                SizedBox(height: isExtraSmallScreen ? 6 : 8),
                Text(
                  offer.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isExtraSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isExtraSmallScreen ? 2 : 4),
                Text(
                  offer.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isExtraSmallScreen ? 10 : 11,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: isExtraSmallScreen ? 8 : 10),
            SizedBox(
              height: isExtraSmallScreen ? 32 : 36,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Réservation ${offer.title}'),
                      backgroundColor: offer.color,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: offer.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Profiter',
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 11 : 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionalOfferCard extends StatelessWidget {
  final Offer offer;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isExtraSmallScreen;

  const AdditionalOfferCard({
    super.key,
    required this.offer,
    required this.isSmallScreen,
    required this.isVerySmallScreen,
    required this.isExtraSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isExtraSmallScreen ? 8 : 10),
      padding: EdgeInsets.all(isExtraSmallScreen ? 8 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(isExtraSmallScreen ? 6 : 8),
            decoration: BoxDecoration(
              color: offer.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              offer.icon,
              color: offer.color,
              size: isExtraSmallScreen ? 16 : 18,
            ),
          ),
          SizedBox(width: isExtraSmallScreen ? 8 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 11 : 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  offer.description,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 10 : 11,
                    color: const Color(0xFF718096),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isExtraSmallScreen ? 6 : 8,
              vertical: isExtraSmallScreen ? 3 : 4,
            ),
            decoration: BoxDecoration(
              color: offer.color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: offer.color.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              offer.discount,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isExtraSmallScreen ? 9 : 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
