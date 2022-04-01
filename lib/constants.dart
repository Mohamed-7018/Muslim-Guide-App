import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/widgets/show_alert_dialog.dart';


class Constants {
 static String rate;
 //-------------------------------------------------------------------/
 //----------------- submit alert dialog --------------------------/
 //-------------------------------------------------------------------/
 static Future<void> confirmCopyLink(BuildContext context,
     {String link,
      @required String title,
      @required String content,
      @required String defaultActionText,
      String cancelActionText}) async {
  final dialogRequestSignOut = await showAlertDialogue(
   context,
   title: title,
   content: content,
   defaultactiontext: defaultActionText,
   cancelactiontext: cancelActionText,
  );
  if (dialogRequestSignOut == true && link != null) {
   //Constants.launchUniversalLink(link);
  } else {}
 }
 /*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- Lat/Long  ------------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
 static  double lat  ; //=30.0444
 static  double long   ; //= 31.2357
/*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- time zone  ------------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
 static final double timeZone = 2.0;
}

/*---------------------------------------------------------------------------------------------*/
/*---------------------------------- App Custom Colors ----------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
 Color kCustomsColor = Color(0xFFFF5B5B);
 Color color2 = Colors.pink[800];

/*---------------------------------------------------------------------------------------------*/
/*---------------------------------- App Carousel type ----------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
enum CarouselType { Morning, Night }

