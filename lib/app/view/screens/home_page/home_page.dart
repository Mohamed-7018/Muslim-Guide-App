import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/view/widgets/home_page/custom_background.dart';
import 'package:muslim_dialy_guide/app/view/widgets/home_page/delayed_animation.dart';
import 'package:muslim_dialy_guide/app/view/widgets/home_page/hint_circle.dart';
import 'package:muslim_dialy_guide/app/view/widgets/home_page/home_container.dart';

class MUslimGuideAppHomePage extends StatelessWidget {
  static const String routeName = 'homeApp';
  const MUslimGuideAppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int delayedAmount = GlobalAppSizes.s_500.toInt();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: CustomBackground()),
          SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              child: Center(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DelayedAnimation(
                    child: Text(
                      GlobalAppStrings.muslimGuide,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GlobalAppSizes.s_35,
                      ),
                    ),
                    delay: delayedAmount + GlobalAppSizes.s_1000.toInt(),
                  ),
                  GlobalAppSizedBox.h_15,
                  DelayedAnimation(
                    child: Text(
                      GlobalAppStrings.yourGuide,
                      style: TextStyle(
                        fontSize: GlobalAppSizes.s_20,
                      ),
                    ),
                    delay: delayedAmount + GlobalAppSizes.s_3000.toInt(),
                  ),
                  DelayedAnimation(
                    child: Text(
                      GlobalAppStrings.toJennah,
                      style: TextStyle(
                        fontSize: GlobalAppSizes.s_20,
                      ),
                    ),
                    delay: delayedAmount + GlobalAppSizes.s_3000.toInt(),
                  ),
                  GlobalAppSizedBox.h_15,
                  DelayedAnimation(
                    delay: delayedAmount + GlobalAppSizes.s_4000.toInt(),
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
                                image: GlobalAppImages.quraanSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.quraan),
                            // onTap: () => Navigator.pushNamed(
                            //     context, ArabicQuranSplashScreen.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*--------------------------------  Translated Quraan Container  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image:
                                    GlobalAppImages.translatedQuraanSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.translatedQuraan),
                            // onTap: () => Navigator.pushNamed(
                            //     context, ComingSoonSpinner.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*-----------------------------  Motshabhat El Quraan Container  ---------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.mutashabihatSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.mutashabihatElQuraan),
                            // onTap: () => Navigator.pushNamed(
                            //     context, MotshabhatElqoraan.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*--------------------------------  Azkar Elmoslem Container  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.azkarSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.azkar),
                            // onTap: () => Navigator.pushNamed(
                            //     context, AzkarElmoslemMainPage.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*-------------------------------- Sebha App Container  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.elsebhaSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.elsebha),
                            // onTap: () => Navigator.pushNamed(
                            //     context, SbhaScreen.routeName),
                          ),
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.doaaSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.doaa),
                            // onTap: () => Navigator.pushNamed(
                            //     context, Ad3yaMainPage.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*-------------------------------- Praying time App Container  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.prayingTimeSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.prayingTime),
                            // onTap: () => Navigator.pushNamed(
                            //     context, PrayingTime.routeName),
                          ),
                          /*-----------------------------------------------------------------------------------------------*/
                          /*-------------------------------- ElQibla App Container  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.elqiblaSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.elqibla),
                            // onTap: () => Navigator.pushNamed(
                            //     context, QiblaPage.routeName),
                          ),
                          GestureDetector(
                            child: HomeContainer(
                                image: GlobalAppImages.rateAppSectionLogo,
                                color: GlobalAppColors.appPink,
                                title: GlobalAppStrings.rateTheApp),
                            // onTap: () => Navigator.pushNamed(
                            //     context, AppRatePageView.routeName),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*-----------------------------------------------------------------------------------------------*/
                  /*-------------------------------- Hint Circle  -----------------------------------*/
                  /*-----------------------------------------------------------------------------------------------*/
                  DelayedAnimation(
                    delay: delayedAmount + GlobalAppSizes.s_5000.toInt(),
                    child: HintCircle(),
                  ),
                  GlobalAppSizedBox.h_10,
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
