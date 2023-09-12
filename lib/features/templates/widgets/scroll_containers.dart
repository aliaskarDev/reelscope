import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';
import 'package:flutter_reelscope/features/templates/widgets/stotries_container.dart';

class ScrollContainers extends StatefulWidget {
  const ScrollContainers({super.key});

  @override
  State<ScrollContainers> createState() => _ScrollContainersState();
}

class _ScrollContainersState extends State<ScrollContainers> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StoriesContainer(
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
    );
  }
}
