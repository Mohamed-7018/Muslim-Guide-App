import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  DelayedAnimation({required this.child,required this.delay});

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with TickerProviderStateMixin {
  AnimationController ?  _controller;
  Animation<Offset> ?  _animOffset;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: GlobalAppSizes.s_800.toInt()));
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _controller!);
    _animOffset =
        Tween<Offset>(begin:  Offset(GlobalAppSizes.s_0, GlobalAppSizes.s_0p35), end: Offset.zero)
            .animate(curve);

    // ignore: unnecessary_null_comparison
    if (widget.delay == null) {
      _controller?.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          _controller?.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset!,
        child: widget.child,
      ),
      opacity: _controller!,
    );
  }
}
