import 'package:flutter/material.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_svg/svg.dart';

class ScrollContainer extends StatelessWidget {
  const ScrollContainer({
    Key? key,
    required this.text,
    required this.isActive,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? MyColors.black : MyColors.lightGrey,
          borderRadius: BorderRadius.circular(9),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SvgPicture.asset(title),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
