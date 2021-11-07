import 'dart:math';

import 'package:flutter/painting.dart';

/*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- rotating Canvas  --------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
extension CanvasExtension on Canvas {
  /// rotate the canvas from center
  /// I use the following resource to calculate rotation of the canvas
  /// https://stackoverflow.com/a/54336099/9689717
  void rotateZ(double radians, Size size) {
    final double r =
        sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + radians;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;
    this.translate(translateX, translateY);
    this.rotate(radians);
  }
}