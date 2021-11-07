import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/constants.dart';


class HintCircle extends StatefulWidget {
  @override
  _HintCircleState createState() => _HintCircleState();
}

class _HintCircleState extends State<HintCircle>
    with SingleTickerProviderStateMixin {
  Animation animation, animation2;
  AnimationController animationController;
  double animatedContainerWidth;
  bool isClicked;
  Timer time;

  @override
  void dispose() {
    animationController.dispose();
    time.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animatedContainerWidth = 50;
    isClicked = false;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    time = Timer.periodic(
      Duration(seconds: 1),
          (timer) {
        if (timer.tick <= 5) {
          if (timer.tick == 1) {
            setState(() {
              animatedContainerWidth = MediaQuery.of(context).size.width * 0.55;
              isClicked = true;
              animationController.forward();
            });
          } else if (timer.tick == 5) {
            setState(() {
              animatedContainerWidth = 50;
              isClicked = false;
              animationController.reverse();
            });
          }
        } else {
          timer.cancel();
        }
      },
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack));
    animation2 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: kBottomNavigationBarHeight + 20,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedContainer(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              width: animatedContainerWidth,
              height: 40,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOutBack,
              decoration: BoxDecoration(
                color: color2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ScaleTransition(
                scale: animation,
                child: AnimatedOpacity(
                  opacity: animation2.value,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Muslim Guide to Jennah",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              if (!isClicked) {
                setState(() {
                  animatedContainerWidth =
                      MediaQuery.of(context).size.width * 0.55;
                  isClicked = true;
                  animationController.forward();
                });
              } else {
                setState(() {
                  animatedContainerWidth = 50;
                  isClicked = false;
                  animationController.reverse();
                });
              }
            },
            child: RotationTransition(
              turns: animation,
              alignment: Alignment.center,
              child: Container(
                child: Image.asset('assets/icon.png'),
                padding: const EdgeInsets.all(5.0),
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kCustomsColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
