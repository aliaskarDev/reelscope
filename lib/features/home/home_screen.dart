import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/home/widgets/home_button.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Image.asset(
              'assets/images/logo_icon.png',
              scale: 5,
            ),
            const SizedBox(height: 10),
            const Text(
              homeScreenTitle,
              style: AppTextStyle.style300w18,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 78,
                    child: Image.asset(
                      'assets/images/girl_with_limon.png',
                      scale: 3.8,
                    ),
                  ),
                  Positioned(
                    top: 18,
                    left: 28,
                    child: Image.asset(
                      'assets/images/girl_with_smile.png',
                      scale: 3.8,
                    ),
                  ),
                  Positioned(
                    top: 66,
                    left: 40,
                    child: Image.asset(
                      'assets/images/photo10.png',
                      scale: 1.5,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 77.8,
                    child: HomeButton(
                      title: 'Попробовать',
                      vertical: 16,
                      horizontal: 73.5,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/navBar',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
