import 'package:flutter/material.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    super.key,
    required this.title,
    required this.iconName,
    required this.width,
  });

  final String title;
  final String iconName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: width,
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(iconName),
            const SizedBox(height: 5),
            Text(
              title,
              style: BtnTextStyle.style500w10,
            )
          ],
        ),
      ),
    );
  }
}
