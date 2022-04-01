import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:muslim_dialy_guide/screens/quran_count/constants.dart';

import 'package:muslim_dialy_guide/screens/quran_count/screens/search_page.dart';


class MotshabhatElqoraan extends StatelessWidget {
  static  String routeName = "/motshabhatElqoraan";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ar', 'SA'),
      ],
      title: '114',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(
          0xFF0A0E21,
        ),
        cardColor: Color(0xFF1d1e33),
        scaffoldBackgroundColor: Color(
          0xFF0A0E21,
        ),
        accentColor: PRIMARY_COLOR,
      ),
      locale: Locale('ar', 'SA'),
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}
