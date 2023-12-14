import 'dart:math';
import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

/*---------------------------------------------------------------------------------------------*/
/*-----------------------------------  Setting icon Colors  ---------------------------------*/
/*---------------------------------------------------------------------------------------------*/
const Color pinkLeft = GlobalAppColors.appBlue;
const Color pinkRight = GlobalAppColors.appBlue;

const Color tealLeft = GlobalAppColors.appGray;
const tealRight = GlobalAppColors.appGray;

// Dimensions.
const unitHeight = GlobalAppSizes.s_1;
const unitWidth = GlobalAppSizes.s_1;

const stickLength = GlobalAppSizes.s_5 / GlobalAppSizes.s_9;
const stickWidth = GlobalAppSizes.s_5 / GlobalAppSizes.s_36;
const stickRadius = stickWidth / GlobalAppSizes.s_2;
const knobDiameter = GlobalAppSizes.s_5 / GlobalAppSizes.s_54;
const knobRadius = knobDiameter / GlobalAppSizes.s_2;
const stickGap = GlobalAppSizes.s_5 / GlobalAppSizes.s_54;

// Locations.
const knobDistanceFromCenter =
    stickGap / GlobalAppSizes.s_2 + stickWidth / GlobalAppSizes.s_2;
const lowerKnobCenter = Offset(GlobalAppSizes.s_0, knobDistanceFromCenter);
const upperKnobCenter = Offset(GlobalAppSizes.s_0, -knobDistanceFromCenter);

const knobDeviation = stickLength / GlobalAppSizes.s_2 - stickRadius;

// Key moments in animation.
const _colorKnobContractionBegins = GlobalAppSizes.s_1 / GlobalAppSizes.s_23;
const _monoKnobExpansionEnds = GlobalAppSizes.s_11 / GlobalAppSizes.s_23;
const _colorKnobContractionEnds = GlobalAppSizes.s_14 / GlobalAppSizes.s_23;

// Stages.
bool isTransitionPhase(double time) => time < _colorKnobContractionEnds;

// Curve easing.
const _curve = Curves.easeInOutCubic;

double _progress(
  double time, {
  required double begin,
  required double end,
}) =>
    _curve.transform(((time - begin) / (end - begin)).clamp(0, 1).toDouble());

double _monoKnobProgress(double time) => _progress(
      time,
      begin: 0,
      end: _monoKnobExpansionEnds,
    );

double _colorKnobProgress(double time) => _progress(
      time,
      begin: _colorKnobContractionBegins,
      end: _colorKnobContractionEnds,
    );

double _rotationProgress(double time) => _progress(
      time,
      begin: _colorKnobContractionEnds,
      end: 1,
    );

// Changing lengths: mono.
double monoLength(double time) =>
    _monoKnobProgress(time) * (stickLength - knobDiameter) + knobDiameter;

double _monoLengthLeft(double time) =>
    min(monoLength(time) - knobRadius, stickRadius);

double _monoLengthRight(double time) =>
    monoLength(time) - _monoLengthLeft(time);

double _monoHorizontalOffset(double time) =>
    (_monoLengthRight(time) - _monoLengthLeft(time)) / 2 - knobDeviation;

Offset upperMonoOffset(double time) =>
    upperKnobCenter + Offset(_monoHorizontalOffset(time), 0);

Offset lowerMonoOffset(double time) =>
    lowerKnobCenter + Offset(-_monoHorizontalOffset(time), 0);

// Changing lengths: color.
double colorLength(double time) => (1 - _colorKnobProgress(time)) * stickLength;

Offset upperColorOffset(double time) =>
    upperKnobCenter + Offset(stickLength / 2 - colorLength(time) / 2, 0);

Offset lowerColorOffset(double time) =>
    lowerKnobCenter + Offset(-stickLength / 2 + colorLength(time) / 2, 0);

// Moving objects.
double knobRotation(double time) => _rotationProgress(time) * pi / 4;

Offset knobCenter(double time) {
  final progress = _rotationProgress(time);
  if (progress == GlobalAppSizes.s_0) {
    return lowerKnobCenter;
  } else if (progress == GlobalAppSizes.s_1) {
    return upperKnobCenter;
  } else {
    // Calculates the current location.
    final center = Offset(knobDistanceFromCenter / tan(pi / GlobalAppSizes.s_8),
        GlobalAppSizes.s_0);
    final radius = (lowerKnobCenter - center).distance;
    final angle = pi +
        (progress - GlobalAppSizes.s_1 / GlobalAppSizes.s_2) *
            pi /
            GlobalAppSizes.s_4;
    return center + Offset.fromDirection(angle, radius);
  }
}

class SettingsIcon extends StatelessWidget {
  const SettingsIcon(this.time, {super.key});

  final double time;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SettingsIconPainter(time: time, context: context),
    );
  }
}

class _SettingsIconPainter extends CustomPainter {
  _SettingsIconPainter({required this.time, required this.context});

