import 'package:flutter/material.dart';
import 'package:ssrcln_app/core/constants/colors.dart';

class AppDescription extends StatelessWidget {
  const AppDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        title: const Text('About CleanPro'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo and Name
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: AppColors.blueGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.clean_hands,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CleanPro',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Professional Cleaning Services',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // App Description
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.info,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'About Our App',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'CleanPro is your one-stop solution for all cleaning needs. Whether it\'s your home, office, shop, or any commercial space, we provide professional cleaning services with certified staff and eco-friendly products.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                      fontFamily: 'Poppins',
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Our mission is to make cleaning services accessible, reliable, and affordable for everyone. With our easy-to-use app, you can book services in minutes, track your bookings, and manage everything from your smartphone.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                      fontFamily: 'Poppins',
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Features
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                FeatureCard(
                  icon: Icons.bolt,
                  title: 'Quick Booking',
                  description: 'Book services in under 2 minutes',
                  color: AppColors.primaryBlue,
                ),
                FeatureCard(
                  icon: Icons.verified,
                  title: 'Verified Staff',
                  description: 'Background checked professionals',
                  color: AppColors.accentYellow,
                ),
                FeatureCard(
                  icon: Icons.eco,
                  title: 'Eco-Friendly',
                  description: 'Environmentally safe products',
                  color: AppColors.successGreen,
                ),
                FeatureCard(
                  icon: Icons.security,
                  title: 'Safe & Secure',
                  description: 'Your safety is our priority',
                  color: AppColors.errorRed,
                ),
                FeatureCard(
                  icon: Icons.price_check,
                  title: 'Best Price',
                  description: 'Guaranteed lowest prices',
                  color: AppColors.primaryBlue,
                ),
                FeatureCard(
                  icon: Icons.support_agent,
                  title: '24/7 Support',
                  description: 'Always here to help you',
                  color: AppColors.darkYellow,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Why Choose Us
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose CleanPro?',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 20),

                  const WhyChooseItem(
                    text: '500+ satisfied customers',
                  ),
                  const WhyChooseItem(
                    text: '24/7 customer support',
                  ),
                  const WhyChooseItem(
                    text: 'Trained & certified staff',
                  ),
                  const WhyChooseItem(
                    text: 'Eco-friendly products',
                  ),
                  const WhyChooseItem(
                    text: 'Flexible scheduling',
                  ),
                  const WhyChooseItem(
                    text: 'Affordable pricing',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Contact Info
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 20),

                  ContactItem(
                    icon: Icons.email,
                    title: 'Email',
                    value: 'support@cleanpro.com',
                    color: AppColors.primaryBlue,
                  ),
                  ContactItem(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: '+1 (555) 123-4567',
                    color: AppColors.accentYellow,
                  ),
                  ContactItem(
                    icon: Icons.location_on,
                    title: 'Address',
                    value: '123 Clean Street, City, Country',
                    color: AppColors.successGreen,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // App Version
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.darkGray,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkGray,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class WhyChooseItem extends StatelessWidget {
  final String text;

  const WhyChooseItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                    fontFamily: 'Poppins',
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