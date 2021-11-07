import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_dialy_guide/constants.dart';

class AnimatedTextHeader extends StatefulWidget {
  final firstWord;
  final secondWord;
  final bool isSocial;
  final double paddingHeight;


  const AnimatedTextHeader(
      {Key key, this.firstWord = "Azkar ", this.secondWord = "Elmoslem", this.isSocial = true, this.paddingHeight=25.0})
      : super(key: key);

  @override
  _AnimatedTextHeaderState createState() => _AnimatedTextHeaderState();
}

class _AnimatedTextHeaderState extends State<AnimatedTextHeader>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation animation1, animation2;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeOutBack)));
    animation2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.7, curve: Curves.easeOutBack)));
    timer = Timer(
      const Duration(milliseconds: 1300),
          () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: widget.paddingHeight),
      child: UnconstrainedBox(
        child: LimitedBox(
          maxWidth: size.width * 0.6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: animation1,
                    child:Text(
                      widget.firstWord,
                      style: GoogleFonts.cookie(
                        color: Colors.redAccent,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: animation2,
                    child:Text(
                      widget.secondWord,
                      style: GoogleFonts.cookie(
                        color: Colors.redAccent,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              widget.isSocial ? Container() : Divider(
                thickness: 1.5,
                color: kCustomsColor,
              ),
              widget.isSocial ? Container()  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.pink[700],
                ),
              ),
              widget.isSocial ? Container() : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Divider(
                  thickness: 1.5,
                  color: kCustomsColor,
                ),
              ),
              widget.isSocial ? Container() : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.pink[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