  final double time;
  final BuildContext context;

  late Offset _center;
  late double _scaling;
  late Canvas _canvas;

  /// Computes [_center] and [_scaling], parameters used to convert offsets
  /// and lengths in relative units into logical pixels.
  ///
  /// The icon is aligned to the bottom-start corner.
  void _computeCenterAndScaling(Size size) {
    _scaling = min(size.width / unitWidth, size.height / unitHeight);
    _center = Directionality.of(context) == TextDirection.ltr
        ? Offset(unitWidth * _scaling / GlobalAppSizes.s_2,
            size.height - unitHeight * _scaling / GlobalAppSizes.s_2)
        : Offset(size.width - unitWidth * _scaling / GlobalAppSizes.s_2,
            size.height - unitHeight * _scaling / GlobalAppSizes.s_2);
  }

  /// Transforms an offset in relative units into an offset in logical pixels.
  Offset _transform(Offset offset) {
    return _center + offset * _scaling;
  }

  /// Transforms a length in relative units into a dimension in logical pixels.
  double _size(double length) {
    return length * _scaling;
  }

  /// A rectangle with a fixed location, used to locate gradients.
  Rect get _fixedRect {
    final topLeft = Offset(-_size(stickLength / GlobalAppSizes.s_2),
        -_size(stickWidth / GlobalAppSizes.s_2));
    final bottomRight = Offset(_size(stickLength / GlobalAppSizes.s_2),
        _size(stickWidth / GlobalAppSizes.s_2));
    return Rect.fromPoints(topLeft, bottomRight);
  }

  /// Black or white paint, depending on brightness.
  Paint get _monoPaint {
    final monoColor =
        Theme.of(context).colorScheme.brightness == Brightness.light
            ? GlobalAppColors.kScaffoldDark
            : GlobalAppColors.kScaffoldLight;
    return Paint()..color = monoColor;
  }

  /// Pink paint with horizontal gradient.
  Paint get _pinkPaint {
    const shader = LinearGradient(colors: [pinkLeft, pinkRight]);
    final shaderRect = _fixedRect.translate(
      _size(-(stickLength - colorLength(time)) / GlobalAppSizes.s_2),
      0,
    );

    return Paint()..shader = shader.createShader(shaderRect);
  }

  /// Teal paint with horizontal gradient.
  Paint get _tealPaint {
    const shader = LinearGradient(colors: [tealLeft, tealRight]);
    final shaderRect = _fixedRect.translate(
      _size((stickLength - colorLength(time)) / GlobalAppSizes.s_2),
      0,
    );

    return Paint()..shader = shader.createShader(shaderRect);
  }

  /// Paints a stadium-shaped stick.
  void _paintStick({
    required Paint paint,
    required Offset center,
    required double length,
    required double width,
    double angle = 0,
  }) {
    // Convert to pixels.
    center = _transform(center);
    length = _size(length);
    width = _size(width);

    // Paint.
    width = min(width, length);
    final stretch = length / GlobalAppSizes.s_2;
    final radius = width / GlobalAppSizes.s_2;

    _canvas.save();

    _canvas.translate(center.dx, center.dy);
    _canvas.rotate(angle);

    final leftOval = Rect.fromCircle(
      center: Offset(-stretch + radius, GlobalAppSizes.s_0),
      radius: radius,
    );

    final rightOval = Rect.fromCircle(
      center: Offset(stretch - radius, GlobalAppSizes.s_0),
      radius: radius,
    );

    _canvas.drawPath(
      Path()
        ..arcTo(leftOval, pi / GlobalAppSizes.s_2, pi, false)
        ..arcTo(rightOval, -pi / GlobalAppSizes.s_2, pi, false),
      paint,
    );

    _canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    _computeCenterAndScaling(size);
    _canvas = canvas;

    if (isTransitionPhase(time)) {
      _paintStick(
        center: upperColorOffset(time),
        length: colorLength(time),
        width: stickWidth,
        paint: _pinkPaint,
      );

      _paintStick(
        center: lowerColorOffset(time),
        length: colorLength(time),
        width: stickWidth,
        paint: _tealPaint,
      );

      _paintStick(
        center: upperMonoOffset(time),
        length: monoLength(time),
        width: knobDiameter,
        paint: _monoPaint,
      );

      _paintStick(
        center: lowerMonoOffset(time),
        length: monoLength(time),
        width: knobDiameter,
        paint: _monoPaint,
      );
    } else {
      _paintStick(
        center: upperKnobCenter,
        length: stickLength,
        width: knobDiameter,
        angle: -knobRotation(time),
        paint: _monoPaint,
      );

      _paintStick(
        center: knobCenter(time),
        length: stickLength,
        width: knobDiameter,
        angle: knobRotation(time),
        paint: _monoPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) =>
      oldDelegate is! _SettingsIconPainter || (oldDelegate).time != time;
}
