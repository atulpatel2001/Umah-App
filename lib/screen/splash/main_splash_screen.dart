import 'package:flutter/material.dart';

import '../OnboardingScreens/Onboarding_Page.dart';


/*
 *this is main Splash Screen
 */
class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Onboarding()),
      );
    });
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              width: 84.37,
              height: 70.15,
              top: 246.5,
              left: 152,
              child: Image.asset('assets/image/umah-logo.png'),
            ),
            Positioned(
              width: 425,
              height: 530,
              top: 265,
              left: -25,
              child: Image.asset('assets/image/chair-image.png'),
            ),
            Positioned(
              width: 116,
              height: 41.25,
              top: 732,
              left: 129,
              child: Image.asset('assets/image/Copyright.png'),
            ),
          ],
        ),
      ),
    );
  }
}
