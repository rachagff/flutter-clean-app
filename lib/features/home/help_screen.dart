import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
          'Centre d\'Aide',
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
              'Comment pouvons-nous vous aider?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Trouvez des réponses à vos questions fréquentes',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),

            const SizedBox(height: 30),

            ...[
              {
                'question': 'Comment réserver un service?',
                'answer': 'Pour réserver un service, sélectionnez le service souhaité, choisissez une date et une heure, puis procédez au paiement.'
              },
              {
                'question': 'Puis-je annuler ou modifier une réservation?',
                'answer': 'Oui, vous pouvez annuler ou modifier votre réservation jusqu\'à 24 heures avant le service sans frais.'
              },
              {
                'question': 'Quels sont les moyens de paiement acceptés?',
                'answer': 'Nous acceptons les cartes de crédit/débit, les virements bancaires et les paiements en espèces.'
              },
              {
                'question': 'Quels produits de nettoyage utilisez-vous?',
                'answer': 'Nous utilisons exclusivement des produits de nettoyage écologiques et certifiés.'
              },
              {
                'question': 'Comment puis-je contacter le service client?',
                'answer': 'Vous pouvez nous contacter par téléphone au 01 23 45 67 89 ou par email à support@cleanhomepro.com'
              },
            ].map((faq) => ExpansionTile(
              title: Text(
                faq['question']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C768C),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    faq['answer']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            )).toList(),

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
              child: Column(
                children: [
                  const Icon(
                    Icons.chat,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Besoin d\'aide supplémentaire?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Notre équipe de support est disponible 7j/7 pour répondre à vos questions',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFBBF0F4),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1C768C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.phone, size: 18),
                            SizedBox(width: 8),
                            Text('Appeler'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1C768C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.email, size: 18),
                            SizedBox(width: 8),
                            Text('Email'),
                          ],
                        ),
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
}