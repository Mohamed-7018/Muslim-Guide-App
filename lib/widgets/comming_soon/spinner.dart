
import 'package:flutter/widgets.dart';
import 'package:muslim_dialy_guide/utils/export.dart';

class Spinner extends StatefulWidget {
  const Spinner({
    Key key,
    @required this.color,
    this.size = 300,
    this.ringWidth = 5.0,
    this.ringCount = 7,
    this.duration = const Duration(milliseconds: 4000),
    this.controller,
  }) : super(key: key);

  final Color color;
  final double size;

  final double ringWidth;
  final int ringCount;

  final Duration duration;
  final AnimationController controller;

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
   AnimationController _controller;
   Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat();

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          return CustomPaint(
            child: SizedBox.fromSize(size: Size.square(widget.size)),
            painter: _SpinnerPainter(
              _animation.value,
              ringWidth: widget.ringWidth,
              color: widget.color,
              ringCount: widget.ringCount,
            ),
          );
        },
        animation: _animation,
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  _SpinnerPainter(
      this.rotateValue, {
        @required Color color,
        @required this.ringWidth,
        @required this.ringCount,
      }) : spinnerPaint = Paint()
    ..color = color
    ..strokeWidth = 1
    ..style = PaintingStyle.fill;

  final Paint spinnerPaint;
  final double rotateValue;
  final double ringWidth;
  final int ringCount;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 1; i <= ringCount; i++) {
      _drawSpin(canvas, size, spinnerPaint, i);
    }
  }

  void _drawSpin(Canvas canvas, Size size, Paint paint, int scale) {
    final scaledSize = size * (scale / ringCount);
    final spinnerSize = Size.square(scaledSize.longestSide);

    final startX = spinnerSize.width / 2;
    final startY = spinnerSize.topCenter(Offset.zero).dy;

    final radius = spinnerSize.width / 4;

    final endX = startX;
    final endY = spinnerSize.bottomCenter(Offset.zero).dy;

    final borderWith = ringWidth;

    final scaleFactor = -(scale - (ringCount + 1));

    final path = Path();
    path.moveTo(startX, startY);
    path.arcToPoint(
      Offset(endX, endY),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(startX, startY + borderWith),
      radius: Radius.circular(radius),
    );
    path.lineTo(startX, startY);

    canvas.save();
    _translateCanvas(canvas, size, spinnerSize);
    canvas.rotateZ(
      getRadian(rotateValue * 360 * scaleFactor),
      spinnerSize,
    );
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _translateCanvas(Canvas canvas, Size size, Size spinnerSize) {
    final offset = ((size - spinnerSize) as Offset) / 2;
    canvas.translate(offset.dx, offset.dy);
  }

  @override
  bool shouldRepaint(_SpinnerPainter oldDelegate) =>
      oldDelegate.rotateValue != rotateValue ||
          oldDelegate.ringWidth != ringWidth ||
          oldDelegate.ringCount != ringCount ||
          oldDelegate.spinnerPaint != spinnerPaint;
}
