import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/salah_azkar.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/sleep_azkar.dart';
import 'package:muslim_dialy_guide/screens/sbha/sbha.dart';
import 'package:muslim_dialy_guide/widgets/animated_text_header.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:muslim_dialy_guide/widgets/azkar/sbha.dart';
import 'package:muslim_dialy_guide/widgets/or_widget.dart';

import '../../constants.dart';
import 'morning_night/home.dart';

class AzkarElmoslemMainPage extends StatefulWidget {
  static const String routeName = 'Azkarpage';

  const AzkarElmoslemMainPage({Key key}) : super(key: key);

  @override
  _AzkarElmoslemMainPageState createState() => _AzkarElmoslemMainPageState();
}

class _AzkarElmoslemMainPageState extends State<AzkarElmoslemMainPage> {

  /*-----------------------------------------------------------------------------------------------*/
  /*------------------------------------  Azkar types list  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  List<String> _azkarTypes = [
    "Morning/Night",
    "Praying Azkar",
    "Sleeping Azkar",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: GlobalAppBar(
        title: "Azkar Elmoslem",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  /*-----------------------------------------------------------------------------------------------*/
                  /*------------------------------------  Animated text Header  -----------------------------------*/
                  /*-----------------------------------------------------------------------------------------------*/
                  Container(
                    width: double.infinity,
                    child: AnimatedTextHeader(
                      isSocial: false,
                    ),
                  ),
                  const SizedBox(height: 5),
                  /*-----------------------------------------------------------------------------------------------*/
                  /*------------------------------------  S shape btns column  -----------------------------------*/
                  /*-----------------------------------------------------------------------------------------------*/
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => InkWell(
                        onTap: () {
                          /*-----------------------------------------------------------------------------------------------*/
                          /*--------------------------------  Morning/Night home  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          if (index == 0) {
                            Navigator.pushNamed(
                                context, MorningNightHome.routeName);
                          }
                          /*-----------------------------------------------------------------------------------------------*/
                          /*--------------------------------  Azkar elsalah  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          if (index == 1) {
                            Navigator.pushNamed(
                                context, AzkarElsalah.routeName);
                          }
                          /*-----------------------------------------------------------------------------------------------*/
                          /*--------------------------------  Azkar elnom  -----------------------------------*/
                          /*-----------------------------------------------------------------------------------------------*/
                          if (index == 2) {
                            Navigator.pushNamed(context, AzkarElnom.routeName);
                          }
                        },
                        splashColor: color2,
                        borderRadius: (index == 1)
                            ? BorderRadius.only(
                                topRight: Radius.circular(80),
                                bottomLeft: Radius.circular(80),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80),
                              ),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.1,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.pink[700], width: 2),
                            borderRadius: (index == 1)
                                ? BorderRadius.only(
                                    topRight: Radius.circular(80),
                                    bottomLeft: Radius.circular(80),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(80),
                                    bottomRight: Radius.circular(80),
                                  ),
                            color: Colors.indigo.withOpacity(
                                0.3), //Theme.of(context).primaryColor.withOpacity(0.55),
                          ),
                          child: Text(
                            _azkarTypes[index],
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.w900,
                                      // color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          /*-----------------------------------------------------------------------------------------------*/
          /*--------------------------------  OR Widget -----------------------------------*/
          /*-----------------------------------------------------------------------------------------------*/
          OrWidget(),
          SizedBox(
            height: 20,
          ),
          /*-----------------------------------------------------------------------------------------------*/
          /*--------------------------------  Sebha btn  -----------------------------------*/
          /*-----------------------------------------------------------------------------------------------*/
          SbhaBtn(
            text: "Sbha",
            onClicked: () => Navigator.pushNamed(context, SbhaScreen.routeName),
          )
        ],
      ),
    );
  }
}
