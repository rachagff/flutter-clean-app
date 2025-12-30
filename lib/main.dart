import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssrcln_app/core/constants/colors.dart'; // Make sure this is imported

import 'package:ssrcln_app/features/onboarding/splash_page.dart';
import 'package:ssrcln_app/features/onboarding/onboarding_screen.dart';
import 'package:ssrcln_app/features/auth/login_screen.dart';
import 'package:ssrcln_app/features/auth/signup_screen.dart';
import 'package:ssrcln_app/features/home/home_screen.dart';
import 'package:ssrcln_app/features/home/services_screen.dart';
import 'package:ssrcln_app/features/offers/offers_screen.dart';
import 'package:ssrcln_app/features/offers/reservation_screen.dart';
import 'package:ssrcln_app/features/home/about_us_screen.dart';
import 'package:ssrcln_app/features/home/help_screen.dart';
import 'package:ssrcln_app/features/profile/profile_screen.dart';
import 'package:ssrcln_app/features/profile/reservation_history_screen.dart';
import 'package:ssrcln_app/features/profile/personal_info_screen.dart';
import 'package:ssrcln_app/features/profile/notifications_screen.dart';
import 'package:ssrcln_app/features/profile/conditions_screen.dart';



// Import des providers
import 'providers/auth_provider.dart';
import 'providers/service_provider.dart';
import 'providers/offer_provider.dart';
import 'providers/booking_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  ));

  return MaterialApp(
  title: 'SSR CLEAN',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
  primarySwatch: Colors.cyan,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  ),
  ),
  initialRoute: '/',
  routes: {
  '/': (context) => const SplashScreen(),
    '/onboarding': (context) => const OnboardingScreen(),
    '/login': (context) => const LoginScreen(),
    '/singup': (context) => const SignupScreen(),
    '/home': (context) => const HomeScreen(),
    '/services': (context) => const ServicesScreen(),

    '/offers': (context) => const OffersScreen(),
    '/about': (context) => const AboutUsScreen(),
    '/help': (context) => const HelpScreen(),
    '/profile': (context) => const ProfileScreen(),

    '/reservation': (context) {
      // Get arguments from navigation
      final Map<String, dynamic>? args =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      return ReservationScreen(
        serviceTitle: args?['title'] as String?,
        servicePrice: args?['price'] as String?,
      );
    },


    '/reservation-history': (context) => const ReservationHistoryScreen(),
    '/personal-info': (context) => const PersonalInfoScreen(),
    '/notifications': (context) => const NotificationsScreen(),
    '/conditions': (context) => const ConditionsScreen(),



  },

  );

  }
  }