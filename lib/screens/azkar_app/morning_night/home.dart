

import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/morning_night/azkar_switch_tab.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/morning_night/switch_sector.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';


class MorningNightHome extends StatelessWidget {
  static const String routeName = 'MorningNightHome';

  const MorningNightHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar (
        title: "Morning/Night Azkar",
      ),
      body: SingleChildScrollView (
        child: Column (
          children: [
            SizedBox(
              height: 40,
            ),
            /*-----------------------------------------------------------------------------------------------*/
            /*--------------------------------  Switch Tab  -----------------------------------*/
            /*-----------------------------------------------------------------------------------------------*/
            HomeSwitchTab(),
            /*-----------------------------------------------------------------------------------------------*/
            /*--------------------------------  Switch Sector  -----------------------------------*/
            /*-----------------------------------------------------------------------------------------------*/
            Container(
              height: MediaQuery.of(context).size.height*0.7,
                child: HomeSwitchSector()),
          ],
        ),
      ),
    );
  }
}
