import 'package:flutter/material.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import '../../../ui/textstyle/textstyle.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.title,
    this.vertical,
    this.horizontal,
    required this.onTap,
  });

  final String title;
  final double? vertical;
  final double? horizontal;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 20,
            vertical: vertical ?? 20,
          ),
          child: Text(
            title,
            style: AppTextStyle.style500w14.copyWith(
              color: MyColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
