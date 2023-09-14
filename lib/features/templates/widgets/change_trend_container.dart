import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

class ChangeTrendContainer extends StatefulWidget {
  const ChangeTrendContainer({super.key});

  @override
  State<ChangeTrendContainer> createState() => _ChangeTrendContainerState();
}

class _ChangeTrendContainerState extends State<ChangeTrendContainer> {
  bool onOff = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/fire_icon.svg'),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trendCnahge,
                      style: HeadlinesTextStyle.style500w16.copyWith(
                        color: MyColors.black,
                      ),
                    ),
                    Text(
                      notif,
                      style: AppTextStyle.style300w13.copyWith(
                        color: MyColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                child: onOff
                    ? SvgPicture.asset('assets/icons/on.svg')
                    : SvgPicture.asset('assets/icons/off.svg'),
                onTap: () {
                  setState(() {
                    onOff = !onOff;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
