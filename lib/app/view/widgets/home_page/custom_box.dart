import 'dart:math';

import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

class CustomBox extends StatelessWidget {
  final Color color;
  final double angulo;

  const CustomBox({
    required this.color,
    required this.angulo,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / this.angulo,
      child: Container(
        margin: GlobalAppEdgeInsets.h0v0,
        width: GlobalAppSizes.s_250,
        height: GlobalAppSizes.s_230, 
        decoration: BoxDecoration(
            borderRadius: GlobalAppBorders.c_25 ,
            color: color),
      ),
    );
  }
}
