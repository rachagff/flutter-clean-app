import 'package:flutter/material.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({super.key});

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
          'Conditions d\'Utilisation',
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
            // Header Section
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
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF21BBC7).withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.description,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Conditions Générales',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Dernière mise à jour : 01/01/2024',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Terms Sections
            _buildTermSection(
              icon: Icons.gavel,
              title: '1. Acceptation des Conditions',
              content:
              'En utilisant l\'application CleanService, vous acceptez pleinement et sans réserve les présentes conditions d\'utilisation. Si vous n\'acceptez pas ces conditions, veuillez ne pas utiliser notre application.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.how_to_reg,
              title: '2. Création de Compte',
              content:
              'Pour utiliser nos services, vous devez créer un compte avec des informations exactes et complètes. Vous êtes responsable de la confidentialité de votre mot de passe et de toutes les activités sur votre compte.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.shopping_cart,
              title: '3. Réservations et Paiements',
              content:
              'Les réservations sont soumises à disponibilité. Les paiements doivent être effectués via les méthodes acceptées. Annulation : 24h avant le service pour remboursement complet. Nos prix incluent la TVA applicable.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.assignment,
              title: '4. Responsabilités',
              content:
              'Nous nous efforçons de fournir des services de qualité. Cependant, nous ne sommes pas responsables des dommages causés par des circonstances imprévues ou des objets de valeur non déclarés avant le service.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.security,
              title: '5. Confidentialité',
              content:
              'Nous respectons votre vie privée. Vos données personnelles sont protégées conformément à notre Politique de Confidentialité. Nous ne partageons pas vos informations avec des tiers sans votre consentement.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.cancel,
              title: '6. Limitation de Responsabilité',
              content:
              'CleanService ne saurait être tenu responsable des dommages indirects, consécutifs ou spéciaux résultant de l\'utilisation ou de l\'impossibilité d\'utiliser l\'application.',
            ),

            const SizedBox(height: 20),

            _buildTermSection(
              icon: Icons.edit,
              title: '7. Modifications des Conditions',
              content:
              'Nous nous réservons le droit de modifier ces conditions à tout moment. Les utilisateurs seront informés des modifications importantes. L\'utilisation continue de l\'application vaut acceptation des nouvelles conditions.',
            ),

            const SizedBox(height: 20),

            // Legal Notice
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFBBF0F4).withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: const Color(0xFF1C768C),
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Information Légale',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C768C),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'CleanService SARL\nCapital social : 50 000 DH\nRCS Casablanca : 123456789\nSiège social : 123 Avenue Hassan II, Casablanca\nEmail : legal@cleanservice.ma\nTéléphone : +212 5 XX XX XX XX',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1C768C),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Acceptance Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Acceptation des Conditions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'En cochant la case ci-dessous, vous confirmez avoir lu, compris et accepté les Conditions Générales d\'Utilisation de l\'application CleanService.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1C768C),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF21BBC7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFF21BBC7),
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'J\'accepte les Conditions d\'Utilisation',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1C768C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Contact Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF21BBC7).withOpacity(0.1),
                    const Color(0xFF1C768C).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.support_agent,
                    color: Color(0xFF1C768C),
                    size: 40,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Questions sur nos conditions ?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Notre équipe est là pour vous aider',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1C768C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContactButton(
                        icon: Icons.email,
                        label: 'gmail',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      _buildContactButton(
                        icon: Icons.phone,
                        label: 'Appeler',
                        onPressed: () {},
                      ),

                    ],
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

  Widget _buildTermSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF21BBC7).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF1C768C),
                size: 24,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF1C768C).withOpacity(0.8),
                      height: 1.5,
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

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF21BBC7)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF21BBC7).withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              icon,
              color: const Color(0xFF1C768C),
              size: 26,
            ),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1C768C),
          ),
        ),
      ],
    );
  }
}