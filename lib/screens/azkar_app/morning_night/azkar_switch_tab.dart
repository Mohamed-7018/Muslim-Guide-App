import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/provides/morning_night_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class HomeSwitchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Color(0xFFB8C3FF),
            ),
          ),
          Selector<MorningOrNightProvider, CarouselType>(
            selector: (context, carouselType) => carouselType.carouselType,
            builder: (context, value, child) => AnimatedAlign(
              curve: Curves.easeInOut,
              alignment: (value == CarouselType.Night)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                decoration: BoxDecoration(
                  color:Color(0xFFF1395E),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SwitchBtn.morning(text: 'Morning'),
              const SwitchBtn.night(text: 'Night'),
            ],
          ),
        ],
      ),
    );
  }
}



class SwitchBtn extends StatelessWidget {
  final String text;
  final CarouselType carouselType;

  const SwitchBtn.morning({
    this.text,
  }) : this.carouselType = CarouselType.Night;
  const SwitchBtn.night({
    this.text,
  }) : this.carouselType = CarouselType.Morning;
  @override
  Widget build(BuildContext context) {
    return Consumer<MorningOrNightProvider>(
      builder: (context, value, child) => TextButton(
        onPressed: (carouselType == CarouselType.Night)
            ? () {
          value.setCarouselType(CarouselType.Morning);
          value.switchFadeState(CrossFadeState.showFirst);
        }
            : () {
          value.setCarouselType(CarouselType.Night);
          value.switchFadeState(CrossFadeState.showSecond);
        },
        child: Selector<MorningOrNightProvider, CarouselType>(
          selector: (context, carouselType) => carouselType.carouselType,
          builder: (context, value, child) => AnimatedDefaultTextStyle(
            curve: Curves.easeOutBack,
            style: TextStyle(
              fontSize: (carouselType == CarouselType.Morning)
                  ? ((value == CarouselType.Night) ? 20 : 16)
                  : ((value == CarouselType.Night) ? 20 : 16),
              fontWeight: (carouselType == CarouselType.Morning)
                  ? ((value == CarouselType.Night)
                  ? FontWeight.bold
                  : FontWeight.normal)
                  : ((value == CarouselType.Night)
                  ? FontWeight.bold
                  : FontWeight.normal),
              color: (carouselType == CarouselType.Morning)
                  ? ((value == CarouselType.Night)
                  ? Colors.white
                  : Color(0xFF5117AC))
                  : ((value == CarouselType.Morning)
                  ? Colors.white
                  : Color(0xFF5117AC)),
            ),
            duration: const Duration(milliseconds: 400),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
