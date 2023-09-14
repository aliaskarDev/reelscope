import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/bottom_nav/widgets/bottom_bar_icon.dart';
import 'package:flutter_reelscope/features/bottom_nav/widgets/inherited_data_provider.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';

class BottomBar extends StatefulWidget {
  final Widget child;
  final int currentPage;
  final TabController tabController;
  final Color unselectedColor;
  final Color barColor;
  final double end;
  final double start;
  const BottomBar({
    required this.child,
    required this.currentPage,
    required this.tabController,
    required this.unselectedColor,
    required this.barColor,
    required this.end,
    required this.start,
    Key? key,
  }) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  ScrollController scrollBottomBarController = ScrollController();

  bool isScrollingDown = false;

  bool isOnTop = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        InheritedDataProvider(
          scrollController: scrollBottomBarController,
          child: widget.child,
        ),
        Positioned(
          bottom: widget.start,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.18,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: MyColors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Material(
                color: widget.barColor,
                child: TabBar(
                  unselectedLabelColor: MyColors.grey,
                  labelColor: MyColors.white,
                  indicatorPadding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  controller: widget.tabController,
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: MyColors.bottomLine, width: 2),
                    insets: const EdgeInsets.fromLTRB(16, 0, 16, 2),
                  ),
                  tabs: [
                    widget.currentPage == 0
                        ? const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/active_template_icon.svg',
                            width: 52,
                          )
                        : const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/template_icon.svg',
                            width: 52,
                          ),
                    widget.currentPage == 1
                        ? const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/active_fav_icon.svg',
                            width: 52,
                          )
                        : const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/favorite_icon.svg',
                            width: 52,
                          ),
                    widget.currentPage == 2
                        ? const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/active_my_proj_icon.svg',
                            width: 52,
                          )
                        : const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/my_project_icon.svg',
                            width: 52,
                          ),
                    widget.currentPage == 3
                        ? const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/active_setting_icon.svg',
                            width: 52,
                          )
                        : const BottomBarIcon(
                            title: setting,
                            iconName: 'assets/icons/setting_icon.svg',
                            width: 52,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
