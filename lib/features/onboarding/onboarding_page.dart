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
  double _pageOffset = 0;

  final List<OnboardingSlide> _slides = [
    OnboardingSlide(
      title: 'Professional Cleaning',
      subtitle: 'Certified experts for your space',
      description: 'Book professional cleaning services with certified experts .',
      color: AppColors.primaryBlue,
      icon: Icons.cleaning_services, // Added missing icon
      accentColor: Color(0xFFE6F2FF),
      imagePath: 'assets/onboarding/clean4.png',
    ),
    OnboardingSlide(
      title: 'Easy Scheduling',
      subtitle: 'Book in minutes',
      description: 'Choose date, time, and service type with our intuitive booking system.',
      color: AppColors.accentYellow,
      icon: Icons.calendar_today,
      accentColor: Color(0xFFFFF8E1),
      imagePath: 'assets/onboarding/clean2.png',
    ),
    OnboardingSlide(
      title: 'Real-Time Tracking',
      subtitle: 'Stay informed',
      description: 'Track your cleaning service in real-time with live updates and notifications.',
      color: AppColors.successGreen,
      icon: Icons.track_changes,
      accentColor: Color(0xFFE8F5E9),
      imagePath: 'assets/onboarding/clean3.png',
    ),
    OnboardingSlide(
      title: 'Special Offers',
      subtitle: 'Save more',
      description: 'Get exclusive discounts and packages for regular customers.',
      color: AppColors.errorRed,
      icon: Icons.local_offer,
      accentColor: Color(0xFFFFEBEE),
      imagePath: 'assets/onboarding/clean1.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: AppColors.blueGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.clean_hands,
                            size: 20,
                            color: Colors.white,
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
                  if (_currentPage < _slides.length - 1)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  final parallax = (_pageOffset - index).abs() * 50;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated Image/Icon Container
                        Transform.translate(
                          offset: Offset(0, parallax * 0.5),
                          child: Container(
                            width: screenWidth * 0.6,
                            height: screenWidth * 0.6,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  slide.accentColor,
                                  slide.accentColor.withOpacity(0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(screenWidth * 0.3),
                              boxShadow: [
                                BoxShadow(
                                  color: slide.color.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: slide.imagePath.isNotEmpty
                                  ? Container(
                                width: screenWidth * 0.5,
                                height: screenWidth * 0.5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(slide.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                                  : Icon(
                                slide.icon,
                                size: screenWidth * 0.2,
                                color: slide.color,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.06),

                        // Step Indicator
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: slide.accentColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'STEP ${index + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: slide.color,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Title with Fade Animation
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _currentPage == index ? 1 : 0.5,
                          child: Column(
                            children: [
                              Text(
                                slide.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark,
                                  fontFamily: 'Poppins',
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                slide.subtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: slide.color,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Description
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                          ),
                          child: Text(
                            slide.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.darkGray,
                              fontFamily: 'Poppins',
                              height: 1.6,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Feature Dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFeatureDot('Expert', slide.color),
                            _buildFeatureDot('Eco-Friendly', slide.color),
                            _buildFeatureDot('Flexible', slide.color),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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
                  // Progress Indicator
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.only(
                        right: (1 - (_currentPage / (_slides.length - 1))) *
                            MediaQuery.of(context).size.width *
                            0.84,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.blueGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Navigation Row
                  Row(
                    children: [
                      // Page Indicators
                      Row(
                        children: List.generate(
                          _slides.length,
                              (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? AppColors.primaryBlue
                                    : AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Next Button
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.blueGradient,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryBlue.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _slides.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                _currentPage < _slides.length - 1
                                    ? 'Continue'
                                    : 'Get Started',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                _currentPage < _slides.length - 1
                                    ? Icons.arrow_forward_rounded
                                    : Icons.check_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
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
      ),
    );
  }

  Widget _buildFeatureDot(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class OnboardingSlide {
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final IconData icon;
  final Color accentColor;
  final String imagePath;

  OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.icon,
    required this.accentColor,
    required this.imagePath,
  });
}