import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  final List<SpecialOffer> _specialOffers = const [
    SpecialOffer(
      'Première Visite',
      '30% DE RÉDUCTION',
      'Profitez de 30% de réduction sur votre première commande de nettoyage',
      'assets/offer1.jpg',
      'Valide jusqu\'au 31/12/2024',
    ),
    SpecialOffer(
      'Abonnement Mensuel',
      '20% DE RÉDUCTION',
      'Abonnez-vous et économisez 20% chaque mois sur nos services réguliers',
      'assets/offer2.jpg',
      'Engagement minimum 3 mois',
    ),
    SpecialOffer(
      'Spécial Week-end',
      '15% DE RÉDUCTION',
      'Réservez un service le week-end et bénéficiez de 15% de réduction',
      'assets/offer3.jpg',
      'Valable du vendredi au dimanche',
    ),
    SpecialOffer(
      'Parrainage',
      '€20 DE BONUS',
      'Recevez 200 dzd pour chaque ami que vous parrainez et qui commande un service',
      'assets/offer3.jpg',
      'Sans limite de parrainage',
    ),
    SpecialOffer(
      'Pack Familial',
      '25% DE RÉDUCTION',
      'Réduction spéciale pour les familles de 4 personnes ou plus',
      'assets/offer4.jpg',
      'Valable sur les services réguliers',
    ),
    SpecialOffer(
      'Nettoyage de Printemps',
      '€50 DE RÉDUCTION',
      'Profitez de 500 dzd de réduction sur notre nettoyage de printemps complet',
      'assets/offer5.jpg',
      'Offre limitée, valable en mars et avril',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1C768C)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nos Offres',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Offres Spéciales et Promotions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Profitez de nos meilleures offres et économisez sur nos services',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),

            const SizedBox(height: 30),

            ..._specialOffers.map((offer) => SpecialOfferCard(offer: offer)).toList(),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF21BBC7),
                    Color(0xFF1C768C),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.notifications_active,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ne manquez aucune offre!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Activez les notifications pour être informé de nos nouvelles offres et promotions exclusives',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFBBF0F4),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Notifications activées!'),
                          backgroundColor: Color(0xFF21BBC7),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1C768C),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Activer les Notifications',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class SpecialOffer {
  final String title;
  final String discount;
  final String description;
  final String imagePath;
  final String validity;

  const SpecialOffer(
      this.title,
      this.discount,
      this.description,
      this.imagePath,
      this.validity
      );
}

class SpecialOfferCard extends StatelessWidget {
  final SpecialOffer offer;

  const SpecialOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFBBF0F4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color(0xFFF8FDFE),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0), // Changed from 20 to 0
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF21BBC7),
                      Color(0xFF1C768C),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Fallback background color if image fails to load
                    Container(
                      color: const Color(0xFF1C768C),
                    ),
                    // Actual image with fade effect
                    ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(
                        offer.imagePath,
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF1C768C),
                            child: Center(
                              child: Icon(
                                Icons.local_offer,
                                size: 60,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Discount badge on top of image
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          offer.discount,
                          style: const TextStyle(
                            color: Color(0xFF1C768C),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Offer title on image
                    Positioned(
                      bottom: 15,
                      left: 15,
                      right: 15,
                      child: Text(
                        offer.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Validity indicator
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 18,
                        color: Color(0xFF21BBC7),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        offer.validity,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF21BBC7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Description
                  Text(
                    offer.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF666666),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Use Offer Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/reservation',
                          arguments: {
                            'title': offer.title,

                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF21BBC7),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer, size: 20),
                          SizedBox(width: 10),
                          Text(
                            'Utiliser cette Offre',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
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