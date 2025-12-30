import 'package:flutter/material.dart';
import 'package:ssrcln_app/core/constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Professional Cleaning Services',
      description: 'Book certified cleaning professionals for your home, office, or shop with just a few taps.',
      icon: Icons.cleaning_services,
      iconColor: AppColors.primaryBlue,
      backgroundColor: Colors.white,
      textColor: AppColors.textDark,
      imagePath: 'assets/onboarding/clean1.png',
    ),
    OnboardingItem(
      title: 'Easy Booking & Flexible Scheduling',
      description: 'Schedule cleaning services at your convenience. Choose date, time, and service type easily.',
      icon: Icons.calendar_today,
      iconColor: AppColors.accentYellow,
      backgroundColor: AppColors.lightBlue,
      textColor: AppColors.textDark,
      imagePath: 'assets/onboarding/clean2.png',
    ),
    OnboardingItem(
      title: 'Track & Manage Your Bookings',
      description: 'Real-time tracking of your cleaning services. Manage bookings and get notifications.',
      icon: Icons.track_changes,
      iconColor: AppColors.successGreen,
      backgroundColor: Colors.white,
      textColor: AppColors.textDark,
      imagePath: 'assets/onboarding/clean3.png',
    ),
    OnboardingItem(
      title: 'Special Offers & Discounts',
      description: 'Get exclusive deals on regular cleaning packages and seasonal discounts.',
      icon: Icons.local_offer,
      iconColor: AppColors.errorRed,
      backgroundColor: AppColors.lightYellow,
      textColor: AppColors.textDark,
      imagePath: 'assets/onboarding/clean4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar with Skip Button
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.clean_hands,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'SSR CLEAN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),

                // Skip Button
                if (_currentPage < _onboardingItems.length - 1)
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingItems.length,
              itemBuilder: (context, index) {
                return _buildPage(_onboardingItems[index]);
              },
            ),
          ),

          // Bottom Navigation
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryLight,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Progress Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingItems.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 30 : 10,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primaryBlue
                            : AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Navigation Buttons
                Row(
                  children: [
                    // Previous Button
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primaryBlue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 18,
                                color: AppColors.primaryBlue,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Previous',
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (_currentPage > 0) const SizedBox(width: 16),

                    // Next/Get Started Button
                    Expanded(
                      flex: _currentPage > 0 ? 1 : 2,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage < _onboardingItems.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage < _onboardingItems.length - 1
                                  ? 'Next'
                                  : 'Get Started',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              _currentPage < _onboardingItems.length - 1
                                  ? Icons.arrow_forward
                                  : Icons.check,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingItem item) {
    return Container(
      color: item.backgroundColor,
      child: Row(
        children: [
          // Left Side - Image
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: item.iconColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  // Background Pattern
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            item.iconColor.withOpacity(0.05),
                            item.iconColor.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Image
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon Container
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: item.iconColor.withOpacity(0.2),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                item.icon,
                                size: 50,
                                color: item.iconColor,
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Image
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: item.imagePath.isNotEmpty
                                  ? Image.asset(
                                item.imagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: item.iconColor.withOpacity(0.2),
                                    child: Center(
                                      child: Icon(
                                        item.icon,
                                        size: 60,
                                        color: item.iconColor,
                                      ),
                                    ),
                                  );
                                },
                              )
                                  : Container(
                                color: item.iconColor.withOpacity(0.2),
                                child: Center(
                                  child: Icon(
                                    item.icon,
                                    size: 60,
                                    color: item.iconColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Side - Content
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step Number
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: item.iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Step ${_onboardingItems.indexOf(item) + 1}',
                      style: TextStyle(
                        color: item.iconColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Title
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: item.textColor,
                      fontFamily: 'Poppins',
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: item.textColor.withOpacity(0.8),
                      fontFamily: 'Poppins',
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Features List
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFeature('Certified Professionals', item.iconColor),
                      _buildFeature('Eco-Friendly Products', item.iconColor),
                      _buildFeature('Flexible Scheduling', item.iconColor),
                      _buildFeature('Real-Time Tracking', item.iconColor),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Stats
                  if (_onboardingItems.indexOf(item) == 0)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.primaryBlue.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStat('500+', 'Happy Customers'),
                          _buildStat('4.9', 'Rating'),
                          _buildStat('24/7', 'Support'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: 14,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textDark,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.darkGray,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
    required this.imagePath,
  });
}