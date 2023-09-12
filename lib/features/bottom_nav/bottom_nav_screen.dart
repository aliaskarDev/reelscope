import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/favorites/favorites_main_screen.dart';
import 'package:flutter_reelscope/features/my_projects/my_projects_main_screen.dart';
import 'package:flutter_reelscope/features/settings/settings_main_screens.dart';
import 'package:flutter_reelscope/features/templates/templates_main_screen.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'widgets/bottom_bar.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
      isActiveIcon = !isActiveIcon;
      print('check button');
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 600.0, sigmaY: 1000.0),
        child: BottomBar(
          currentPage: currentPage,
          tabController: tabController,
          unselectedColor: Colors.black,
          barColor: MyColors.black.withOpacity(0.4),
          start: 10,
          end: 2,
          child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: const [
              TemplatesMainScreen(),
              FavoritesMainScreen(),
              MyProjectsMainScreen(),
              SettingsMainScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
