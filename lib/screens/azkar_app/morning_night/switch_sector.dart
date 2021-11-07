import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/provides/morning_night_provider.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/morning_night/morning_azkar_page.dart';
import 'package:provider/provider.dart';

import 'Azkar_elnight.dart';


class HomeSwitchSector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<MorningOrNightProvider>(context) ;
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      crossFadeState: homeProvider.fadeState,
      alignment: Alignment.center,
      /*-----------------------------------------------------------------------------------------------*/
      /*--------------------------------  Morning Tab  -----------------------------------*/
      /*-----------------------------------------------------------------------------------------------*/
      firstChild: AzkarElmorning(),
      firstCurve: Curves.easeInOut,
      /*-----------------------------------------------------------------------------------------------*/
      /*--------------------------------  Night Tab  -----------------------------------*/
      /*-----------------------------------------------------------------------------------------------*/
      secondChild: AzkarElnight(),
      secondCurve: Curves.easeInOut,
    );
  }
}
