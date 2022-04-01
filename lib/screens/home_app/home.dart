import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/azkar_main_page.dart';
import 'package:muslim_dialy_guide/screens/comming%20soon/coming_home_spinner.dart';
import 'package:muslim_dialy_guide/screens/home_app/hint_circle.dart';
import 'package:muslim_dialy_guide/screens/praying_time/praying_time.dart';
import 'package:muslim_dialy_guide/screens/qiblat/qibla.dart';
import 'package:muslim_dialy_guide/screens/quran_count/main.dart';
import 'package:muslim_dialy_guide/screens/sbha/sbha.dart';
import 'package:muslim_dialy_guide/screens/splash_screens/arabic_quran_splash_screen.dart';
import 'package:muslim_dialy_guide/widgets/custom_background.dart';
import 'package:muslim_dialy_guide/widgets/home_container.dart';
import 'package:muslim_dialy_guide/constants.dart';

import 'delayed_animation.dart';

class MuslimGuideHomePage extends StatefulWidget {
  static const String routeName = 'homeApp';

  @override
  _MuslimGuideHomePageState createState() => _MuslimGuideHomePageState();
}

class _MuslimGuideHomePageState extends State<MuslimGuideHomePage> {
  final int delayedAmount = 500;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: CustomBackground()),
          SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DelayedAnimation(
                      child: Text(
                        " Mohamed Samir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                      delay: delayedAmount + 1000,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "Muslim Guide",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                      delay: delayedAmount + 2000,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "Your guide",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "to Jennah",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    DelayedAnimation(
                      delay: delayedAmount + 4000,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        /*-----------------------------------------------------------------------------------------------*/
                        /*--------------------------------  App Contents  -----------------------------------*/
                        /*-----------------------------------------------------------------------------------------------*/
                        child: Row(
                          children: [
                            /*-----------------------------------------------------------------------------------------------*/
                            /*--------------------------------  Arabic Quraan Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/quran_ar.png",
                                  color: color2,
                                  title: "Quraan"),
                              onTap: () => Navigator.pushNamed(
                                  context, ArabicQuranSplashScreen.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*--------------------------------  Translated Quraan Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/quran.png",
                                  color: color2,
                                  title: "Translated Quraan"),
                              onTap: () => Navigator.pushNamed(
                                  context, ComingSoonSpinner.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*-----------------------------  Motshabhat El Quraan Container  ---------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/114.png",
                                  color: color2,
                                  title: "Mutashabihat al quran"),
                              onTap: () => Navigator.pushNamed(
                                  context, MotshabhatElqoraan.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*--------------------------------  Azkar Elmoslem Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                                child: HomeContainer(
                                    image: "assets/tasbeh.png",
                                    color: color2,
                                    title: "Azkar"),
                                onTap: () => Navigator.pushNamed(
                                    context, AzkarElmoslemMainPage.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*-------------------------------- Sebha App Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/azkar.png",
                                  color: color2,
                                  title: "Elsebha"),
                              onTap: () => Navigator.pushNamed(
                                  context, SbhaScreen.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*-------------------------------- Praying time App Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/praying.png",
                                  color: color2,
                                  title: "Praying time"),
                              onTap: () => Navigator.pushNamed(
                                  context, PrayingTime.routeName),
                            ),
                            /*-----------------------------------------------------------------------------------------------*/
                            /*-------------------------------- ElQibla App Container  -----------------------------------*/
                            /*-----------------------------------------------------------------------------------------------*/
                            GestureDetector(
                              child: HomeContainer(
                                  image: "assets/mecca.png",
                                  color: color2,
                                  title: "El-Qibla"),
                              onTap: () => Navigator.pushNamed(
                                  context, QiblaPage.routeName),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*-----------------------------------------------------------------------------------------------*/
                    /*-------------------------------- Hint Circle  -----------------------------------*/
                    /*-----------------------------------------------------------------------------------------------*/
                    DelayedAnimation(
                      delay: delayedAmount + 5000,
                      child: HintCircle(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
