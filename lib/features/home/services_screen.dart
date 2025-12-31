import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<ServiceDetail> _services = const [
    ServiceDetail(
      'Nettoyage de Maison',
      'assets/offer1.jpg',
      'Nettoyage complet de votre maison, pièce par pièce',
      '• Nettoyage des sols\n• Dépoussiérage\n• Nettoyage des sanitaires\n• Nettoyage des surfaces\n• Lavage des fenêtres\n• Vidage des poubelles',
      'À partir de 3500 DZD',
      Icons.cleaning_services,
    ),
    ServiceDetail(
      'Nettoyage Profond',
      'assets/clean2.png',
      'Nettoyage intensif pour une propreté exceptionnelle',
      '• Nettoyage des recoins\n• Décrassage des surfaces\n• Nettoyage des appareils\n• Désinfection complète\n• Traitement anti-bactérien\n• Nettoyage des murs',
      'À partir de 8000 DZD',
      Icons.clean_hands,
    ),
    ServiceDetail(
      'Nettoyage de Bureau',
      'assets/clean3.png',
      'Service professionnel pour vos espaces de travail',
      '• Nettoyage des bureaux\n• Vidage des poubelles\n• Nettoyage des salles de réunion\n• Entretien des espaces communs\n• Désinfection des claviers\n• Nettoyage des imprimantes',
      'À partir de 500 DZD/heure',
      Icons.business,
    ),
    ServiceDetail(
      'Nettoyage de Tapis',
      'assets/clean4.png',
      'Service spécialisé pour vos tapis et moquettes',
      '• Détachage professionnel\n• Désinfection complète\n• Séchage rapide\n• Traitement anti-acariens\n• Désodorisation\n• Protection anti-taches',
      'À partir de 1000 DZD/m²',
      Icons.carpenter,
    ),
    ServiceDetail(
      'Nettoyage de Vitres',
      'assets/offer5.jpg',
      'Des vitres étincelantes intérieures et extérieures',
      '• Nettoyage intérieur\n• Nettoyage extérieur\n• Détachage des cadres\n• Finition sans traces\n• Traitement anti-pluie\n• Nettoyage des stores',
      'À partir de 2500 DZD',
      Icons.window,
    ),
    ServiceDetail(
      'Service de Blanchisserie',
      'assets/clean2.png',
      'Lavage, repassage et pliage professionnels',
      '• Lavage professionnel\n• Repassage soigné\n• Pliage parfait\n• Service de livraison\n• Traitement des taches\n• Désinfection complète',
      'À partir de 1500 DZD/kg',
      Icons.local_laundry_service,
    ),
    ServiceDetail(
      'Nettoyage Post-Construction',
      'assets/clean4.png',
      'Nettoyage après travaux de construction/rénovation',
      '• Enlèvement des débris\n• Nettoyage des poussières\n• Lavage des sols\n• Nettoyage des fenêtres\n• Désinfection des surfaces\n• Élimination des résidus',
      'À partir de 12000 DZD',
      Icons.construction,
    ),
    ServiceDetail(
      'Nettoyage Écologique',
      'assets/clean3.png',
      'Nettoyage avec produits 100% naturels et biodégradables',
      '• Produits écologiques\n• Sans produits chimiques\n• Sécurité pour enfants\n• Sans allergènes\n• Respect de l\'environnement\n• Certifié bio',
      'À partir de 4000 DZD',
      Icons.eco,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isVerySmallScreen = screenWidth < 320;
    final isExtraSmallScreen = screenWidth < 300;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, 
              color: const Color(0xFF1C768C),
              size: isExtraSmallScreen ? 22 : 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Nos Services',
          style: TextStyle(
            color: const Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
            fontSize: isExtraSmallScreen ? 18 : isVerySmallScreen ? 20 : 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isExtraSmallScreen ? 12 : isVerySmallScreen ? 16 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Services Professionnels de Nettoyage',
              style: TextStyle(
                fontSize: isExtraSmallScreen ? 18 : isVerySmallScreen ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C768C),
              ),
            ),

            SizedBox(height: isExtraSmallScreen ? 8 : 10),

            Text(
              'Choisissez parmi notre large gamme de services professionnels',
              style: TextStyle(
                fontSize: isExtraSmallScreen ? 13 : isVerySmallScreen ? 14 : 16,
                color: const Color(0xFF666666),
              ),
            ),

            SizedBox(height: isExtraSmallScreen ? 20 : 30),

            // Use ListView.builder instead of spread operator
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                return ServiceDetailCard(
                  service: _services[index],
                  isSmallScreen: isSmallScreen,
                  isVerySmallScreen: isVerySmallScreen,
                  isExtraSmallScreen: isExtraSmallScreen,
                );
              },
            ),

            SizedBox(height: isExtraSmallScreen ? 20 : 30),

            Container(
              padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF21BBC7),
                    Color(0xFF1C768C),
                  ],
                ),
                borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: isExtraSmallScreen ? 30 : 36,
                    color: Colors.white,
                  ),
                  SizedBox(width: isExtraSmallScreen ? 12 : 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Besoin d\'un service personnalisé?',
                          style: TextStyle(
                            fontSize: isExtraSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: isExtraSmallScreen ? 4 : 6),
                        Text(
                          'Contactez-nous pour une consultation gratuite',
                          style: TextStyle(
                            fontSize: isExtraSmallScreen ? 12 : 13,
                            color: const Color(0xFFBBF0F4),
                          ),
                        ),
                        SizedBox(height: isExtraSmallScreen ? 8 : 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nous vous contacterons bientôt!'),
                                  backgroundColor: Color(0xFF21BBC7),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1C768C),
                              padding: EdgeInsets.symmetric(
                                vertical: isExtraSmallScreen ? 10 : 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Nous Contacter',
                              style: TextStyle(
                                fontSize: isExtraSmallScreen ? 12 : 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isExtraSmallScreen ? 20 : 30),
          ],
        ),
      ),
    );
  }
}

