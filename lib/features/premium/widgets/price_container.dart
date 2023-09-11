import 'package:flutter/material.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

class PriceContainer extends StatefulWidget {
  const PriceContainer(
      {super.key,
      required this.title,
      required this.secondTitle,
      required this.horizontal,
      required this.vertical,
      required this.colorButton,
      required this.colorActive
      });

  final String title;

  final String secondTitle;

  final bool colorButton;

  final double horizontal;

  final double vertical;

  final bool colorActive;

  @override
  State<PriceContainer> createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  bool buttonActive = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: widget.colorActive
                  ? null
                  : Border.all(
                      color: MyColors.grey,
                    ),
              borderRadius: BorderRadius.circular(15),
              gradient: widget.colorActive
                  ? const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffACFFD7),
                        Color(0xff00A3FF),
                      ],
                    )
                  : null,
              color: widget.colorActive ? null : MyColors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontal,
              vertical: widget.vertical,
            ),
            child: Column(
              children: [
                DefaultTextStyle(
                  style: HeadlinesTextStyle.style500w16.copyWith(
                      color: widget.colorActive ? MyColors.white : MyColors.black),
                  child: Text(widget.title),
                ),
                DefaultTextStyle(
                  style: AppTextStyle.style300w14.copyWith(
                    color: widget.colorActive ? MyColors.white : MyColors.black,
                  ),
                  child: Text(widget.secondTitle),
                ),
                const SizedBox(height: 10),
                widget.colorButton
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: DefaultTextStyle(
                            style: AppTextStyle.style500w12.copyWith(
                              color: MyColors.orange,
                            ),
                            child: const Text(
                              'скидка 85% ',
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
                onTap: () {
                  setState(() {
                    buttonActive = !buttonActive;
                  });
                },
                child: buttonActive
                    ? SvgPicture.asset(
                        'assets/icons/active_price.svg',
                      )
                    : SvgPicture.asset(
                        'assets/icons/price_icon.svg',
                      )),
          ),
        ),
      ],
    );
  }
}
