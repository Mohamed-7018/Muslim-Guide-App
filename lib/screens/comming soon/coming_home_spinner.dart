
import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/widgets/animated_text_header.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:muslim_dialy_guide/widgets/comming_soon/spinner.dart';

import '../../constants.dart';


class ComingSoonSpinner extends StatelessWidget {
  static const String routeName = 'comingSoonSpinner';

  const ComingSoonSpinner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Translated quraan"
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /*-----------------------------------------------------------------------------------------------*/
          /*--------------------------------  Animted Text  -----------------------------------*/
          /*-----------------------------------------------------------------------------------------------*/
          AnimatedTextHeader(
            firstWord: "Coming ",
            secondWord: "Soon",
            isSocial: false,
          ),
          /*-----------------------------------------------------------------------------------------------*/
          /*-------------------------------------  Spinner -----------------------------------*/
          /*-----------------------------------------------------------------------------------------------*/
          Center(child: Spinner(color: color2)),

        ],
      ),
    );
  }
}