class ServiceDetail {
  final String title;
  final String image;
  final String description;
  final String features;
  final String price;
  final IconData icon;

  const ServiceDetail(this.title, this.image, this.description, this.features, this.price, this.icon);
}

class ServiceDetailCard extends StatelessWidget {
  final ServiceDetail service;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isExtraSmallScreen;

  const ServiceDetailCard({
    super.key,
    required this.service,
    required this.isSmallScreen,
    required this.isVerySmallScreen,
    required this.isExtraSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isExtraSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isExtraSmallScreen ? 12 : 15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Service image
          Container(
            height: isExtraSmallScreen ? 140 : isVerySmallScreen ? 160 : 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isExtraSmallScreen ? 12 : 15),
                topRight: Radius.circular(isExtraSmallScreen ? 12 : 15),
              ),
              image: DecorationImage(
                image: AssetImage(service.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isExtraSmallScreen ? 12 : 15),
                  topRight: Radius.circular(isExtraSmallScreen ? 12 : 15),
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
                padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 8 : 10,
                        vertical: isExtraSmallScreen ? 4 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        service.price,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isExtraSmallScreen ? 11 : 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(isExtraSmallScreen ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(isExtraSmallScreen ? 6 : 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        service.icon,
                        color: const Color(0xFF1C768C),
                        size: isExtraSmallScreen ? 20 : 24,
                      ),
                    ),
                    SizedBox(width: isExtraSmallScreen ? 10 : 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title,
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 16 : 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C768C),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: isExtraSmallScreen ? 4 : 6),
                          Text(
                            service.description,
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 12 : 13,
                              color: const Color(0xFF666666),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isExtraSmallScreen ? 12 : 16),

                Divider(color: const Color(0xFFBBF0F4), thickness: 1),

                SizedBox(height: isExtraSmallScreen ? 10 : 12),

                Text(
                  'Services Inclus:',
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 15 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1C768C),
                  ),
                ),

                SizedBox(height: isExtraSmallScreen ? 6 : 8),

                Text(
                  service.features,
                  style: TextStyle(
                    fontSize: isExtraSmallScreen ? 12 : 13,
                    color: const Color(0xFF666666),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isExtraSmallScreen ? 12 : 16),

                Column(
                  children: [
                    // Rating container - full width on small screens
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: isExtraSmallScreen ? 10 : 12,
                        vertical: isExtraSmallScreen ? 8 : 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF21BBC7)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: const Color(0xFF1C768C),
                            size: isExtraSmallScreen ? 16 : 18,
                          ),
                          SizedBox(width: isExtraSmallScreen ? 6 : 8),
                          Text(
                            '4.9/5 (120 avis)',
                            style: TextStyle(
                              fontSize: isExtraSmallScreen ? 12 : 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1C768C),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 10 : 12),

                    // Reserve button - full width
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/reservation',
                            arguments: {
                              'title': service.title,
                              'price': service.price,
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21BBC7),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: isExtraSmallScreen ? 12 : 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                        child: Text(
                          'Réserver Maintenant',
                          style: TextStyle(
                            fontSize: isExtraSmallScreen ? 13 : 14,
                            fontWeight: FontWeight.w600,
                          ),
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
    );
  }
}
