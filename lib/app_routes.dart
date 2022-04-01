
import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/screens/ad3ya_app/ad3ya_main_app.dart';
import 'package:muslim_dialy_guide/screens/ad3ya_app/quraan_ad3ya.dart';
import 'package:muslim_dialy_guide/screens/ad3ya_app/sunna_ad3ya.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/azkar_main_page.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/morning_night/home.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/salah_azkar.dart';
import 'package:muslim_dialy_guide/screens/azkar_app/sleep_azkar.dart';
import 'package:muslim_dialy_guide/screens/comming%20soon/coming_home_spinner.dart';
import 'package:muslim_dialy_guide/screens/home_app/home.dart';
import 'package:muslim_dialy_guide/screens/praying_time/praying_time.dart';
import 'package:muslim_dialy_guide/screens/qiblat/qibla.dart';
import 'package:muslim_dialy_guide/screens/quraan_arabic/quraan_arabic.dart';
import 'package:muslim_dialy_guide/screens/quran_count/main.dart';
import 'package:muslim_dialy_guide/screens/rate_the_app/app_rate_page_view.dart';
import 'package:muslim_dialy_guide/screens/sbha/sbha.dart';
import 'package:muslim_dialy_guide/screens/splash_screens/arabic_quran_splash_screen.dart';


/*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- App Routes  ------------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
Map<String, Widget Function(BuildContext)> appRoutes = {
  /*------------------------------ Muslim Guide Home Page  ------------------------------------*/
  MuslimGuideHomePage.routeName: (context) => MuslimGuideHomePage(),
  /*---------------------------- Arabic Quran SplashScreen  ----------------------------------*/
  ArabicQuranSplashScreen.routeName : (context) => ArabicQuranSplashScreen(),
  /*---------------------------- Arabic Quran Screen  ----------------------------------*/
  QuranArabic.routeName : (context) => QuranArabic(),
  /*---------------------------- Praying Time Screen  ----------------------------------*/
  PrayingTime.routeName : (context) => PrayingTime(),
  /*---------------------------- Qibla Page Screen  ----------------------------------*/
  QiblaPage.routeName : (context) => QiblaPage(),
  /*-------------------------- Azkar Elmoslem Screen  ----------------------------------*/
  AzkarElmoslemMainPage.routeName : (context) => AzkarElmoslemMainPage(),
  /*------------------------ Azkar Elsalah Screen  ----------------------------------*/
  AzkarElsalah.routeName : (context) => AzkarElsalah(),
  /*------------------------ Azkar Elnom Screen  ----------------------------------*/
  AzkarElnom.routeName : (context) => AzkarElnom(),
  /*------------------------ Morning/Night Screen  ----------------------------------*/
  MorningNightHome.routeName :(context) => MorningNightHome(),
  /*------------------------ Sebha Screen  ----------------------------------*/
  SbhaScreen.routeName : (context) =>SbhaScreen(),
  /*------------------------ Coming Screen  ----------------------------------*/
  ComingSoonSpinner.routeName : (context) =>ComingSoonSpinner(),
  /*------------------- Motshabhat Elqoraan Screen  ---------------------------*/
  MotshabhatElqoraan.routeName : (context) =>MotshabhatElqoraan(),
  /*------------------- Rate the app Screen  ---------------------------*/
  AppRatePageView.routeName : (context) =>AppRatePageView(),
  Ad3yaMainPage.routeName : (context) => Ad3yaMainPage(),
  Ad3yaElquraan.routeName : (context) => Ad3yaElquraan(),
  Ad3yaElsunnah.routeName : (context) => Ad3yaElsunnah(),

};
