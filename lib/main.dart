import 'package:flutter/material.dart';
import 'package:flutter_reelscope/features/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_reelscope/features/favorites/favorites_main_screen.dart';
import 'package:flutter_reelscope/features/home/home_screen.dart';
import 'package:flutter_reelscope/features/premium/premium_screen.dart';
import 'package:flutter_reelscope/features/splash_screen/splash_screen.dart';
import 'package:flutter_reelscope/features/welcome/welcome_screen.dart';
import 'package:flutter_reelscope/features/my_projects/my_projects_main_screen.dart';
import 'package:flutter_reelscope/features/settings/settings_main_screens.dart';
import 'package:flutter_reelscope/features/templates/templates_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/navBar': (context) => const MyNavigationBar(
              title: 'Flutter Floating Bottom Bar Demo',
            ),
        '/premium': (context) => const PremiumScreen(),
        '/template': (context) => const TemplatesMainScreen(),
        '/favorite': (context) => const FavoritesMainScreen(),
        '/myProject': (context) => const MyProjectsMainScreen(),
        '/setting': (context) => const SettingsMainScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
