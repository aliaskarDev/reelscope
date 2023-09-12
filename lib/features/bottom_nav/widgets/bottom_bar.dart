import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/bottom_nav/widgets/inherited_data_provider.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isScrollingDown = false;
  bool isOnTop = true;

  @override
  void initState() {
    myScroll();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, widget.end),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  void showBottomBar() {
    if (mounted) {
      setState(() {
        _controller.forward();
      });
    }
  }

  void hideBottomBar() {
    if (mounted) {
      setState(() {
        _controller.reverse();
      });
    }
  }

  Future<void> myScroll() async {
    scrollBottomBarController.addListener(() {
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          isOnTop = false;
          hideBottomBar();
        }
      }
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          isOnTop = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollBottomBarController.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: isOnTop == true ? 0 : 40,
            height: isOnTop == true ? 0 : 40,
            decoration: BoxDecoration(
              color: MyColors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: ClipOval(
              child: Material(
                color: Colors.white,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        scrollBottomBarController
                            .animateTo(
                          scrollBottomBarController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                            .then((value) {
                          if (mounted) {
                            setState(() {
                              isOnTop = true;
                              isScrollingDown = false;
                            });
                          }
                          showBottomBar();
                        });
                      },
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: widget.unselectedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: widget.start,
          child: SlideTransition(
            position: _offsetAnimation,
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
                        borderSide: const BorderSide(
                            color: MyColors.bottomLine, width: 2),
                        insets: const EdgeInsets.fromLTRB(16, 0, 16, 2),
                      ),
                      tabs: [
                        SizedBox(
                          height: 36,
                          width: 47,
                          child: Center(
                            child: Column(
                              children: [
                                widget.currentPage == 0
                                    ? SvgPicture.asset(
                                        'assets/icons/active_template_icon.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/template_icon.svg'),
                                const SizedBox(height: 5),
                                const Text(
                                  template,
                                  style: BtnTextStyle.style500w10,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 47,
                          child: Center(
                            child: Column(
                              children: [
                                widget.currentPage == 1
                                    ? SvgPicture.asset(
                                        'assets/icons/active_fav_icon.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/favorite_icon.svg'),
                                const SizedBox(height: 5),
                                const Text(
                                  favorite,
                                  style: BtnTextStyle.style500w10,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 44,
                          child: Center(
                            child: Column(
                              children: [
                                widget.currentPage == 2
                                    ? SvgPicture.asset(
                                        'assets/icons/active_my_proj_icon.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/my_project_icon.svg'),
                                const SizedBox(height: 5),
                                const Text(
                                  myProject,
                                  style: BtnTextStyle.style500w10,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 52,
                          child: Center(
                            child: Column(
                              children: [
                                widget.currentPage == 3
                                    ? SvgPicture.asset(
                                        'assets/icons/active_setting_icon.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/setting_icon.svg'),
                                const SizedBox(height: 5),
                                const Text(
                                  setting,
                                  style: BtnTextStyle.style500w10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
