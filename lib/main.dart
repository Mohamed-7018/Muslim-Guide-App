import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app_routes.dart';
import 'package:muslim_dialy_guide/provides/morning_night_provider.dart';
import 'package:muslim_dialy_guide/provides/theme_provider.dart';
import 'package:muslim_dialy_guide/screens/home_app/home.dart';
import 'package:muslim_dialy_guide/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*-----------------------------------------------------------------------------------------------*/
        /*---------------------------------------  Theme Provider  --------------------------------------*/
        /*-----------------------------------------------------------------------------------------------*/
        ChangeNotifierProvider<MorningOrNightProvider>(
            create: (context) => MorningOrNightProvider()),
        /*-----------------------------------------------------------------------------------------------*/
        /*---------------------------------------  Theme Provider  --------------------------------------*/
        /*-----------------------------------------------------------------------------------------------*/
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        /*---------------------------   theme provider  ----------------------------*/
        return Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: (value.theme) ? ThemeMode.dark : ThemeMode.light,
             // home: QuranArabic()
              initialRoute: MuslimGuideHomePage.routeName,
              routes: appRoutes,
            );
          },
        );
      },
    );
  }
}
