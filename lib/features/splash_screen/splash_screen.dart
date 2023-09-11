import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reelscope/features/welcome/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen.png',
              scale: 3,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      nextScreen: const WelcomeScreen(),
      splashIconSize: 805,
    );
  }
}
