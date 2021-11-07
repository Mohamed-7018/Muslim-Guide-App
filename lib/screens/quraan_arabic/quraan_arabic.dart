import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_dialy_guide/models/surah.dart';
import 'package:muslim_dialy_guide/screens/quraan_arabic/surah_list_builder.dart';
import 'package:muslim_dialy_guide/globals/globals.dart' as globals;
import 'package:muslim_dialy_guide/screens/quraan_arabic/surah_view_builder.dart';
import 'package:muslim_dialy_guide/widgets/arabic_quraan/custom_bottom_navigation_bar.dart';
import 'package:muslim_dialy_guide/widgets/arabic_quraan/nav_bar.dart';
import 'package:muslim_dialy_guide/widgets/arabic_quraan/slider_alert.dart';
import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranArabic extends StatefulWidget {
  static const String routeName = 'quranArabicApp';

  @override
  _QuranArabicState createState() => _QuranArabicState();
}

class _QuranArabicState extends State<QuranArabic> {
  SharedPreferences prefs;

  /*-----------------------------------------------------------------------------------------------*/
  /*------------------------------ List of sur parse from json  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  List<Surah> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Surah>((json) => new Surah.fromJson(json)).toList();
  }


  /*-----------------------------------------------------------------------------------------------*/
  /*-------------------------------- Getting Screen Brightness  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  void getScreenBrightness() async {
    globals.brightnessLevel = await Screen.brightness;
  }

  @override
  void initState() {
    getScreenBrightness();
    if (globals.bookmarkedPage == null) {
              globals.bookmarkedPage = globals.DEFAULT_BOOKMARKED_PAGE;
            }
    /*-----------------------------------------------------------------------------------------------*/
    /*---------------------- Prevent screen from going into sleep mode ------------------------------*/
    /*-----------------------------------------------------------------------------------------------*/
    Screen.keepOn(true);




    /*-----------------------------------------------------------------------------------------------*/
    /*----------------------    set saved Brightness level  ------------------------------*/
    /*-----------------------------------------------------------------------------------------------*/
    Screen.setBrightness(globals.brightnessLevel);
    Screen.keepOn(true);

    super.initState();
  }



  /*-----------------------------------------------------------------------------------------------*/
  /*-------------------------------- Setting Screen Brightness  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  _setBrightness() {
    if (globals.brightnessLevel == null) {
      getScreenBrightness();
    }
    showDialog(context: this.context, builder: (context) => SliderAlert());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Arabic Quraan",
          style: GoogleFonts.lilyScriptOne(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.highlight,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              _setBrightness();
            },
          ),
        ],
        leading: CupertinoNavigationBarBackButton(
          color: Theme.of(context).accentColor,
        ),
      ),
      body: Container(
        child: Directionality(
          textDirection: TextDirection.ltr,

          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              /*-----------------------------------------------------------------------------------------------*/
              /*-------------------------------- Bookmarked page  -----------------------------------*/
              /*-----------------------------------------------------------------------------------------------*/
              SurahViewBuilder(pages: globals.bookmarkedPage - 1),
              /*-----------------------------------------------------------------------------------------------*/
              /*-------------------------------- last viewed page  -----------------------------------*/
              /*-----------------------------------------------------------------------------------------------*/
              globals.lastViewedPage !=null ? SurahViewBuilder(pages: globals.lastViewedPage - 1) :  SurahViewBuilder(pages: 569),
              /*-----------------------------------------------------------------------------------------------*/
              /*-------------------------------- Surah list future builder  -----------------------------------*/
              /*-----------------------------------------------------------------------------------------------*/
              new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/json/surah.json'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Surah> surahList =
                          parseJson(snapshot.data.toString());
                      return surahList.isNotEmpty
                          ? new SurahListBuilder(surah: surahList)
                          : new Center(child: new CircularProgressIndicator());
                    } else {
                      return new Center(child: new CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
      /*-----------------------------------------------------------------------------------------------*/
      /*-------------------------------- btn nav bar  -----------------------------------*/
      /*-----------------------------------------------------------------------------------------------*/
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
