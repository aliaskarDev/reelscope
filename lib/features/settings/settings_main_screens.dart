import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/settings/setting_container.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';
import 'package:flutter_reelscope/ui/textstyle/textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
  bool onOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/template');
            },
            child: SvgPicture.asset(
              'assets/icons/close.svg',
            ),
          ),
        ),
        title: Text(
          setting,
          style: HeadlinesTextStyle.style500w18.copyWith(
            color: MyColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CarouselSlider(
                disableGesture: false,
                options: CarouselOptions(
                  initialPage: 3,
                  autoPlay: true,
                  aspectRatio: 1.8,
                  autoPlayInterval: const Duration(seconds: 1),
                  enlargeCenterPage: true,
                  disableCenter: true,
                ),
                items: [
                  Image.asset('assets/images/setting_photo1.png'),
                  Image.asset('assets/images/setting_photo2.png'),
                  Image.asset('assets/images/setting_photo3.png'),
                  Image.asset('assets/images/setting_photo4.png'),
                  Image.asset('assets/images/setting_photo5.png'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SettingContainer(
              title: pusgNotif,
              settingIcon: 'assets/icons/push.svg',
              child: onOff
                  ? SvgPicture.asset('assets/icons/on.svg')
                  : SvgPicture.asset('assets/icons/off.svg'),
              switchCase: () {
                setState(() {
                  onOff = !onOff;
                });
              },
            ),
            const SizedBox(height: 10),
            SettingContainer(
              title: administration,
              settingIcon: 'assets/icons/administration.svg',
              child: Text(
                callUs,
                style: BtnTextStyle.style400w14.copyWith(
                  color: MyColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SettingContainer(
              title: share,
              settingIcon: 'assets/icons/share.svg',
              child: const SizedBox(),
            ),
            const SizedBox(height: 10),
            SettingContainer(
              title: imBloger,
              settingIcon: 'assets/icons/bloger.svg',
              child: const SizedBox(),
            ),
            const SizedBox(height: 30),
            Text(
              followUs,
              style: AppTextStyle.style400w16.copyWith(
                color: MyColors.black,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/setting_tiktok.svg'),
                const SizedBox(width: 15),
                SvgPicture.asset('assets/icons/setting_telegram.svg'),
                const SizedBox(width: 15),
                SvgPicture.asset('assets/icons/setting_instagram.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
