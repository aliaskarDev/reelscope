import 'package:flutter/material.dart';
import 'package:flutter_reelscope/features/templates/widgets/change_trend_container.dart';
import 'package:flutter_reelscope/features/templates/widgets/reels_listview.dart';
import 'package:flutter_reelscope/features/templates/widgets/scroll_containers.dart';
import 'package:flutter_svg/svg.dart';

class TemplatesMainScreen extends StatefulWidget {
  const TemplatesMainScreen({super.key});

  @override
  State<TemplatesMainScreen> createState() => _TemplatesMainScreenState();
}

class _TemplatesMainScreenState extends State<TemplatesMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 140),
                      child: Image.asset(
                        'assets/images/logo_icon.png',
                        scale: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/premium');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/premium_icon.svg',
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          Column(
            children: [
              SizedBox(height: 18),
              ListofSocialNetwork(),
              ReelsListView(activeIcon: true),
              ReelsListView(activeIcon: false),
              ReelsListView(activeIcon: true),
              SizedBox(height: 10),
              ChangeTrendContainer(),
              ReelsListView(activeIcon: false),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
