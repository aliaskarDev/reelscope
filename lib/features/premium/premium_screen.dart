import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/premium/widgets/price_container.dart';
import 'package:flutter_reelscope/features/home/widgets/home_button.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/girl_with_gless.png',
                      ),
                      Positioned(
                        top: 55,
                        right: 15,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/navBar');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/close_icon.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 330,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        color: MyColors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 18),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: PriceContainer(
                                  title: firstPrice,
                                  secondTitle: firstPricePart,
                                  vertical: 30,
                                  horizontal: 38,
                                  colorButton: true,
                                  colorActive: true,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: PriceContainer(
                                  title: secondPrice,
                                  secondTitle: secondPricePart,
                                  vertical: 35,
                                  horizontal: 20,
                                  colorButton: false,
                                  colorActive: false,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          HomeButton(
                            title: 'Подписаться',
                            vertical: 20,
                            horizontal: 137,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          Text(
                            saveBought,
                            style: BtnTextStyle.style400w14.copyWith(
                              color: MyColors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                confidan,
                                style: BtnTextStyle.style500w10.copyWith(
                                  color: MyColors.grey,
                                ),
                              ),
                              SvgPicture.asset('assets/icons/premium_line.svg'),
                              Text(
                                cancellation,
                                style: BtnTextStyle.style500w10.copyWith(
                                  color: MyColors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            a,
                            style: AppTextStyle.style400w10.copyWith(
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
