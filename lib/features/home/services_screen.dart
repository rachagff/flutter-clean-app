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
          'Nos Services',
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
              'Services Professionnels de Nettoyage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Choisissez parmi notre large gamme de services professionnels',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),

            const SizedBox(height: 30),

            // Use ListView.builder instead of spread operator
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                return ServiceDetailCard(service: _services[index]);
              },
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF21BBC7),
                    Color(0xFF1C768C),
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.support_agent,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Besoin d\'un service personnalisé?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Contactez-nous pour une consultation gratuite',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFBBF0F4),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Contact action
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Nous Contacter'),
                        ),
                      ],
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

  const ServiceDetailCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Service image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(service.image),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        service.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(service.icon, color: const Color(0xFF1C768C), size: 28),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C768C),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            service.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Divider(color: Color(0xFFBBF0F4)),

                const SizedBox(height: 15),

                const Text(
                  'Services Inclus:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C768C),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  service.features,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BBC7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF21BBC7)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFF1C768C),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.9/5 (120 avis)',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1C768C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
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
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Réserver Maintenant',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
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