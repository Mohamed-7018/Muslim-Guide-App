import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/router/app_routes.dart';
import 'package:muslim_dialy_guide/app/core/theme/dark_theme.dart';
import 'package:muslim_dialy_guide/app/core/theme/light_theme.dart';
import 'package:muslim_dialy_guide/app/data/provider/azkar_provider/azkar_fehrs_provider.dart';
import 'package:muslim_dialy_guide/app/data/provider/theme_provider.dart';
import 'package:muslim_dialy_guide/app/view/screens/home_page/home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*-----------------------------------------------------------------------------------------------*/
        /*---------------------------------------  Theme Provider  --------------------------------------*/
        /*-----------------------------------------------------------------------------------------------*/
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        /*-----------------------------------------------------------------------------------------------*/
        /*---------------------------------------  azkar Provider  --------------------------------------*/
        /*-----------------------------------------------------------------------------------------------*/
        ChangeNotifierProvider<AzkarFehrsProvider>(
            create: (context) => AzkarFehrsProvider()),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              /*--------------------------  determining the theme of e app  ------------------------*/
              themeMode: (value.theme) ? ThemeMode.dark : ThemeMode.light,
              // home:  const MarketingNewsPage(),
              routes: appRoutes,
              initialRoute: MUslimGuideAppHomePage.routeName,
              // initialRoute: init == 0
              //     ? OnBoardingScreen.routeName
              //     : SplashScreen.routeName
            );
          },
        );
      },
    );
  }
}
