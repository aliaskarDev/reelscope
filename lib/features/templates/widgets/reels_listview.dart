import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/templates/widgets/reels_container.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

class ReelsListView extends StatelessWidget {
  const ReelsListView({
    super.key,
    required this.activeIcon,
  });

  final bool activeIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          child: Row(
            children: [
              Text(
                categories,
                style: HeadlinesTextStyle.style500w16.copyWith(
                  color: MyColors.black,
                ),
              ),
              activeIcon
                  ? SvgPicture.asset(
                      'assets/icons/categories_icon.svg',
                    )
                  : const SizedBox(),
              const Spacer(),
              Image.asset(
                'assets/images/all_cat_icon.png',
                scale: 4,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ReelsContainer(
              photo: reelsPhotos[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: reelsPhotos.length,
          ),
        ),
      ],
    );
  }
}
