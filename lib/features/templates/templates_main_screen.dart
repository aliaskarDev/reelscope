import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/templates/widgets/scroll_containers.dart';
import 'package:flutter_svg/svg.dart';

class TemplatesMainScreen extends StatefulWidget {
  const TemplatesMainScreen({super.key});

  @override
  State<TemplatesMainScreen> createState() => _TemplatesMainScreenState();
}

class _TemplatesMainScreenState extends State<TemplatesMainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 140),
                      child: Image.asset(
                        'assets/images/logo_icon.png',
                        scale: 5,
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
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 18),
          SizedBox(
            height: 36,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ScrollContainer(
                title: iconTypes[index],
                text: types[index],
                isActive: currentIndex == index,
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemCount: types.length,
            ),
          ),
        ],
      ),
    );
  }
}
