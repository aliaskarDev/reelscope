import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/home/widgets/home_button.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesMainScreen extends StatefulWidget {
  const FavoritesMainScreen({super.key});

  @override
  State<FavoritesMainScreen> createState() => _FavoritesMainScreenState();
}

class _FavoritesMainScreenState extends State<FavoritesMainScreen> {
  bool erroractive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text(
                    favorite,
                    style: HeadlinesTextStyle.style500w18.copyWith(
                      color: MyColors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/premium');
                  },
                  child: SvgPicture.asset(
                    'assets/icons/premium_icon.svg',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: erroractive
            ? Column(
                children: [
                  const SizedBox(height: 70),
                  Image.asset(
                    'assets/images/error_icon.png',
                    scale: 4,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    error,
                    style: HeadlinesTextStyle.style600w18.copyWith(
                      color: MyColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    errorText,
                    style: BtnTextStyle.style400w14.copyWith(
                      color: MyColors.grey,
                    ),
                  ),
                  const SizedBox(height: 50),
                  HomeButton(
                    horizontal: 80,
                    title: tryagain,
                    onTap: () {
                      setState(() {
                        erroractive = !erroractive;
                      });
                    },
                  ),
                ],
              )
            : Column(
                children: [
                  Image.asset(
                    'assets/images/favorite_screen_icon.png',
                    scale: 4,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    dontHaveFavorite,
                    style: HeadlinesTextStyle.style600w18.copyWith(
                      color: MyColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    addFavorite,
                    style: BtnTextStyle.style400w14.copyWith(
                      color: MyColors.grey,
                    ),
                  ),
                  const SizedBox(height: 50),
                  HomeButton(
                    horizontal: 80,
                    title: chooseTemplate,
                    onTap: () {},
                  ),
                ],
              ),
      ),
    );
  }
}
