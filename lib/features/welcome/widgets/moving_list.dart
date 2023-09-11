import 'package:flutter/material.dart';
import 'package:flutter_reelscope/constants/const.dart';

class MovingList extends StatefulWidget {
  final AxisDirection direction;
  final double duration;

  const MovingList({
    super.key,
    required this.direction,
    required this.duration,
  });

  @override
  _MovingListState createState() => _MovingListState();
}

class _MovingListState extends State<MovingList> {
  late ScrollController _controllerfirst;
  bool stop = true;

  @override
  void initState() {
    super.initState();

    _controllerfirst = ScrollController(
        keepScrollOffset: false, initialScrollOffset: widget.duration);
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateList());
  }

  void _animateList() async {
    do {
      await Future.delayed(const Duration(milliseconds: 50));

      if (widget.direction == AxisDirection.up) {
        _controllerfirst.jumpTo(_controllerfirst.position.pixels + 1);
      } else if (widget.direction == AxisDirection.down) {
        _controllerfirst.jumpTo(_controllerfirst.position.pixels - 1);
      }
    } while (_controllerfirst.position.pixels !=
        _controllerfirst.position.maxScrollExtent);
  }

  @override
  void dispose() {
    _controllerfirst.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _controllerfirst,
      itemExtent: 220,
      itemCount: firstphotos.length,
      itemBuilder: (context, index) {
        return Center(
          child: firstphotos[index],
        );
      },
    );
  }
}
