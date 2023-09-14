import 'package:flutter/material.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SettingContainer extends StatelessWidget {
  SettingContainer(
      {super.key,
      required this.title,
      required this.settingIcon,
      this.switchCase,
      this.child});

  final String title;
  final String settingIcon;
  void Function()? switchCase;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors.lightGrey,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(settingIcon),
          ),
          Text(
            title,
            style: BtnTextStyle.style400w14.copyWith(
              color: MyColors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: switchCase,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
