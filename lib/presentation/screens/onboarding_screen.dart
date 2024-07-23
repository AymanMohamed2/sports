import 'package:flutter/material.dart';
import 'package:sports/utils/coloers.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const <Widget>[
              OnboardingPage(content: 'Welcome to ITI Sports App!'),
              OnboardingPage(content: 'Discover sports events easily!'),
              OnboardingPage(content: 'Stay updated with live scores!'),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: iconColor,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => buildDot(index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String content;

  const OnboardingPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        content,
        style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
