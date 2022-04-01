
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/provides/theme_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CustomBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            child: Container(
              height: 250,
            )),
        Positioned(
          top: -40,
          right: -50,
          child: CustomBox(
            angulo: 1.6,
            color: color2,
          ),
        ),
        Positioned(
          top: -40,
          right: -60,
          child: CustomBox(
            angulo: 1.2,
            color: kCustomsColor,
          ),
        ),
        Positioned(
          child: _crearContenido(theme, context),
        ),
      ],
    );
  }
  _themeIcon(theme, context) {
    return IconButton(
      icon: Icon(
        (theme.theme)
            ? Icons.brightness_7_outlined
            : Icons.brightness_4_outlined,
        //color: Theme.of(context).w,
      ),
      onPressed: () {
        theme.switchTheme();
      },
    );
  }


  Widget _crearContenido( theme, BuildContext context) {
    return Container(
        height: 250,
        margin: EdgeInsets.only(right: 10, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "  ",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              "Muslim Guide",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "App theme",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            _themeIcon (theme, context)
          ],
        ));
  }
}



class CustomBox extends StatelessWidget {
  //variables
  final Color color;
  final double angulo;

  //constructor de la clase
  const CustomBox({@required this.color, @required this.angulo});

  @override
  Widget build(BuildContext context) {
    //media query
    //final size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: -pi / this.angulo,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        width: 250,
        height: 230, //alto
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: color),
      ),
    );
  }
}