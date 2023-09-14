import 'package:flutter/material.dart';
import 'package:flutter_reelscope/features/welcome/widgets/moving_list.dart';
import 'package:flutter_reelscope/ui/colors/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Stack(
        children: [
          const AnimatedOpacity(
            opacity: 0.8,
            duration: Duration(seconds: 5),
            child: Row(
              children: [
                Expanded(
                    child: MovingList(
                  direction: AxisDirection.up,
                  duration: 0,
                )),
                Expanded(
                    child: MovingList(
                  direction: AxisDirection.down,
                  duration: 450,
                )),
                Expanded(
                  child: MovingList(
                    direction: AxisDirection.up,
                    duration: 200,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 370,
            left: 80,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/navBar');
              },
              child: Image.asset(
                'assets/images/logotip.png',
                scale: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
