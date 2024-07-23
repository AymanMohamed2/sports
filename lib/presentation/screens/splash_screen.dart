import 'package:flutter/material.dart';
import 'package:sports/presentation/screens/onboarding_screen.dart';
import 'package:sports/utils/coloers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/firest.png', height: 200, width: 200),
              const Text(
                'ITI Sports',
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ]),
      ),
    );
  }
}
