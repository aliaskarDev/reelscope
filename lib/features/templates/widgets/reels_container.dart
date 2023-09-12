import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReelsContainer extends StatefulWidget {
  const ReelsContainer({
    super.key,
    required this.photo,
  });

  final String photo;

  @override
  State<ReelsContainer> createState() => _ReelsContainerState();
}

class _ReelsContainerState extends State<ReelsContainer> {
  bool iconsbutton = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(widget.photo, scale: 4),
        Positioned(
          right: 8,
          top: 9,
          child: InkWell(
            child: iconsbutton
                ? SvgPicture.asset(
                    'assets/icons/active_fav_reels.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/fav_reels.svg',
                  ),
            onTap: () {
              setState(() {
                iconsbutton = !iconsbutton;
              });
            },
          ),
        ),
      ],
    );
  }
}
