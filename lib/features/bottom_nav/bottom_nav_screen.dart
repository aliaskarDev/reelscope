import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reelscope/features/favorites/favorites_main_screen.dart';
import 'package:flutter_reelscope/features/my_projects/my_projects_main_screen.dart';
import 'package:flutter_reelscope/features/settings/settings_main_screens.dart';
import 'package:flutter_reelscope/features/templates/templates_main_screen.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingNavBar(
        color: MyColors.white.withOpacity(0.15),
        selectedIconColor: MyColors.white,
        unselectedIconColor: MyColors.grey,
        items: [
          FloatingNavBarItem(
            iconData: Icons.local_movies,
            page: const TemplatesMainScreen(),
            title: 'Template',
          ),
          FloatingNavBarItem(
            iconData: Icons.favorite,
            page: const FavoritesMainScreen(),
            title: 'facorite',
          ),
          FloatingNavBarItem(
            iconData: Icons.video_collection,
            page: const MyProjectsMainScreen(),
            title: 'My Project',
          ),
          FloatingNavBarItem(
            iconData: Icons.settings,
            page: const SettingsMainScreen(),
            title: 'Setting',
          ),
        ],
        horizontalPadding: 10.0,
        hapticFeedback: false,
        resizeToAvoidBottomInset: false,
        showTitle: true,
      ),
    );
  }
}
