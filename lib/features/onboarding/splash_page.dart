import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 7));
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF21BBC7),
              Color(0xFF1C768C),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFBBF0F4),
                  borderRadius: BorderRadius.circular(75),

                ),

                child: Image.asset(
                  'assets/logo.png', // Your logo path
                  width: 190,
                  height: 190,
                  fit: BoxFit.contain,

                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'SSR CLEAN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nettoyage professionnel à domicile',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFBBF0F4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}