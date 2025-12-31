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
    'assets/clean2.png',
    'assets/clean1.png',
    'assets/clean3.png',
    'assets/clean4.png',
    'assets/offer1.jpg',
  ];

  final List<String> _bannerTitles = [
    'Services de Nettoyage Professionnels',
    'Spécialistes en Nettoyage Profond',
    'Produits Écologiques Certifiés',
    'Service Express 24h/24',
    'Nettoyage Industriel'
  ];

  final List<String> _bannerDescriptions = [
    'Réservez maintenant et obtenez 25% de réduction',
    'Obtenez une maison étincelante de propreté',
    'Sécurité totale pour votre famille et animaux',
    'Intervention rapide en moins de 2 heures',
    'Solutions pour entreprises et industries'
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
    _startAutoSlide();
  }

  // Méthode pour créer la liste des services
  List<Service> _createServices() {
    return [
      Service('Nettoyage Maison', Icons.cleaning_services, 'assets/clean1.png', 'Complet', _accentTeal),
      Service('Nettoyage Profond', Icons.clean_hands, 'assets/clean2.png', 'Intensif', _accentCoral),
      Service('Nettoyage Bureau', Icons.business, 'assets/clean3.png', 'Professionnel', _accentYellow),
      Service('Nettoyage Tapis', Icons.carpenter, 'assets/clean4.png', 'Spécialisé', _accentPurple),
      Service('Nettoyage Vitres', Icons.window, 'assets/offer1.jpg', 'Éclatant', _secondaryBlue),
      Service('Blanchisserie', Icons.local_laundry_service, 'assets/offer2.jpg', 'Professionnel', _accentTeal),
      Service('Désinfection', Icons.medical_services, 'assets/offer3.jpg', 'Sanitaire', _accentCoral),
      Service('Après Travaux', Icons.construction, 'assets/offer4.jpg', 'Complet', _accentYellow),
      Service('Écologique', Icons.eco, 'assets/offer5.jpg', 'Vert', _accentPurple),
      Service('Urgence', Icons.emergency, 'assets/offer6.jpg', 'Rapide', _secondaryBlue),
    ];
  }

  // Méthode pour créer la liste des offres
  List<Offer> _createOffers() {
    return [
      Offer('Premier Nettoyage', '30% de réduction sur votre première réservation', '30% OFF', Icons.celebration, _accentTeal),
      Offer('Pack Mensuel', 'Économisez 20% chaque mois avec abonnement', '20% OFF', Icons.calendar_today, _accentCoral),
      Offer('Spécial Week-end', 'Nettoyage week-end à tarifs réduits', '15% OFF', Icons.weekend, _accentYellow),
      Offer('Parrainage', 'Recevez 2000 DZD par ami parrainé', '2000 DZD', Icons.group, _accentPurple),
      Offer('Famille Nombreuse', '-25% pour les familles de 4+ personnes', '25% OFF', Icons.family_restroom, _secondaryBlue),
      Offer('Senior 60+', 'Réduction spéciale pour seniors', '-20%', Icons.elderly, _accentTeal),
    ];
  }

  // Méthode pour créer la liste des services premium
  List<PremiumService> _createPremiumServices() {
    return [
      PremiumService(
        'Nettoyage Intégral',
        'assets/clean1.png',
        'Service complet de A à Z',
        '3500 DZD',
        4.9,
        'Inclut nettoyage, désinfection et organisation complète de votre espace',
      ),
      PremiumService(
        'Pack Entreprise',
        'assets/clean2.png',
        'Pour bureaux et entreprises',
        'À partir de 8000 DZD',
        4.8,
        'Nettoyage quotidien ou hebdomadaire adapté à vos besoins professionnels',
      ),
      PremiumService(
        'Service Écologique Premium',
        'assets/clean3.png',
        '100% naturel et biodégradable',
        '4500 DZD',
        4.9,
        'Utilisation exclusive de produits écologiques certifiés',
      ),
    ];
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
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
    final screenHeight = MediaQuery.of(context).size.height;
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
                horizontal: isExtraSmallScreen ? 12.0 : isVerySmallScreen ? 15.0 : 20.0,
                vertical: isExtraSmallScreen ? 10.0 : 15.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _headerGradient,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
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
                        width: isExtraSmallScreen ? 40 : isVerySmallScreen ? 45 : 55,
                        height: isExtraSmallScreen ? 40 : isVerySmallScreen ? 45 : 55,
                        decoration: BoxDecoration(
                          color: _white,
                          borderRadius: BorderRadius.circular(isExtraSmallScreen ? 10 : 15),
                          boxShadow: [
                            BoxShadow(
                              color: _primaryBlue.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/logo.png',
                            width: isExtraSmallScreen ? 35 : isVerySmallScreen ? 40 : 50,
                            height: isExtraSmallScreen ? 35 : isVerySmallScreen ? 40 : 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // User info avec badge - version compacte pour petits écrans
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isExtraSmallScreen ? 8.0 : 12.0,
                          vertical: isExtraSmallScreen ? 6.0 : 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: _white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
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
                                    'Bienvenue,',
                                    style: TextStyle(
                                      color: _textLight,
                                      fontSize: isVerySmallScreen ? 10 : 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Racha G.',
                                    style: TextStyle(
                                      color: _textDark,
                                      fontSize: isVerySmallScreen ? 12 : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            if (!isExtraSmallScreen) SizedBox(width: isVerySmallScreen ? 6 : 10),
                            Stack(
                              children: [
                                Container(
                                  width: isExtraSmallScreen ? 32 : 40,
                                  height: isExtraSmallScreen ? 32 : 40,
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
                                    size: isExtraSmallScreen ? 16 : 20,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: _accentCoral,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: _white, width: 1.5),
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

                  SizedBox(height: isExtraSmallScreen ? 12 : 16),

                  // Search bar moderne
                  Container(
                    decoration: BoxDecoration(
                      color: _white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Rechercher un service...',
                              hintStyle: TextStyle(
                                color: _textLight,
                                fontSize: isVerySmallScreen ? 13 : null,
                              ),
                              prefixIcon: Icon(Icons.search,
                                  color: _primaryBlue, size: isVerySmallScreen ? 20 : null),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: isExtraSmallScreen ? 12 : 16,
                                vertical: isExtraSmallScreen ? 12 : 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: isExtraSmallScreen ? 42 : 50,
                          height: isExtraSmallScreen ? 42 : 50,
                          decoration: BoxDecoration(
                            color: _accentTeal,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: isVerySmallScreen ? 20 : null,
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
                padding: EdgeInsets.all(isExtraSmallScreen ? 12 : isVerySmallScreen ? 15 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner slider amélioré
                    SizedBox(
                      height: isExtraSmallScreen ? 150 : isVerySmallScreen ? 170 : 200,
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
                                  margin: EdgeInsets.symmetric(horizontal: isExtraSmallScreen ? 3 : 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(isExtraSmallScreen ? 15 : 20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 15,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(isExtraSmallScreen ? 15 : 20),
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
                                          padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: isExtraSmallScreen ? 8 : 10,
                                                  vertical: isExtraSmallScreen ? 3 : 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _accentCoral,
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Text(
                                                  'LIMITÉ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: isExtraSmallScreen ? 8 : 9,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: isExtraSmallScreen ? 6 : 8),
                                              Text(
                                                _bannerTitles[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isExtraSmallScreen ? 14 : isVerySmallScreen ? 16 : 18,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.3,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: isExtraSmallScreen ? 4 : 6),
                                              Text(
                                                _bannerDescriptions[index],
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.9),
                                                  fontSize: isExtraSmallScreen ? 11 : 12,
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
                          SizedBox(height: isExtraSmallScreen ? 10 : 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _bannerImages.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: _currentPage == index ? 25 : 6,
                                height: 6,
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  color: _currentPage == index ? _primaryBlue : _lightBlue,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 20 : 25),

                    // Section Services avec plus d'options
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
                                  fontSize: isExtraSmallScreen ? 18 : isVerySmallScreen ? 20 : 22,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Choisissez parmi notre large gamme',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 11 : 12,
                                  color: _textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isExtraSmallScreen ? 8 : 10,
                            vertical: isExtraSmallScreen ? 4 : 5,
                          ),
                          decoration: BoxDecoration(
                            color: _lightBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${_services.length}',
                                style: TextStyle(
                                  color: _primaryBlue,
                                  fontSize: isExtraSmallScreen ? 10 : 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: isExtraSmallScreen ? 2 : 4),
                              Icon(Icons.arrow_forward_ios,
                                  color: _primaryBlue,
                                  size: isExtraSmallScreen ? 9 : 10),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isExtraSmallScreen ? 12 : 16),

                    // Grille de services améliorée
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isExtraSmallScreen ? 3 : 4,
                        crossAxisSpacing: isExtraSmallScreen ? 8 : 12,
                        mainAxisSpacing: isExtraSmallScreen ? 8 : 12,
                        childAspectRatio: isExtraSmallScreen ? 0.9 : 0.85,
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

                    SizedBox(height: isExtraSmallScreen ? 20 : 25),

                    // Section Services Premium
                    Container(
                      padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _primaryBlue.withOpacity(0.1),
                            _accentTeal.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(isExtraSmallScreen ? 15 : 18),
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
                                  fontSize: isExtraSmallScreen ? 16 : isVerySmallScreen ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isExtraSmallScreen ? 8 : 10,
                                  vertical: isExtraSmallScreen ? 3 : 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _accentTeal,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'EXCLUSIF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isExtraSmallScreen ? 8 : 9,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Nos services les plus demandés',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 12 : 13,
                              color: _textLight,
                            ),
                          ),
                          SizedBox(height: isExtraSmallScreen ? 12 : 16),
                          SizedBox(
                            height: isExtraSmallScreen ? 200 : isVerySmallScreen ? 220 : 250,
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

                    SizedBox(height: isExtraSmallScreen ? 20 : 25),

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
                                  fontSize: isExtraSmallScreen ? 18 : isVerySmallScreen ? 20 : 22,
                                  fontWeight: FontWeight.bold,
                                  color: _textDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Profitez de promotions exclusives',
                                style: TextStyle(
                                  fontSize: isExtraSmallScreen ? 11 : 12,
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
                              horizontal: isExtraSmallScreen ? 10 : 12,
                              vertical: isExtraSmallScreen ? 5 : 6,
                            ),
                            decoration: BoxDecoration(
                              color: _white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: _lightBlue, width: 1.5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Tout voir',
                                  style: TextStyle(
                                    color: _primaryBlue,
                                    fontSize: isExtraSmallScreen ? 10 : 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: isExtraSmallScreen ? 2 : 4),
                                Icon(Icons.arrow_forward,
                                    color: _primaryBlue,
                                    size: isExtraSmallScreen ? 12 : 14),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isExtraSmallScreen ? 12 : 16),

                    // Slider d'offres horizontal
                    SizedBox(
                      height: isExtraSmallScreen ? 160 : isVerySmallScreen ? 180 : 200,
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

                    SizedBox(height: isExtraSmallScreen ? 20 : 25),

                    // Section Autres Offres
                    Text(
                      'Autres Avantages',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 16 : isVerySmallScreen ? 18 : 20,
                        fontWeight: FontWeight.bold,
                        color: _textDark,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Découvrez tous nos avantages exclusifs',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 11 : 12,
                        color: _textLight,
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 12 : 16),

                    ..._offers.map((offer) => AdditionalOfferCard(
                      offer: offer,
                      isSmallScreen: isSmallScreen,
                      isVerySmallScreen: isVerySmallScreen,
                      isExtraSmallScreen: isExtraSmallScreen,
                    )).toList(),

                    // Section Contact moderne
                    SizedBox(height: isExtraSmallScreen ? 20 : 25),
                    Container(
                      padding: EdgeInsets.all(isExtraSmallScreen ? 16 : 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _primaryBlue,
                            _secondaryBlue,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(isExtraSmallScreen ? 18 : 22),
                        boxShadow: [
                          BoxShadow(
                            color: _primaryBlue.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: isExtraSmallScreen ? 50 : 60,
                            height: isExtraSmallScreen ? 50 : 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.support_agent,
                              size: isExtraSmallScreen ? 24 : 28,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: isExtraSmallScreen ? 12 : 16),
                          Text(
                            'Besoin d\'un service personnalisé?',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 16 : isVerySmallScreen ? 18 : 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isExtraSmallScreen ? 8 : 10),
                          Text(
                            'Notre équipe d\'experts est disponible pour répondre à vos questions.',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 12 : 13,
                              color: Colors.white70,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isExtraSmallScreen ? 16 : 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: _primaryBlue,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isExtraSmallScreen ? 10 : 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 3,
                                  ),
                                  child: Text(
                                    'Appeler maintenant',
                                    style: TextStyle(
                                      fontSize: isExtraSmallScreen ? 12 : 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: isExtraSmallScreen ? 8 : 12),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.white),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isExtraSmallScreen ? 10 : 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Envoyer un message',
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

                    SizedBox(height: isExtraSmallScreen ? 25 : 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar améliorée
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
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
              fontSize: isExtraSmallScreen ? 9 : 10,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: isExtraSmallScreen ? 9 : 10,
            ),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    size: _selectedIndex == 0
                        ? (isExtraSmallScreen ? 20 : 22)
                        : (isExtraSmallScreen ? 18 : 20),
                  ),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.local_offer,
                    size: _selectedIndex == 1
                        ? (isExtraSmallScreen ? 20 : 22)
                        : (isExtraSmallScreen ? 18 : 20),
                  ),
                ),
                label: 'Offres',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.cleaning_services,
                    size: _selectedIndex == 2
                        ? (isExtraSmallScreen ? 20 : 22)
                        : (isExtraSmallScreen ? 18 : 20),
                  ),
                ),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 3 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: _selectedIndex == 3
                        ? (isExtraSmallScreen ? 20 : 22)
                        : (isExtraSmallScreen ? 18 : 20),
                  ),
                ),
                label: 'À Propos',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 5 : 6),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 4 ? _lightBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: _selectedIndex == 4
                        ? (isExtraSmallScreen ? 20 : 22)
                        : (isExtraSmallScreen ? 18 : 20),
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
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isExtraSmallScreen ? 40 : isVerySmallScreen ? 45 : 50,
              height: isExtraSmallScreen ? 40 : isVerySmallScreen ? 45 : 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    service.color.withOpacity(0.9),
                    service.color.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: service.color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                service.icon,
                color: Colors.white,
                size: isExtraSmallScreen ? 20 : isVerySmallScreen ? 22 : 24,
              ),
            ),
            SizedBox(height: isExtraSmallScreen ? 6 : 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Text(
                    service.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isExtraSmallScreen ? 9 : isVerySmallScreen ? 10 : 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3748),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isExtraSmallScreen ? 3 : 4),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isExtraSmallScreen ? 4 : 5,
                      vertical: isExtraSmallScreen ? 1 : 2,
                    ),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      service.tag,
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 7 : 8,
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
  final String details;

  PremiumService(this.title, this.image, this.description, this.price, this.rating, this.details);
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
      width: isExtraSmallScreen ? 240 : isVerySmallScreen ? 260 : 280,
      margin: EdgeInsets.only(right: isExtraSmallScreen ? 12 : 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image avec overlay
          Container(
            height: isExtraSmallScreen ? 90 : isVerySmallScreen ? 100 : 110,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage('assets/clean1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
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
                padding: EdgeInsets.all(isExtraSmallScreen ? 10 : 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 6 : 8,
                        vertical: isExtraSmallScreen ? 2 : 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD166),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'PREMIUM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isExtraSmallScreen ? 8 : 9,
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
            padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 14),
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
                          fontSize: isExtraSmallScreen ? 14 : 15,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 6 : 8,
                        vertical: isExtraSmallScreen ? 2 : 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4ECDC4).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        service.price,
                        style: TextStyle(
                          fontSize: isExtraSmallScreen ? 10 : 11,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4ECDC4),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isExtraSmallScreen ? 3 : 4),
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 11 : 12,
                    color: const Color(0xFF718096),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isExtraSmallScreen ? 6 : 8),
                Row(
                  children: [
                    Icon(Icons.star, color: const Color(0xFFFFD166), size: 14),
                    SizedBox(width: 4),
                    Text(
                      '${service.rating}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(120 avis)',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 10 : 11,
                        color: const Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isExtraSmallScreen ? 10 : 12),
                SizedBox(
                  height: isExtraSmallScreen ? 36 : 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reservation');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C768C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Réserver',
                      style: TextStyle(
                        fontSize: isExtraSmallScreen ? 12 : 13,
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
      width: isExtraSmallScreen ? 240 : isVerySmallScreen ? 260 : 280,
      margin: EdgeInsets.only(right: isExtraSmallScreen ? 12 : 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            offer.color.withOpacity(0.9),
            offer.color.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: offer.color.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isExtraSmallScreen ? 6 : 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    offer.icon,
                    color: Colors.white,
                    size: isExtraSmallScreen ? 18 : 20,
                  ),
                ),
                SizedBox(height: isExtraSmallScreen ? 8 : 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isExtraSmallScreen ? 10 : 12,
                    vertical: isExtraSmallScreen ? 4 : 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    offer.discount,
                    style: TextStyle(
                      color: offer.color,
                      fontWeight: FontWeight.bold,
                      fontSize: isExtraSmallScreen ? 12 : 13,
                    ),
                  ),
                ),
                SizedBox(height: isExtraSmallScreen ? 8 : 9),
                Text(
                  offer.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isExtraSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: isExtraSmallScreen ? 4 : 6),
                Text(
                  offer.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isExtraSmallScreen ? 11 : 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: isExtraSmallScreen ? 10 : 10),
            SizedBox(
              height: isExtraSmallScreen ? 36 : 40,
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Profiter',
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 12 : 13,
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
      margin: EdgeInsets.only(bottom: isExtraSmallScreen ? 10 : 12),
      padding: EdgeInsets.all(isExtraSmallScreen ? 10 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(isExtraSmallScreen ? 8 : 10),
            decoration: BoxDecoration(
              color: offer.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              offer.icon,
              color: offer.color,
              size: isExtraSmallScreen ? 18 : 20,
            ),
          ),
          SizedBox(width: isExtraSmallScreen ? 10 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 13 : 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  offer.description,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 11 : 12,
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
              horizontal: isExtraSmallScreen ? 8 : 10,
              vertical: isExtraSmallScreen ? 4 : 5,
            ),
            decoration: BoxDecoration(
              color: offer.color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: offer.color.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              offer.discount,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isExtraSmallScreen ? 10 : 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
