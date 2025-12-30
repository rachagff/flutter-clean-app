import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
          'À Propos',
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
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF21BBC7),
                      Color(0xFF1C768C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF21BBC7).withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(57),
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 110,
                    height: 110,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'SSR CLEAN',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              'Votre Partenaire de Nettoyage Confiance',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF21BBC7),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            const Text(
              'Notre Histoire',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Fondée en 2015, SSR CLEAN est née d\'une simple idée : offrir des services de nettoyage professionnels, fiables et abordables à tous les foyers. Aujourd\'hui, nous sommes fiers de servir des milliers de clients satisfaits avec notre équipe de professionnels certifiés.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Notre Mission',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Fournir des services de nettoyage exceptionnels qui dépassent les attentes de nos clients, tout en utilisant des produits écologiques et en créant un environnement de travail positif pour notre équipe.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Nos Valeurs',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            ...[
              {
                'title': 'Qualité',
                'description': 'Nous nous engageons à fournir un service de la plus haute qualité à chaque visite.'
              },
              {
                'title': 'Fiabilité',
                'description': 'Notre équipe arrive toujours à l\'heure et fait le travail correctement.'
              },
              {
                'title': 'Écologie',
                'description': 'Nous utilisons exclusivement des produits de nettoyage écologiques et sûrs.'
              },
              {
                'title': 'Transparence',
                'description': 'Pas de frais cachés, pas de surprises - juste un excellent service.'
              },
            ].map((value) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFF21BBC7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C768C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          value['description']!,
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
            )).toList(),

            const SizedBox(height: 40),

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
              child: const Column(
                children: [
                  Icon(
                    Icons.phone,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Besoin d\'aide?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Contactez-nous au +213 002555888',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBF0F4),
                    ),
                    textAlign: TextAlign.center,
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